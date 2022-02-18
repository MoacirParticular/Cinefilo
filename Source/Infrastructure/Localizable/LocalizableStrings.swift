//
//  LocalizableStrings.swift
//  Cinefilo
//
//  Created by Moacir Ezequiel Lamego on 15/02/22.
//

import Foundation


enum LocalizableStrings: String {
    
    case backButton
    case detailsTitle
    case sinopseTitle
    case ratingTitle
    
    func localize() -> String {
        rawValue.localizeInCurrentBundle()
    }
}

extension String {
    func localizeInCurrentBundle(_ accessibility: Bool = false) -> String {
        let path: Bundle = .current
        
        return NSLocalizedString(self,
                                 tableName: accessibility ? "CinefiloAccessibilityLocalizable": "CinefiloLocalizable",
                                 bundle: path,
                                 value: String(),
                                 comment: String())
    }
}
