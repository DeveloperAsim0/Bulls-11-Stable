//
//  secondTableViewCell.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 25/06/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

protocol showStatus2 {
    func didTapForStatus2(Title: String)
}

class secondTableViewCell: UITableViewCell {
    
    @IBOutlet weak var conView: UIView!
    @IBOutlet weak var CompanyNameLbl: UILabel!
    @IBOutlet weak var CompanyDetailLbl: UILabel!
    
    var delegate: showStatus2?
        override func awakeFromNib() {
            super.awakeFromNib()
        }

     var userIds = String()
        override func layoutSubviews() {
            super.layoutSubviews()
        }
        
        @IBAction func popupViewBtn(_ sender: UIButton){
            delegate?.didTapForStatus2(Title: "OK")
        }
        
        override func setHighlighted(_ highlighted: Bool, animated: Bool) {
            // Add your color here
            //self.contentView.backgroundColor = UIColor(red: 252/255, green: 243/255, blue: 207/255, alpha: 1.0)
        }
        
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            if (isSelected) {
                self.selectionStyle = .none
            self.conView.backgroundColor = UIColor(red: 252/255, green: 243/255, blue: 207/255, alpha: 1.0)
            } else {
                self.conView.backgroundColor = .white
            }
        }
        
    }


