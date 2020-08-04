//
//  thirdTableViewCell.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 25/06/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

protocol showStatus3 {
    func didTapForStatus3(Title: String)
}

class thirdTableViewCell: UITableViewCell {
    
    @IBOutlet weak var conView: UIView!
    @IBOutlet weak var CompanyNameLbl: UILabel!
    @IBOutlet weak var CompanyDetailLbl: UILabel!
    
    var delegate: showStatus3?
        override func awakeFromNib() {
            super.awakeFromNib()
        }

        override func layoutSubviews() {
            super.layoutSubviews()
        }
        
        @IBAction func popupViewBtn(_ sender: UIButton){
            delegate?.didTapForStatus3(Title: "OK")
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


