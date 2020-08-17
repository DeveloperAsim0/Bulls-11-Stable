//
//  ChooseTeamTableViewCell.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 18/05/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

protocol showStatus {
    func didTapForStatus(Title: String)
}

class ChooseTeamTableViewCell: UITableViewCell {
    
    @IBOutlet weak var conView: UIView!
    @IBOutlet weak var CompanyNameLbl: UILabel!
    @IBOutlet weak var CompanyDetailLbl: UILabel!
    
    var userIds = String()
    
    var delegate: showStatus?
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    @IBAction func popupViewBtn(_ sender: UIButton){
        //delegate?.didTapForStatus(Title: "OK")
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















































/*
 for i in indexPath.row {
 
 }
 if indexPath.row == 1 {
 self.fifthcircle.image = #imageLiteral(resourceName: "wicket_keeper")
 } else if indexPath.row == 3 {
 self.sixthcircle.image = #imageLiteral(resourceName: "All-rounder")
 }
 //cell.reload()
 //cell.selectionStyle = .none
 
 */
