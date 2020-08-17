//
//  SavedFinalModel.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 18/07/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import Foundation

class finalModel {
    static var userCash = Int()
    static var paymentID = String()
    static var Captain = String()
    static var starPlayer = String()
    static var AllPlayer = [String]()
    static var contest_type = String()
    static var saveFees = [String]()
    static var savefirstprize = [String]()
    static var saveprittykit = [String]()
    static var savetotalprize = [String]()
    static var updated = [String]()
    static var userIDMerge = [String]()
    static var specialplayer = [String]()
    static var selection = "paid"
    static var currency = Int()
    static var currencyType = "coins"
   // static var userid = KeychainWrapper.standard.string(forKey: "userID")
    
}

class semiFinalBatsmanModel {
    static var Captains = String()
    static var starplayer = [String]()
}

class semiFinalBowlerModel {
    static var Captains = String()
    static var starplayer = [String]()
}

class semiFinalWicketModel {
    static var Captains = String()
    static var starplayer = [String]()
}
