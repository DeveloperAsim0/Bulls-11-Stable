//
//  RewardTableViewCell.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 29/07/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class RewardTableViewCell: UITableViewCell {
    
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var details: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var myview: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        myview.layer.cornerRadius = 7
        myview.layer.borderColor = UIColor.green.cgColor
        myview.layer.borderWidth = 1.3
        myview.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
