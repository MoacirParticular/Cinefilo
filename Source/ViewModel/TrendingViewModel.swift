//
//  TrendingViewModel.swift
//  Cinefilo
//
//  Created by Moacir Ezequiel Lamego on 04/02/22.
//

import UIKit

class TrendingsViewModel: ViewModel<TrendingModel> {
    var page: Int
    var trendingsResults: [TrendingViewModel]
    var totalPages, totalResults: Int

    init() {
        self.page = 0
        self.trendingsResults = [TrendingViewModel()]
        self.totalPages = 0
        self.totalResults = 0
        
        super.init(model: TrendingModel())
    }
    
    override init(model: TrendingModel) {
        self.page = model.page
        self.trendingsResults = model.results.map { TrendingViewModel(model: $0 ) }
        self.totalPages = model.totalPages
        self.totalResults = model.totalResults
        
        super.init(model: model)

    }
}

struct TrendingViewModel {
    var genreIDS: [Int]
    var originalLanguageViewModel: OriginalLanguage
    var originalTitle: String
    var posterPath: String
    var video: Bool
    var voteAverage: Double
    var id: Int
    var overview: String
    var releaseDate: String
    var voteCount: Int
    var adult: Bool
    var backdropPath: String
    var title: String?
    var popularity: Double
    var mediaType: MediaTypeModel
    var originalName: String
    var originCountry: [String]
    var firstAirDate, name: String
    
    init () {
        self.genreIDS = [0]
        self.originalLanguageViewModel = OriginalLanguage.en
        self.originalTitle = String.empty
        self.posterPath = String.empty
        self.video = false
        self.voteAverage = 0.0
        self.id = 0
        self.overview = String.empty
        self.releaseDate = String.empty
        self.voteCount = 0
        self.adult = false
        self.backdropPath = String.empty
        self.title = String.empty
        self.popularity = 0.0
        self.mediaType = MediaTypeModel.movie
        self.originalName = String.empty
        self.originCountry = [String.empty]
        self.firstAirDate  = String.empty
        self.name = String.empty
    }
    
    init(model: ResultModel) {
        self.genreIDS = model.genreIDS
        self.originalLanguageViewModel = model.originalLanguage
        self.originalTitle = model.originalTitle ?? String.empty
        self.posterPath = model.posterPath
        self.video = model.video ?? false
        self.voteAverage = model.voteAverage
        self.id = model.id
        self.overview = model.overview
        self.releaseDate = model.releaseDate ?? String.empty
        self.voteCount = model.voteCount
        self.adult = model.adult ?? false
        self.backdropPath = model.backdropPath
        self.title = model.title
        self.popularity = model.popularity
        self.mediaType = model.mediaType
        self.originalName = model.originalName ?? String.empty
        self.originCountry = model.originCountry ?? [String.empty]
        self.firstAirDate  = model.firstAirDate ?? String.empty
        self.name = model.name ?? String.empty
    }
}
