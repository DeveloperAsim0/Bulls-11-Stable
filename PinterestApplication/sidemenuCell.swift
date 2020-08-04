//
//  sidemenuCell.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 18/06/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class sidemenuCell: UITableViewCell {

    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var name: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
