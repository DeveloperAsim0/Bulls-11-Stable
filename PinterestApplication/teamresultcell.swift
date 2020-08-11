//
//  teamresultcell.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 23/07/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class teamresultcell: UITableViewCell {

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var middleView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var captain : UILabel!
    @IBOutlet weak var starplay1: UILabel!
    @IBOutlet weak var starplay2: UILabel!
    @IBOutlet weak var starplay3: UILabel!
    @IBOutlet weak var points: UILabel!
    @IBOutlet weak var entryFee: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var rank: UILabel!
    @IBOutlet weak var winamount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        firstView.layer.cornerRadius = 7
        firstView.layer.borderColor = UIColor.lightGray.cgColor
        firstView.layer.borderWidth = 1.3
        firstView.clipsToBounds = true
        
        thirdView.layer.cornerRadius = 7
        thirdView.clipsToBounds = true
        
        middleView.layer.cornerRadius = 7
        middleView.clipsToBounds = true
        
        firstView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.40).cgColor
        firstView.layer.shadowOffset = CGSize(width: 0, height: 3)
        firstView.layer.shadowOpacity = 1.0
        firstView.layer.shadowRadius = 3.0
        firstView.layer.masksToBounds = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
