//
//  String+.swift
//  Cinefilo
//
//  Created by Moacir Ezequiel Lamego on 09/02/22.
//

import UIKit

extension String {
    static let empty = String()
    static let whiteSpace = " "
    
    var formattedAsIntegerCurrency: String {
        guard let decimal = Decimal(string: self) else { return self }
        let nsDecimalNumber = NSDecimalNumber(decimal: decimal)
        let integerValue = nsDecimalNumber.intValue
        return integerValue.formattedWithSeparator
    }

    /// .asAttributed(withMinimumLineHeight: 24)
    func asAttributed(withMinimumLineHeight lineHeight: CGFloat) -> NSAttributedString {
        let attrString = NSMutableAttributedString(string: self)
        let style = NSMutableParagraphStyle()
        style.minimumLineHeight = lineHeight
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle,
                                value: style,
                                range: NSRange(location: 0, length: self.count))
        return attrString
    }

    func replace(target: String, withString: String) -> String {
        self.replacingOccurrences(of: target, with: withString, options: NSString.CompareOptions.literal, range: nil)
    }

    var decimalDigits: String {
        self.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }

    /// .matches(for: "\\d+").first
    func matches(for regex: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: self,
                                        range: NSRange(self.startIndex..., in: self))
            return results.map {
                String(self[Range($0.range, in: self).unsafelyUnwrapped])
            }
        } catch {
            DebugLogger.log("invalid regex: \(error.localizedDescription)")
            return []
        }
    }

    func firstMatch(for regex: String) -> String? {
        matches(for: regex).first
    }

    func isRepeating() -> Bool {
        guard !(isEmpty) else { return false }
        guard let firstChar = self.first else { return false }
        return self == String(repeating: firstChar, count: self.count)
    }
}


