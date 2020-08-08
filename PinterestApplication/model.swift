//
//  model.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 22/06/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import Foundation

class model{
    static var winQuiz_id           = [String]()
    static var wnQuiz_firstOption   = [String]()
    static var winQuiz_secondOption = [String]()
    static var winQuiz_thirdOption  = [String]()
    static var winQuiz_fourthOption = [String]()
    static var winQuizRightAns      = [String]()
    static var winQuizChooseAns     = [String]()
    static var winQuizQues           = [String]()
    
    static var resultTime           = [Int]()
    static var randomques           = [String]()
    static var randomthird          = [String]()
    static var randomsecond         = [String]()
    static var randomfourth         = [String]()
    static var randomfirst          = [String]()
    static var startingtime         = [String]()
    static var totalSlots           = [String]()
    static var actualDateID         = String()
    static var paidUsers            = [String]()
    static var freeUsers            = [String]()
    static var prizeAmount          = [String]()
    static var firstoption          = [String]()
    static var secondoption         = [String]()
    static var thirdoption          = [String]()
    static var fourthoption         = [String]()
    static var rightans             = [String]()
    static var chooseans            = String()
    static var id                   = [String]()
    static var value                = Int()
    static var bullsPoint           = String()
    static var ques                 = [String]()
    static var choose_Answer        = [String]()
    static var chooseoption         = Int()
    static var firsttext            = [String]()
    static var secondtext           = [String]()
    static var thirdtext            = [String]()
    static var fourthtext           = [String]()
    static var date                 = [String]()
    static var dateListStatus       = [Bool]()
    static var dateID               = [String]()
    static var date_details         = [String]()
    static var CoreDiff             = [String]()
    static var TopTenCore           = [String]()
    static var NonCoreDiff          = [String]()
    static var TopNonCore           = [String]()
    static var final_Batsman        = [String]()
    static var final_Bowler         = [String]()
    static var final_wicket_keeper  = [String]()
    static var fee1                 = [String]()
    static var fee2                 = [String]()
    static var fee3                 = [String]()
    static var fee4                 = [String]()
    
    static var savingFee1           = String()
    static var savingFee2           = String()
    static var savingFee3           = String()
    static var savingFee4           = String()
    
    static var savingPaidUsers1     = String()
    static var savingFreeUsers      = String()
    static var savingTotalUsers     = String()
}
class myPersonalData {
 static var myuserName = [String]()
 static var mypoints = [String]()
 static var myentryfee = [String]()
    static var captain = [String]()
    static var starplay1 = [String]()
    static var starplay2 = [String]()
    static var starplay3 = [String]()
    static var rank = [String]()
    static var teamid = [String]()
}

class Result {
    static var user_id = [String]()
    static var result = [String]()
    static var starPlayer1 = [String]()
    static var starPlayer2 = [String]()
    static var starPlayer3 = [String]()
    static var captain      = [String]()
    static var team_id = [String]()
    static var currency = [String]()
    static var amount = [String]()
    static var userna = [String]()
    static var rank = [String]()
    
}

class refferalSaved {
    static var code        = [String]()
    static var validity    = [String]()
    static var datetime    = [String]()
    static var couponValue = [String]()
    static var couponid    = [String]()
    static var details     = [String]()
}

class QuizOptions {
    static var coins       = [String]()
    static var id          = [String]()
    static var Coins2x     = [Int]() 
}

class batsmanTeam {
    static var Company_Details = [String]()
    static var Company_ID      = [String]()
    static var Company_Name    = [String]()
    static var Company_Type    = [String]()
}

class bowlerTeam {
    static var Company_Details = [String]()
    static var Company_ID      = [String]()
    static var Company_Name    = [String]()
    static var Company_Type    = [String]()
}

class wicketkeeparTeam {
    static var Company_Details = [String]()
    static var Company_ID      = [String]()
    static var Company_Name    = [String]()
    static var Company_Type    = [String]()
}

class allrounderTeam {
    static var Company_Details               = [String]()
    static var Company_ID                    = [String]()
    static var Company_Name_Batsman_Core     = [String]()
    static var Company_Name_Batsman_NonCore  = [String]()
    static var Company_Name_Bowler           = [String]()
    static var Company_Name_Wicket_Keeper    = [String]()
    static var Company_Type                  = [String]()
    static var BowlerCompID                  = [String]()
    static var wicketkeeperID                = [String]()
    
}

class savedBatsmanTeams {
    static var CompanyID   = [String]()
    static var CompanyName = [String]()
}

class savedBowlerTeams {
    static var CompanyID   = [String]()
    static var CompanyName = [String]()
}

class savedAllRounderTeams {
    static var CompanyID   = [String]()
    static var CompanyName = [String]()
}

class savedWicketKeeperTeams {
    static var CompanyID   = [String]()
    static var CompanyName = [String]()
}

class WeeklyleaderBoard{
    static var username = [String]()
    static var profile = [String]()
    static var rank = [String]()
    static var points = [String]()
}

class SaveState{
    static var saveController = 0
}
