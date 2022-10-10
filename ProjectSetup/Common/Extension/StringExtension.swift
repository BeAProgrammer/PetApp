//
//  StringExtension.swift

import UIKit
import Foundation

extension String {
    
    // Check if String contains more than 6 characters and atleast one number
    var isValidPassword: Bool {
        
        let regex = try? NSRegularExpression(pattern: ".*[0-9].*", options: .caseInsensitive)
        return regex!.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil && self.count > 5 && !self.contains(" ")
    }
    
    var isValidNumber: Bool {
        
        if let number = Int(self) {
            if String(number).length >= ValidationContant.minimumPhoneNumberLength && self.length <= ValidationContant.maximumPhoneNumberLength {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    
    }
    
    var isValidName: Bool {
        if self.length >= 1 {
            let regex = try? NSRegularExpression(pattern: "^[a-zA-Z ]*$", options: .caseInsensitive)
            return regex!.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
        } else {
            return false
        }
    }
    
    var isValidAge: Bool {
        if self.length >= 2 {
            if let number = Int(self) {
                if number >= ValidationContant.ageLimit &&  number <= 99 {
                    return true
                } else {
                    return false
                }
            } else {
                return false
            }
            
        } else {
            return false
        }
    }
    
    var isValidZipcode: Bool {
        if Int(self) != nil {
            if self.length == ValidationContant.zipcodeLimit {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
    // Returns if String is a numbe
    static var backSpaceString: String {
        return "\u{200B}"
    }
    
    func getYoutubeId(youtubeUrl: String) -> String? {
        return URLComponents(string: youtubeUrl)?.queryItems?.first(where: { $0.name == "v" })?.value
    }
    
    var youtubeID: String? {
        let pattern = "((?<=(v|V)/)|(?<=be/)|(?<=(\\?|\\&)v=)|(?<=embed/))([\\w-]++)"
        
        let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        let range = NSRange(location: 0, length: count)
        
        guard let result = regex?.firstMatch(in: self, range: range) else {
            return nil
        }
        
        return (self as NSString).substring(with: result.range)
    }
    
    func convertToAmount() -> String {
        let values = self
        let floatvalue = Float(values.replacingOccurrences(of: "$", with: ""))?.truncatingRemainder(dividingBy: 1)
        if floatvalue == 0 {
            return String(format: "$%.0f", values.replacingOccurrences(of: "$", with: "").toDouble() ?? 0.0)
        } else {
            return values
        }
     
    }
    
    subscript(integerIndex: Int) -> Character {
        let index = self.index(startIndex, offsetBy: integerIndex)
        return self[index]
    }
    
    // Cut string from range
    subscript(integerRange: Range<Int>) -> String {
        let start = self.index(startIndex, offsetBy: integerRange.lowerBound)
        let end = self.index(startIndex, offsetBy: integerRange.upperBound)
        let range = start..<end
        return String(self[range])
    }
    
    // Character count
    var length: Int {
        return self.count
    }
    
    /// SwifterSwift: Integer value from string (if applicable).
    var int: Int? {
        return Int(self)
    }
    
    // Counts number of instances of the input inside String
    func count(_ substring: String) -> Int {
        return components(separatedBy: substring).count - 1
    }
    
    // Capitalizes first character of String
    var capitalizeFirst: String {
        var result = self
        result.replaceSubrange(startIndex...startIndex, with: String(self[startIndex]).capitalized)
        return result
    }
    
    // Trims white space and new line characters, returns a new string
    mutating func trim() {
        self = trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    // Checks if String contains Email
    var isEmail: Bool {
        let regex = try? NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}", options: .caseInsensitive)
        return regex!.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
        
    }
    
    // Returns if String is a number
    func isNumber() -> Bool {
        if (NumberFormatter().number(from: self))!.boolValue {
            return true
        }
        return false
    }
    
    // Extracts URLS from String
    var extractURLs: [URL] {
        var urls: [URL] = []
        let detector: NSDataDetector?
        do {
            detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        } catch _ as NSError {
            detector = nil
        }
        
        let text = self
        
        if let detector = detector {
            detector.enumerateMatches(in: text, options: [], range: NSRange(location: 0, length: text.count), using: { (result: NSTextCheckingResult?, _: NSRegularExpression.MatchingFlags, _: UnsafeMutablePointer<ObjCBool>) -> Void in
                if let result = result,
                    let url = result.url {
                    urls.append(url)
                }
            })
        }
        
        return urls
    }
    
    // Checks if String is a valid match or not for the given input string
    func isValidMatch(forRexEx: String) -> Bool {
        let regex = try? NSRegularExpression(pattern: forRexEx, options: [])
        return regex!.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
    
    // Checking if String contains input
    func contains(_ find: String) -> Bool {
        return self.range(of: find) != nil
    }
    
    // Checking if String contains input with comparing options
    func contains(_ find: String, compareOption: NSString.CompareOptions) -> Bool {
        return self.range(of: find, options: compareOption) != nil
    }
    
    // Converts String to Int
    func toInt() -> Int? {
        if let num = NumberFormatter().number(from: self) {
            return num.intValue
        } else {
            return nil
        }
    }
    
    // Converts String to Double
    func toDouble() -> Double? {
        if let num = NumberFormatter().number(from: self) {
            return num.doubleValue
        } else {
            return nil
        }
    }
    
    // Converts String to Float
    func toFloat() -> CGFloat? {
        if let num = NumberFormatter().number(from: self) {
            return CGFloat(num.floatValue)
        } else {
            return nil
        }
    }
    
    // Returns the first index of the occurency of the character in String
    func getIndexOf(_ char: Character) -> Int? {
        for (index, c) in self.enumerated() where c == char {
            return index
        }
        return nil
    }
    
    // Returns bold NSAttributedString
    func bold() -> NSAttributedString {
        let boldString = NSMutableAttributedString(string: self, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)])
        return boldString
    }
    
    // Returns underlined NSAttributedString
    func underline() -> NSAttributedString {
        let underlineString = NSAttributedString(string: self, attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        return underlineString
    }
    
    // Returns italic NSAttributedString
    func italic() -> NSAttributedString {
        let italicString = NSMutableAttributedString(string: self, attributes: [NSAttributedString.Key.font: UIFont.italicSystemFont(ofSize: UIFont.systemFontSize)])
        return italicString
    }
    
    // Returns NSAttributedString
    func color(_ color: UIColor) -> NSAttributedString {
        let colorString = NSMutableAttributedString(string: self, attributes: [NSAttributedString.Key.foregroundColor: color])
        return colorString
    }
    
    // Checks if String contains Emoji
    func includesEmoji() -> Bool {
        for i in 0...length {
            let c: unichar = (self as NSString).character(at: i)
            if (0xD800 <= c && c <= 0xDBFF) || (0xDC00 <= c && c <= 0xDFFF) {
                return true
            }
        }
        
        return false
    }
    
    // Return URL encoded string
    var urlEncoded: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    // Returns if its a valid URL
    var isValidUrl: Bool {
        return URL(string: self) != nil
    }
    
    // Returns Height of label for give text, font and width
    func heightWithConstrainedWidth(_ width: CGFloat, font: UIFont) -> CGFloat {
        
        let constraintRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        
        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return boundingBox.height
    }
    
    func getWidthOfString(_ font: UIFont) -> CGFloat {
        
        let nativeString = self as NSString
        let size = nativeString.size(withAttributes: [NSAttributedString.Key.font: font])
        return size.width
    }
    
    func toDate(format: String) -> Date {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)!
    }
    
    func replaceCharacters(characters: String, toSeparator: String) -> String {
        let characterSet = CharacterSet(charactersIn: characters)
        let components = self.components(separatedBy: characterSet)
        let result = components.joined(separator: "")
        return result
    }
    
    func wipeCharacters(characters: String) -> String {
        return self.replaceCharacters(characters: characters, toSeparator: "")
    }
    
    func stringByRemovingAll(characters: [Character]) -> String {
        return String(self.filter({ !characters.contains($0) }))
    }
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    var isValidText: Bool {
        var text: String? = self
        if text == nil {
            return false
        }
        text = text?.trimmingCharacters(in: .whitespacesAndNewlines)
        if (text?.length)! > 0 {
            return true
        }
        return false
    }
    
    static var empty: String {
        return ""
    }
    
    func digitsOnly() -> String {
        let allowedCharset = CharacterSet
            .decimalDigits
        let filteredText = String(self.unicodeScalars.filter(allowedCharset.contains))
        return filteredText
    }
}
