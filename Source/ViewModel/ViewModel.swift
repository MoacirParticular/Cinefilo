//
//  ViewModel.swift
//  Cinefilo
//
//  Created by Moacir Ezequiel Lamego on 14/02/22.
//

import Foundation

class ViewModel<T> {
    let model: T
    
    init(model: T) {
        self.model = model
    }
}
