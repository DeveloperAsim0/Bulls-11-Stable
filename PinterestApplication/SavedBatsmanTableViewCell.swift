//
//  SavedBatsmanTableViewCell.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 29/06/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

protocol CellSubclassDelegate: class {
    func buttonTapped(cell: SavedBatsmanTableViewCell)
    func starplayer(cell: SavedBatsmanTableViewCell)
}

protocol CellSubclassDelegate2: class {
    func buttonTapped2(cell: SavedBowlerTableViewCell)
    func starplayer2(cell: SavedBowlerTableViewCell)
}

protocol CellSubclassDelegate3: class {
    func buttonTapped3(cell: SavedWicketkeeperTableViewCell)
    func starplayer3(cell: SavedWicketkeeperTableViewCell)
}

protocol CellSubclass: class {
    func starplayer(cell: SavedBatsmanTableViewCell)
}

protocol CellSubclass2: class {
    func starplayer2(cell: SavedBowlerTableViewCell)
}

protocol CellSubclass3: class {
    func starplayer3(cell: SavedWicketkeeperTableViewCell)
}

class SavedBatsmanTableViewCell: UITableViewCell {

    @IBOutlet weak var batsmanSaved: UILabel!
    @IBOutlet weak var captionButton: UIButton!
    @IBOutlet weak var starPlayerButton: UIButton!
    
   weak var delegate: CellSubclassDelegate?
    weak var starDelegate: CellSubclass?
    var finalBatsmanID = String()
    
    override func awakeFromNib() {
        super.awakeFromNib()
       contentView.layer.cornerRadius     = 10
       contentView.layer.borderColor      = UIColor.black.cgColor
       contentView.layer.borderWidth      = 0.15
       contentView.clipsToBounds          = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func captain(_ sender: UIButton) {
        if sender.isSelected {
                    sender.isSelected = false
                } else {
                    sender.isSelected = true
            print("hurray")
            self.delegate?.buttonTapped(cell: self)
                }
    }
    
    @IBAction func star(_ sender: UIButton) {
           if sender.isSelected {
                       sender.isSelected = false
                   } else {
                       sender.isSelected = true
            print("hurray")
            self.starDelegate?.starplayer(cell: self)
                   }
         }
    
}


class SavedBowlerTableViewCell: UITableViewCell {
    @IBOutlet weak var bowlerSaved: UILabel!
    @IBOutlet weak var captionButton: UIButton!
    @IBOutlet weak var starPlayerButton: UIButton!
    var finalBowlerID = String()
     weak var delegate: CellSubclassDelegate2?
    weak var starDelegate: CellSubclass2?
    override func awakeFromNib() {
        super.awakeFromNib()
              contentView.layer.cornerRadius     = 10
              contentView.layer.borderColor      = UIColor.black.cgColor
              contentView.layer.borderWidth      = 0.15
              contentView.clipsToBounds          = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func captain(_ sender: UIButton) {
        if sender.isSelected {
                    sender.isSelected = false
                } else {
                    sender.isSelected = true
                 self.delegate?.buttonTapped2(cell: self)
                }
    }
    
    @IBAction func star(_ sender: UIButton) {
           if sender.isSelected {
                       sender.isSelected = false
                   } else {
                       sender.isSelected = true
            self.starDelegate?.starplayer2(cell: self)
                   }
    }
}

class SavedWicketkeeperTableViewCell: UITableViewCell {
    @IBOutlet weak var wicketKeeperSaved: UILabel!
    @IBOutlet weak var captionButton: UIButton!
    @IBOutlet weak var starPlayerButton: UIButton!
    var finalwicketID = String()
     weak var delegate: CellSubclassDelegate3?
    weak var starDelegate: CellSubclass3?
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius     = 10
              contentView.layer.borderColor      = UIColor.black.cgColor
              contentView.layer.borderWidth      = 0.15
              contentView.clipsToBounds          = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func captain(_ sender: UIButton) {
        if sender.isSelected {
                    sender.isSelected = false
                } else {
                    sender.isSelected = true
                    self.delegate?.buttonTapped3(cell: self)
                }
    }
    
    @IBAction func star(_ sender: UIButton) {
           if sender.isSelected {
                       sender.isSelected = false
                   } else {
                       sender.isSelected = true
            self.starDelegate?.starplayer3(cell: self)
                   }
    }
}
