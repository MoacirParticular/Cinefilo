//
//  Bundle+.swift
//  Cinefilo
//
//  Created by Moacir Ezequiel Lamego on 10/02/22.
//

import Foundation

extension Bundle {
    static var current: Bundle {
        class DummyClass {
            init() {
                
            }
        }
        return Bundle(for: DummyClass.self)
    }
}
