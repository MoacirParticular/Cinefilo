//
//  TrendingModel.swift
//  Cinefilo
//
//  Created by Moacir Ezequiel Lamego on 04/02/22.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

//
// To read values from URLs:
//
//   let task = URLSession.shared.welcomeTask(with: url) { welcome, response, error in
//     if let welcome = welcome {
//       ...
//     }
//   }
//   task.resume()

import Foundation

struct TrendingModel: Decodable {
    let page: Int
    let results: [ResultModel]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.resultTask(with: url) { result, response, error in
//     if let result = result {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Result
struct ResultModel: Decodable {
    let genreIDS: [Int]
    let originalLanguage: OriginalLanguageModel
    let originalTitle: String?
    let posterPath: String
    let video: Bool?
    let voteAverage: Double
    let id: Int
    let overview: String
    let releaseDate: String?
    let voteCount: Int
    let adult: Bool?
    let backdropPath: String
    let title: String?
    let popularity: Double
    let mediaType: MediaTypeModel
    let originalName: String?
    let originCountry: [String]?
    let firstAirDate, name: String?

    enum CodingKeys: String, CodingKey {
        case genreIDS = "genre_ids"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case video
        case voteAverage = "vote_average"
        case id, overview
        case releaseDate = "release_date"
        case voteCount = "vote_count"
        case adult
        case backdropPath = "backdrop_path"
        case title, popularity
        case mediaType = "media_type"
        case originalName = "original_name"
        case originCountry = "origin_country"
        case firstAirDate = "first_air_date"
        case name
    }
}

enum MediaTypeModel: String, Codable {
    case movie = "movie"
    case tv = "tv"
}

enum OriginalLanguageModel: String, Codable {
    case en = "en"
    case es = "es"
    case ja = "ja"
    case ko = "ko"
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - URLSession response handlers

extension URLSession {
    fileprivate func decodableTask<T: Decodable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
        }
    }

    func TrendingModelTask(with url: URL, completionHandler: @escaping (TrendingModel?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.decodableTask(with: url, completionHandler: completionHandler)
    }
}


