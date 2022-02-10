//
//  Coordinator.swift
//  Cinefilo
//
//  Created by Moacir Ezequiel Lamego on 10/02/22.
//

import Foundation
import UIKit

public protocol Coordinator: AnyObject {
    func start()
}

extension Coordinator {
    func getStoryboard(nameStoryboard: String) -> UIStoryboard {
        let pathBundle = Constants.bundleAppealCopy
        
        return UIStoryboard(name: nameStoryboard, bundle: pathBundle)
    }
}
