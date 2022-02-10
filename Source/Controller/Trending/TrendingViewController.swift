//
//  ViewController.swift
//  Cinefilo
//
//  Created by Moacir Ezequiel Lamego on 08/02/22.
//

import UIKit

class TrendingViewController: UIViewController {

    // MARK: Views
    
    let trendingView: TrendingView = {
        let view = TrendingView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    
    // MARK: - Life Cycle
    
    override func loadView() {
        self.view = trendingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: Actions
    private func loadTrendings() {
        let manager: TrendingManagerProtocol = TrendingManager()
        
        manager.requestTrendings(mediaType: MediaType.all,
                                 timeWindow: TimeWindows.week) { trendingViewModel in
            DebugLogger.log("Sucesso")
        } failureHandler: { error in
            DebugLogger.log("Erro")
        }
    }
    
}

