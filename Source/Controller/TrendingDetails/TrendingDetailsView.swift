//
//  TrendingDetailsView.swift
//  Cinefilo
//
//  Created by Moacir Ezequiel Lamego on 14/02/22.
//

import Foundation
import UIKit

class TrendingDetailsView: UIView {
    
    // MARK: Constants
    
    // MARK: - Itens Visuais
    
    let posterViewImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
       // iv.backgroundColor = .black.withAlphaComponent(0.3)
        
        return iv
    }()
    
    let titleDetailsLabel = LabelDefault(title: "")
    let ratingLabel = LabelDefault(title: "Rating")
    let sinopseLabel = LabelDefault(title: "Sinopse")
    var sinopseDetailsLabel = LabelDefault(title: "", numberOfLines: 0, lineBreakMode: .byWordWrapping)

    // MARK: Variáveis
    var trendingViewModel: TrendingViewModel?
    
    // MARK: Inicializadores
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: DesInicializadores
    
    deinit {
        
    }
    
    // MARK: Load Elementos Visuais
    
    private func loadUIElements() {
        titleDetailsLabelSetup()
        sinopseDetailsLabelSetup()
        sinopseLabelSetup()
        ratingLabelSetup()
        posterViewImageSetup()
    }
    
    private func titleDetailsLabelSetup() {
        self.addSubview(titleDetailsLabel)
        titleDetailsLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            titleDetailsLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 66),
            titleDetailsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleDetailsLabel.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -16),
        ])
    }
    
    private func ratingLabelSetup() {
        self.addSubview(ratingLabel)
        
        ratingLabel.textAlignment = .right
        
        NSLayoutConstraint.activate([
            ratingLabel.bottomAnchor.constraint(equalTo: sinopseDetailsLabel.topAnchor, constant: -16),
            ratingLabel.leadingAnchor.constraint(equalTo: sinopseLabel.leadingAnchor, constant: 16),
            ratingLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
        ])
    }
    
    private func posterViewImageSetup() {
        self.addSubview(posterViewImage)
        
        NSLayoutConstraint.activate([
            posterViewImage.topAnchor.constraint(equalTo: titleDetailsLabel.bottomAnchor, constant: 16),
            posterViewImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            posterViewImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            posterViewImage.bottomAnchor.constraint(equalTo: sinopseLabel.topAnchor, constant: -16),
        ])
    }
    
    private func sinopseLabelSetup() {
        self.addSubview(sinopseLabel)
        
        NSLayoutConstraint.activate([
            sinopseLabel.bottomAnchor.constraint(equalTo: sinopseDetailsLabel.topAnchor, constant: -16),
            sinopseLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            sinopseLabel.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -16),
        ])
    }
    
    private func sinopseDetailsLabelSetup() {
        self.addSubview(sinopseDetailsLabel)
        
        NSLayoutConstraint.activate([
            sinopseDetailsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            sinopseDetailsLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            sinopseDetailsLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -26),
        ])
    }
    
    // MARK: - Activities
    
    func setDetails(trendingViewModel: TrendingViewModel) {
        titleDetailsLabel.text = trendingViewModel.title
        sinopseDetailsLabel.text = trendingViewModel.overview
        ratingLabel.text = "Rating: \(String(format: "%.2f", trendingViewModel.voteAverage))"
        
        posterViewImage.loadImageUsingCache(withUrl: "\(Constants.apiUrlImageW500)\(trendingViewModel.posterPath)")
    }
}
