//
//  RegexExtension.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 17/08/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import Foundation

// more info here https://emailregex.com/regular-expressions-cheat-sheet/
extension String {
    
    enum ValidityType {
        case age
        case email
        case password
        case website
    }
    
    enum Regex: String {
        case age = "[0-9]{2,2}"
        case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        case password = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        case website = "((?:http|https)://)?(?:www\\.)?[\\w\\d\\-_]+\\.\\w{2,3}(\\.\\w{2})?(/(?<=/)(?:[\\w\\d\\-./_]+)?)?" // any site url
//        case website = "((?:http|https)://)?(?:www\\.)?[\\w\\d\\-_]+\\.(org|com)(\\.\\w{2})?(/(?<=/)(?:[\\w\\d\\-./_]+)?)?" // any site url with .com or .org and subpages
//        case website = "((?:http|https)://)?(?:www\\.)?[\\w\\d\\-_]+\\.(org|com)" // any site url with .com or .org and NO subpages
//        case website = "((?:http|https)://)?(?:www\\.)?[\\w\\d\\-_]+\\.org" // any site url with only .org and NO subpages
    }
    
    func isValid(_ validityType: ValidityType) -> Bool {
        let format = "SELF MATCHES %@"
        var regex = ""
        
        switch validityType {
        case .age:
            regex = Regex.age.rawValue
        case .email:
            regex = Regex.email.rawValue
        case .password:
            regex = Regex.password.rawValue
        case .website:
            regex = Regex.website.rawValue
        }
        
        return NSPredicate(format: format, regex).evaluate(with: self)
    }
    
}
