//
//  DebugLogger.swift
//  Cinefilo
//
//  Created by Moacir Ezequiel Lamego on 04/02/22.
//

import Foundation

class DebugLogger {
    enum LogLevel {
        case `default`
        case warning
        case error
    }
    
    static var logLevel: LogLevel = LogLevel.default
    
    static func log(_ value: @autoclosure() -> Any, logLevel:LogLevel = LogLevel.default) {
        
        if logLevel == LogLevel.default || logLevel == DebugLogger.logLevel {
            print(value())
        }
    }
}
