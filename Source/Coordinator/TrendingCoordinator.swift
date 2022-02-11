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
        
        self.navigationController.pushViewController(viewController, animated: false)
    }
}
