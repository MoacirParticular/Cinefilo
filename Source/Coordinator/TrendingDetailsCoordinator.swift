//
//  TrendingDetailsCoordinator.swift
//  Cinefilo
//
//  Created by Moacir Ezequiel Lamego on 14/02/22.
//

import UIKit

class TrendingDetailsCoordinator: Coordinator {
    var navigationController: UINavigationController
    let trendingViewModel: TrendingViewModel
    
    init(navigationController: UINavigationController, trendingViewModel: TrendingViewModel) {
        self.navigationController = navigationController
        self.trendingViewModel = trendingViewModel
    }
    
    func start() {
        let viewController = TrendingDetailsViewController()
        viewController.trendingDetails.setDetails(trendingViewModel: trendingViewModel)
        self.navigationController.pushViewController(viewController, animated: false)
    }
}
