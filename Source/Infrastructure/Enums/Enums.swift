//
//  Enums.swift
//  Cinefilo
//
//  Created by Moacir Ezequiel Lamego on 07/02/22.
//

import Foundation

public enum MediaType: String, CaseIterable {
    case all
    case movie
    case tv
    case person
    
    static var asArray: [MediaType] {return self.allCases}
    
    func asInt() -> Int {
            return MediaType.asArray.firstIndex(of: self)!
    }
}

public enum TimeWindows: String, CaseIterable {
    case day
    case week
    
    static var asArray: [TimeWindows] {return self.allCases}
    
    func asInt() -> Int {
            return TimeWindows.asArray.firstIndex(of: self)!
    }
}
