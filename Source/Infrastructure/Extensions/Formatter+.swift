//
//  Formatter+.swift
//  Cinefilo
//
//  Created by Moacir Ezequiel Lamego on 09/02/22.
//

import Foundation

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = "."
        return formatter
    }()
}
