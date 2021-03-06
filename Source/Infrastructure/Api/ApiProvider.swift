//
//  ApiProvider.swift
//  Cinefilo
//
//  Created by Moacir Ezequiel Lamego on 04/02/22.
//

import Foundation

public typealias CompletionHandler = (Result<MyResponse, Error>) -> Void

public typealias CompletionData = (statusCode: Int, data: Data)
public typealias CompletionCallBack = (@escaping () throws -> CompletionData) -> Void

public class ApiProvider {
    /// shared Singleton Instance
    public static let shared = ApiProvider()
    
    /// Executa um request na api
    /// Parametes:
    /// - params: Body, Header, Path
    /// - finalUrl: final da Url
    /// - completion: callback executado quando request termina
    public func request(parameters: [AnyHashable: Any], finalUrl: String, completion: @escaping CompletionCallBack) {
        
        let method:String = parameters[Constants.ParametersKeys.method] as! String
        let urlStr = "\(Constants.getUrlApi(tipoAmbiente: Constants.tipoAmbiente))\(finalUrl)?\(Constants.apiKey)&\(Constants.apiLanguage)"

        guard let url = URL(string: urlStr) else {
            return
        }

        let urlRequest = NSMutableURLRequest(url: url)
        urlRequest.httpMethod = method

        DebugLogger.log("path -> \(urlStr)")

        let task = URLSession.shared.dataTask(with: urlRequest as URLRequest) { (data, response, error) in
            do {
                let statusCode = (response as? HTTPURLResponse)?.statusCode
                let myResponse = MyResponse(data: data, error: error, statusCode: statusCode, success: false)
                
                if let error = error {
                    DebugLogger.log(error)
                    completion { try self.handlerresponse(myResponse) }
                }
                
                if let data = data {
                    DebugLogger.log(data.prettyPrintedJSONString())
                    completion { try self.handlerresponse(myResponse) }
                } else {
                    DebugLogger.log("Error ao Executar uma chamda de API")
                    completion { try self.handlerresponse(myResponse) }
                }
            }
        }
        
        task.resume();
    }
    
    private func handlerresponse(_ myResponse: MyResponse?) throws -> CompletionData! {
        guard let response = myResponse else {
            throw ApiError.emptyResponse
        }

        if response.error != nil {
            try self.handlerError(error: response.error!, statuscode: response.statusCode)
        }

        switch response.statusCode {
        case 200...299:
            if let data = response.data {
                return (response.statusCode, data)
            }
            
            if response.data != nil && JSONSerialization.isValidJSONObject(response.data as Any), let jsonData = try? JSONSerialization.data(withJSONObject: response.data as Any, options: []) {
                return (response.statusCode, jsonData)
            } else {
                throw ApiError.invalidResponse(response.statusCode)
            }
        default:
            throw ApiError.unknownError(response.statusCode)
        }
    }
    
    private func handlerError(error: Error, statuscode: Int) throws  {
        if let errorCode = ApiErrorCode(rawValue: error._code) {
            switch errorCode {
            case .serverErrorStatusCode:
                throw KnownApiFailures.serverErrorStatusCode(error)
            }
        }

        throw ApiError.failure(error, statuscode)
    }
}
