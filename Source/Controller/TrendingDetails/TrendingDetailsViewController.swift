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
        view.backgroundColor = .backgroundColorSubView
        
        return view
    }()
    
    // MARK: - Life Cycle
    
    override func loadView() {
        self.view = trendingDetails
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = LocalizableStrings.detailsTitle.localize()
        self.accessibilityLabel = AccessibilityLocalizableStrings.detailsTitle.localize()
        
        setupNavigationBar()
        setupTrendingDetailsView()
    }
    
    // MARK: Setup Methods
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.backItem?.title = LocalizableStrings.backButton.localize()
        self.navigationController?.navigationBar.backItem?.accessibilityLabel = AccessibilityLocalizableStrings.backButton.localize()
        self.navigationController?.navigationBar.backItem?.accessibilityTraits = .button
        self.navigationController?.navigationBar.backItem?.isAccessibilityElement = true
    }
    
    private func setupTrendingDetailsView() {
        trendingDetails.accessibilityElements = [
            navigationController,
            trendingDetails.titleDetailsLabel,
            trendingDetails.sinopseLabel,
            trendingDetails.sinopseDetailsLabel,
            trendingDetails.ratingLabel
        ].compactMap { $0 }
    }
    
    // MARK: Actions
}
