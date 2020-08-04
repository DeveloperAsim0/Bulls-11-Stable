//
//  SelectTradeTableViewCell.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 18/05/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class SelectTradeTableViewCell: UITableViewCell {

    @IBOutlet weak var DateLabel  : UILabel!
    @IBOutlet weak var DetailLabel: UILabel!
    @IBOutlet weak var timeLabel  : UILabel!
    @IBOutlet weak var myview     : UIView!
    @IBOutlet weak var totalPrize : UILabel!
    @IBOutlet weak var PaidUsers  : UILabel!
    @IBOutlet weak var freeUsers  : UILabel!
    @IBOutlet weak var totalSlots : UILabel!
    var apidate = Int()
    
    func getdate() {
        // here we set the current date

        let date = NSDate()
        let calendar = Calendar.current

        let components = calendar.dateComponents([.hour, .minute], from: date as Date)

        let currentDate = calendar.date(from: components)
         print("current:- \(currentDate)")
        let userCalendar = Calendar.current

        // here we set the due date. When the timer is supposed to finish
        let competitionDate = NSDateComponents()
        competitionDate.hour = apidate
        competitionDate.minute = 00
        let competitionDay = userCalendar.date(from: competitionDate as DateComponents)!

        //here we change the seconds to hours,minutes and days
        let CompetitionDayDifference = calendar.dateComponents([.hour, .minute], from: currentDate!, to: competitionDay)


        //finally, here we set the variable to our remaining time
        let daysLeft = CompetitionDayDifference.day
        let hoursLeft = CompetitionDayDifference.hour
        let minutesLeft = CompetitionDayDifference.minute

        print("day:", daysLeft ?? "N/A", "hour:", hoursLeft ?? "N/A", "minute:", minutesLeft ?? "N/A")

        //Set countdown label text
        timeLabel.text = "\(hoursLeft ?? 0) Hours, \(minutesLeft ?? 0) Minutes"
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        getdate()
        myview.layer.cornerRadius = 7
        myview.layer.borderColor  = UIColor.black.cgColor
        myview.layer.borderWidth  = 0.15
        myview.clipsToBounds      = true
    }

}

