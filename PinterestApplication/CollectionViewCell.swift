//
//  CollectionViewCell.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 22/06/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
   @IBOutlet weak var first: UILabel!
   @IBOutlet weak var second: UILabel!
   @IBOutlet weak var third: UILabel!
   @IBOutlet weak var fourth: UILabel!
   @IBOutlet weak var firstb: UIButton!
   @IBOutlet weak var secondb: UIButton!
   @IBOutlet weak var thirdb: UIButton!
   @IBOutlet weak var fourthb: UIButton!
    @IBOutlet weak var questiion: UILabel!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    var choose_Answer = String()
    
    override func prepareForReuse() {
        self.firstb.isSelected = false // or placeholder image
        self.secondb.isSelected = false
        self.thirdb.isSelected = false
        self.fourthb.isSelected = false
        self.first.textColor = .black
        self.second.textColor = .black
        self.third.textColor = .black
        self.fourth.textColor = .black
        
        super.prepareForReuse()
    }
    
    @IBAction func a(_ sender: UIButton) {
           self.first.textColor = .green
         print("heloookyakre")
           self.second.textColor = .black
           self.third.textColor = .black
           self.fourth.textColor = .black
           if sender.isSelected {
               sender.isSelected = false
               secondb.isSelected = false
               thirdb.isSelected = false
               fourthb.isSelected = false
           } else {
            model.chooseoption = sender.tag
             model.choose_Answer.append(self.first.text ?? "")
            print("mychice:- \(model.choose_Answer)")
               sender.isSelected = true
               secondb.isSelected = false
               thirdb.isSelected = false
               fourthb.isSelected = false
           }
       }
       
       @IBAction func b(_ sender: UIButton) {
            self.first.textColor = .black
        self.second.textColor = .green
                  self.third.textColor = .black
                  self.fourth.textColor = .black
           if sender.isSelected {
               sender.isSelected = false
               firstb.isSelected = false
               thirdb.isSelected = false
               fourthb.isSelected = false
           } else {
               model.chooseoption = sender.tag
               sender.isSelected = true
               model.choose_Answer.append(self.second.text ?? "")
               firstb.isSelected = false
               thirdb.isSelected = false
               fourthb.isSelected = false
           }
       }
     
       @IBAction func c(_ sender: UIButton) {
           self.first.textColor = .black
                  self.second.textColor = .black
                  self.third.textColor = .green
                  self.fourth.textColor = .black
           if sender.isSelected {
               model.chooseoption = sender.tag
               sender.isSelected = false
               firstb.isSelected = false
               secondb.isSelected = false
               fourthb.isSelected = false
           } else {
               model.chooseoption = sender.tag
               sender.isSelected = true
               model.choose_Answer.append(self.third.text ?? "")
               firstb.isSelected = false
               secondb.isSelected = false
               fourthb.isSelected = false
           }
       }
       
       
       @IBAction func d(_ sender: UIButton) {
           self.first.textColor = .black
                  self.second.textColor = .black
                  self.third.textColor = .black
                  self.fourth.textColor = .green
           if sender.isSelected {
              
               sender.isSelected = false
               firstb.isSelected = false
               secondb.isSelected = false
               thirdb.isSelected = false
           } else {
            
               sender.isSelected = true
            model.choose_Answer.append(self.fourth.text ?? "")
               firstb.isSelected = false
               secondb.isSelected = false
               thirdb.isSelected = false
           }
       }
       
    
    
    
}
