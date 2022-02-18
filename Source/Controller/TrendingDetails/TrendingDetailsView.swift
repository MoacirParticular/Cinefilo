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
    
    let scrollView: UIScrollView = {
       let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .backgroundColorSubView
        return scroll
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .backgroundColorSubView
        
        return view
    }()
    
    let posterViewImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
       // iv.backgroundColor = .black.withAlphaComponent(0.3)
        
        return iv
    }()
    
    let titleDetailsLabel = LabelDefault(title: "")
    let ratingLabel = LabelDefault(title: "")
    let sinopseLabel = LabelDefault(title: LocalizableStrings.sinopseTitle.localize())
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
        setScrollView()
        setContentView()
        
        titleDetailsLabelSetup()
        posterViewImageSetup()
        sinopseLabelSetup()
        ratingLabelSetup()
        sinopseDetailsLabelSetup()
    }
    
    private func setScrollView() {
        self.addSubview(scrollView)
        
        scrollView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }

    private func setContentView() {
        scrollView.addSubview(contentView)
        
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }

    private func titleDetailsLabelSetup() {
        contentView.addSubview(titleDetailsLabel)
        titleDetailsLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            titleDetailsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleDetailsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleDetailsLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -16),
        ])
    }
    
    private func posterViewImageSetup() {
        contentView.addSubview(posterViewImage)
        
        posterViewImage.accessibilityTraits = .image
        
        NSLayoutConstraint.activate([
            posterViewImage.topAnchor.constraint(equalTo: titleDetailsLabel.bottomAnchor, constant: 16),
            posterViewImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            posterViewImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -32),
            posterViewImage.heightAnchor.constraint(equalToConstant: 350),
        ])
    }
    
    private func ratingLabelSetup() {
        contentView.addSubview(ratingLabel)
        
        ratingLabel.textAlignment = .right
        
        NSLayoutConstraint.activate([
            ratingLabel.topAnchor.constraint(equalTo: posterViewImage.bottomAnchor, constant: 24),
            ratingLabel.widthAnchor.constraint(equalToConstant: 100),
            ratingLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
        ])
    }
    
    private func sinopseLabelSetup() {
        contentView.addSubview(sinopseLabel)
        
        NSLayoutConstraint.activate([
            sinopseLabel.topAnchor.constraint(equalTo: posterViewImage.bottomAnchor, constant: 24),
            sinopseLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            sinopseLabel.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    private func sinopseDetailsLabelSetup() {
        contentView.addSubview(sinopseDetailsLabel)
        
        NSLayoutConstraint.activate([
            sinopseDetailsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            sinopseDetailsLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            sinopseDetailsLabel.topAnchor.constraint(equalTo: sinopseLabel.bottomAnchor, constant: 16),
            sinopseDetailsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -26),
        ])
    }
    
    // MARK: - Activities
    
    func setDetails(trendingViewModel: TrendingViewModel) {
        titleDetailsLabel.text = trendingViewModel.title
        sinopseDetailsLabel.text = trendingViewModel.overview
        ratingLabel.text =  String(format: LocalizableStrings.ratingTitle.localize(), String(format: "%.2f", trendingViewModel.voteAverage))
        
        ratingLabel.accessibilityLabel =  String(format: AccessibilityLocalizableStrings.ratingTitle.localize(), String(format: "%.2f", trendingViewModel.voteAverage))
        
        sinopseLabel.accessibilityLabel = AccessibilityLocalizableStrings.sinopseTitle.localize()
        
        posterViewImage.loadImageUsingCache(withUrl: "\(Constants.apiUrlImageW500)\(trendingViewModel.posterPath)")
    }
}
