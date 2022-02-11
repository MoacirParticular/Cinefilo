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
    
    func getTrendings() {
        let manager: TrendingManagerProtocol = TrendingManager()
        
        manager.requestTrendings(mediaType: MediaType.all,
                                 timeWindow: TimeWindows.week) { trendingViewModel in
            self.trending = trendingViewModel
        } failureHandler: { error in
            DebugLogger.log("Erro")
            self.trending = TrendingViewModel()
        }
    }
}
