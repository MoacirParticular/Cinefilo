//
//  TrendingCoordinator.swift
//  Cinefilo
//
//  Created by Moacir Ezequiel Lamego on 10/02/22.
//

import Foundation
import UIKit


class TrendingCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = TrendingViewController()
        
        viewController.onSelectedTrending = { viewModel in
            self.gotoDetails(viewModel: viewModel)
        }
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    private func gotoDetails(viewModel: TrendingViewModel?) {
        if let vm = viewModel {
            let coordinator = TrendingDetailsCoordinator(navigationController: self.navigationController,
                                                         trendingViewModel: vm)
            
            coordinator.start()
        }
    }
}
