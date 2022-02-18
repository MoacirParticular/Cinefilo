//
//  AccessibilityLocalizableStrings.swift
//  Cinefilo
//
//  Created by Moacir Ezequiel Lamego on 15/02/22.
//

import Foundation

enum AccessibilityLocalizableStrings: String {
    
    case backButton
    case detailsTitle
    case sinopseTitle
    case ratingTitle
    
    func localize() -> String {
        rawValue.localizeInCurrentBundle(true)
    }
}
