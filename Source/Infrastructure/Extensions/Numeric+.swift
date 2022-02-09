//
//  Numeric+.swift
//  Cinefilo
//
//  Created by Moacir Ezequiel Lamego on 09/02/22.
//

import Foundation

extension Numeric {
    var formattedWithSeparator: String {
        Formatter.withSeparator.string(for: self) ?? String.empty 
    }
}
