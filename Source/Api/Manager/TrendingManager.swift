//
//  TrendingManager.swift
//  Cinefilo
//
//  Created by Moacir Ezequiel Lamego on 04/02/22.
//

import Foundation

protocol TrendingManagerProtocol: BaseManager {
    func requestTrendings(mediaType: MediaType, timeWindow: TimeWindows, sucessHandler: @escaping ((Bool) -> Void), failureHandler: @escaping ApiProviderFailureHandler)
}

class TrendingManager: BaseManager, TrendingManagerProtocol {
    
    private var apiProvider: ApiProvider
    
    init(apiProvider: ApiProvider = .shared) {
        self.apiProvider = apiProvider
    }
    
    
    func requestTrendings(mediaType: MediaType, timeWindow: TimeWindows, sucessHandler: @escaping ((Bool) -> Void), failureHandler: @escaping ApiProviderFailureHandler) {
        let paramters: [AnyHashable: Any] = [Constants.ParametersKeys.method: Constants.HTTPMethod.get,
                                             Constants.ParametersKeys.path: [Constants.ParametersKeys.mediaType: Constants.ParametersKeys.mediaType,
                                                                             Constants.ParametersKeys.timeWindow: Constants.ParametersKeys.timeWindow]]
        
        let to = "trending/\(mediaType.rawValue)/\(timeWindow.rawValue)"
        
        self.apiProvider.sendRequest(to: to,
                                     with: paramters,
                                     expecting: TrendingModel.self) { result in
            
            switch result {
            case .success(let model) :
                let viewModel = TrendingViewModel(model: model)
                
                DataStore.trendingsDataStore.trending = viewModel
                sucessHandler(true)
            case .failure(let error):
                DebugLogger.log(error)
                
                guard let apiError = error as? ApiError else {
                    failureHandler(ApiError.emptyResponse)
                    return
                }
                
                failureHandler(apiError)
            }
        
        }
        
    }
}
