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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tendências da semana"
        
        self.view.addSubview(trendingView)
        
        trendingView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        trendingView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        trendingView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        trendingView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
//        self.trendingView.tableView.reloadData()
    }

    // MARK: Actions
    
    
}

