//
//  TrendingTableViewCell.swift
//  Cinefilo
//
//  Created by Moacir Ezequiel Lamego on 11/02/22.
//

import UIKit

class TrendingTableViewCell: UITableViewCell {
    
    let movieCover: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = .black.withAlphaComponent(0.3)
        
        return iv
    }()
    let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView.init(style: .large)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        movieCover.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(activityIndicator)
        activityIndicator.color = .yellow
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
        
        contentView.addSubview(movieCover)

        movieCover.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        movieCover.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        movieCover.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        movieCover.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -0).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
         super.setSelected(selected, animated: animated)

         if !selected {
            contentView.backgroundColor = .colorCellDefault
         } else {
             contentView.backgroundColor = .colorCellSelectedDefault
         }
     }
}
