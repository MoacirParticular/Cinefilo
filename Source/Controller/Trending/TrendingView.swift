//
//  TrendingView.swift
//  Cinefilo
//
//  Created by Moacir Ezequiel Lamego on 10/02/22.
//

import Foundation
import UIKit

class TrendingView: UIView {
    // MARK: Inicializadores
        
    let viewAAAAAAAA: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            self.backgroundColor = .yellow
            
            self.addSubview(viewAAAAAAAA)
            
            viewAAAAAAAA.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            viewAAAAAAAA.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            viewAAAAAAAA.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -100).isActive = true
            viewAAAAAAAA.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -100).isActive = true

//            NSLayoutConstraint.activate([
//                view.topAnchor.constraint(equalTo: self.topAnchor, constant: 150),
//                view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
//                view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
//                view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),
//            ])
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}
