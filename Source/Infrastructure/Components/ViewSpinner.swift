//
//  ViewSpinner.swift
//  Cinefilo
//
//  Created by Moacir Ezequiel Lamego on 11/02/22.
//

import UIKit

class ViewSpinner: UIView {
    
    let spinner: UIActivityIndicatorView = {
        let activityView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        
        return activityView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        loadUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadUIElements() {
        self.addSubview(spinner)
        spinner.center = self.center
        stop()
    }
    
    func start() {
        spinner.startAnimating()
    }
    
    func stop() {
        spinner.stopAnimating()
    }
}
