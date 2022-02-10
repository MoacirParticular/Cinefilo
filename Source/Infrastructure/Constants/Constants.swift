//
//  Constants.swift
//  Cinefilo
//
//  Created by Moacir Ezequiel Lamego on 04/02/22.
//

import Foundation

enum TipoAmbiente {
    case desenvolvimento
    case sandbox
    case producao
    case local
}

struct Constants {
    static let bundleAppealCopy: Bundle = .current
    
    static let tipoAmbiente: TipoAmbiente = TipoAmbiente.producao
    static let apiKey = "api_key=f5ee5a15ac98565adcee8a270babceab"
    static let apiLanguage = "language=pt-BR"

    struct ApiError {
        static let badRequest = 400
        static let emptyResponse = "emptyResponse"
        static let invalidResponse = "invalidResponse"
        
    }

    struct ParametersKeys {
        static let header = "header"
        static let method = "method"
        static let path = "path"
        static let body = "body"
        
        static let mediaType = "mediaType"
        static let timeWindow = "timeWindow"
    }

    struct HTTPMethod {
        static let get = "GET"
        static let post = "post"
        static let patch = "patch"
    }

    struct UrlBase {
        static let local = "https://api.themoviedb.org/3"
        static let desenvolvimento = "https://api.themoviedb.org/3"
        static let sandbox = "https://api.themoviedb.org/3"
        static let producao = "https://api.themoviedb.org/3"
    }


    static func getUrlBase(tipoAmbiente: TipoAmbiente) -> String {
        switch tipoAmbiente {
        case .desenvolvimento:
            return UrlBase.desenvolvimento
        case .sandbox:
            return UrlBase.sandbox
        case .producao:
            return UrlBase.producao
        case .local:
            return UrlBase.local
        }
    }

    static func getUrlApi(tipoAmbiente: TipoAmbiente) -> String {
        "\(getUrlBase(tipoAmbiente: tipoAmbiente))/"
    }
}
