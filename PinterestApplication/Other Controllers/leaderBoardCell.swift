//
//  leaderBoardCell.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 14/05/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class leaderBoardCell: UITableViewCell {

    
    @IBOutlet weak var userIcon: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var points: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
