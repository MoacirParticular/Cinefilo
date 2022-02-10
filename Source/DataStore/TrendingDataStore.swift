//
//  TrendingDataStore.swift
//  Cinefilo
//
//  Created by Moacir Ezequiel Lamego on 10/02/22.
//

import Foundation

class TrendingDataStore {
    var trending: TrendingViewModel!
    
    init() {
        trending = TrendingViewModel()
    }
    
    convenience init(withTrendingModel trendingModel: TrendingModel) {
        self.init()
        
        trending = TrendingViewModel(model: trendingModel)
    }
}
