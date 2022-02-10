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
//    var window: UIWindow
//
//    init(window: UIWindow) {
//        self.window = window
//    }
//
//    func start() {
//        let viewController = TrendingViewController()
//
//        self.navigationController = UINavigationController(rootViewController: viewController)
//        self.window.rootViewController = navigationController
//
//        if let navigation = self.navigationController {
//            navigation.pushViewController(viewController, animated: false)
//        }
//    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = TrendingViewController()
        
        self.navigationController.pushViewController(viewController, animated: false)
    }
}
