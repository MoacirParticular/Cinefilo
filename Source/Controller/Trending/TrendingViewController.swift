//
//  ViewController.swift
//  Cinefilo
//
//  Created by Moacir Ezequiel Lamego on 08/02/22.
//

import UIKit

class TrendingViewController: UIViewController {
    
    // MARK: :-) Closures
    var onSelectedTrending: ((_ trendingSelected: TrendingViewModel) -> Void)?

    // MARK: Views
    
    let trendingView: TrendingView = {
        let view = TrendingView(frame: .zero)
        view.backgroundColor = .backgroundColorSubView
        
        return view
    }()
    
    // MARK: - Life Cycle
    
    override func loadView() {
        self.view = trendingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTrendingView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = "Tendências"
    }
    
    // MARK: Setup Methods
    
    private func setupTrendingView() {
        trendingView.onSelectedTrending = {[weak self] selectedTrendingViewModel in
            self?.onSelectedTrending?(selectedTrendingViewModel)
        }
        trendingView.tableView.reloadData()
    }

    // MARK: Actions
}
