//
//  TrendingViewModel.swift
//  Cinefilo
//
//  Created by Moacir Ezequiel Lamego on 04/02/22.
//

import Foundation

struct TrendingViewModel {
    let page: Int
    let results: [ResultViewModel]
    let totalPages, totalResults: Int

    init() {
        self.page = 0
        self.results = [ResultViewModel()]
        self.totalPages = 0
        self.totalResults = 0
    }
    
    init(model: TrendingModel) {
        self.page = model.page
        self.results = model.results.map { ResultViewModel(model: $0 ) }
        self.totalPages = model.totalPages
        self.totalResults = model.totalResults
    }
}


struct ResultViewModel {
    
    init () {
        
    }
    
    init(model: ResultModel) {
        
    }
}
