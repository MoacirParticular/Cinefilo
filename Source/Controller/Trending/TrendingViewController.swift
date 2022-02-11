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
        view.backgroundColor = .red //.backgroundColorSubView
        
        return view
    }()
    
    // MARK: - Life Cycle
    
    override func loadView() {
        self.view = trendingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.trendingView.tableView.reloadData()
    }

    // MARK: Actions
    
    
}

