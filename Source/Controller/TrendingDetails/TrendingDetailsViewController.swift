//
//  TrendingDetailsViewController.swift
//  Cinefilo
//
//  Created by Moacir Ezequiel Lamego on 14/02/22.
//

import UIKit

class TrendingDetailsViewController: UIViewController {
    
    // MARK: Views
    
    let trendingDetails: TrendingDetailsView = {
        let view = TrendingDetailsView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .backgroundColorSubView
        
        return view
    }()
    
    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detalhes"
        
        self.navigationController?.navigationBar.backItem?.title = "Voltar"
        
        self.view.addSubview(trendingDetails)
        
        trendingDetails.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        trendingDetails.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        trendingDetails.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        trendingDetails.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    // MARK: Actions
}
