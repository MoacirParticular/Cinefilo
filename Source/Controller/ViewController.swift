//
//  ViewController.swift
//  Cinefilo
//
//  Created by Moacir Ezequiel Lamego on 08/02/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let manager: TrendingManagerProtocol = TrendingManager()
        
        manager.requestTrendings(mediaType: MediaType.all,
                                 timeWindow: TimeWindows.week) { trendingViewModel in
            DebugLogger.log("Sucesso")
        } failureHandler: { error in
            DebugLogger.log("Erro")
        }
    }


}

