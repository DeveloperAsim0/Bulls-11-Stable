//
//  SelectSpecialPlayerViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 21/07/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class SelectSpecialPlayerViewController: UIViewController {

    // outlet for top
    @IBOutlet weak var selectView: UIView!
    @IBOutlet weak var createView: UIView!
    @IBOutlet weak var joinView: UIView!
    
    // outlet for batsmanViews
    @IBOutlet weak var btplay1: UIView!
    @IBOutlet weak var btplay2: UIView!
    @IBOutlet weak var btplay3: UIView!
    @IBOutlet weak var btplay4: UIView!
    @IBOutlet weak var btplay5: UIView!
    @IBOutlet weak var btplay6: UIView!
    
    // outlet for bowlerViews
    @IBOutlet weak var bwplay1: UIView!
    @IBOutlet weak var bwplay2: UIView!
    @IBOutlet weak var bwplay3: UIView!
    @IBOutlet weak var bwplay4: UIView!
    
    // outlet for wicketKeeper
    @IBOutlet weak var wkplay1: UIView!
    
    // outlet for batsman
    @IBOutlet weak var batsmanPlayer1: UILabel!
    @IBOutlet weak var batsmanPlayer2: UILabel!
    @IBOutlet weak var batsmanPlayer3: UILabel!
    @IBOutlet weak var batsmanPlayer4: UILabel!
    @IBOutlet weak var batsmanPlayer5: UILabel!
    @IBOutlet weak var batsmanPlayer6: UILabel!
    
    // outlet for bowler
    @IBOutlet weak var bowlerPlayer1: UILabel!
    @IBOutlet weak var bowlerPlayer2: UILabel!
    @IBOutlet weak var bowlerPlayer3: UILabel!
    @IBOutlet weak var bowlerPlayer4: UILabel!
    
    // outlet for wicketkeeper
    @IBOutlet weak var wicketkeeperPlayer1: UILabel!
    
    // outlet for captain button
    @IBOutlet weak var captainBtn1: UIButton!
    @IBOutlet weak var captainBtn2: UIButton!
    @IBOutlet weak var captainBtn3: UIButton!
    @IBOutlet weak var captainBtn4: UIButton!
    @IBOutlet weak var captainBtn5: UIButton!
    @IBOutlet weak var captainBtn6: UIButton!
    @IBOutlet weak var captainBtn7: UIButton!
    @IBOutlet weak var captainBtn8: UIButton!
    @IBOutlet weak var captainBtn9: UIButton!
    @IBOutlet weak var captainBtn10: UIButton!
    @IBOutlet weak var captainBtn11: UIButton!
    
    // outlet for starplayer button
    @IBOutlet weak var starPlayer1: UIButton!
    @IBOutlet weak var starPlayer2: UIButton!
    @IBOutlet weak var starPlayer3: UIButton!
    @IBOutlet weak var starPlayer4: UIButton!
    @IBOutlet weak var starPlayer5: UIButton!
    @IBOutlet weak var starPlayer6: UIButton!
    @IBOutlet weak var starPlayer7: UIButton!
    @IBOutlet weak var starPlayer8: UIButton!
    @IBOutlet weak var starPlayer9: UIButton!
    @IBOutlet weak var starPlayer10:UIButton!
    @IBOutlet weak var starPlayer11:UIButton!
    
    var buttonCount     = [Int]()
    var clickBtn        = String()
    fileprivate func Set_Value() {
        // for select create and join views
        selectView.layer.cornerRadius = selectView.frame.size.width/2
        selectView.layer.borderColor = UIColor.white.cgColor
        selectView.layer.borderWidth = 1.5
        selectView.clipsToBounds = true
        
        createView.layer.cornerRadius = createView.frame.size.width/2
        createView.layer.borderColor = UIColor.white.cgColor
        createView.layer.borderWidth = 1.5
        createView.clipsToBounds = true
        
        joinView.layer.cornerRadius = joinView.frame.size.width/2
        joinView.backgroundColor = .white
        joinView.clipsToBounds = true
        
        // for batsman
        self.batsmanPlayer1.text = savedBatsmanTeams.CompanyName[0]
        self.batsmanPlayer2.text = savedBatsmanTeams.CompanyName[1]
        self.batsmanPlayer3.text = savedBatsmanTeams.CompanyName[2]
        self.batsmanPlayer4.text = savedBatsmanTeams.CompanyName[3]
        self.batsmanPlayer5.text = savedBatsmanTeams.CompanyName[4]
        self.batsmanPlayer6.text = savedBatsmanTeams.CompanyName[5]
        
        // for bowler
        self.bowlerPlayer1.text = savedBowlerTeams.CompanyName[0]
        self.bowlerPlayer2.text = savedBowlerTeams.CompanyName[1]
        self.bowlerPlayer3.text = savedBowlerTeams.CompanyName[2]
        self.bowlerPlayer4.text = savedBowlerTeams.CompanyName[3]
        
        // for wicketKeeper
        self.wicketkeeperPlayer1.text = savedWicketKeeperTeams.CompanyName[0]
    }
    
    fileprivate func CustomizedView() {
        self.btplay1.layer.cornerRadius     = 10
        self.btplay1.layer.borderColor      = UIColor.black.cgColor
        self.btplay1.layer.borderWidth      = 0.15
        self.btplay1.clipsToBounds          = true
        
        self.btplay2.layer.cornerRadius     = 10
        self.btplay2.layer.borderColor      = UIColor.black.cgColor
        self.btplay2.layer.borderWidth      = 0.15
        self.btplay2.clipsToBounds          = true
        
        self.btplay3.layer.cornerRadius     = 10
        self.btplay3.layer.borderColor      = UIColor.black.cgColor
        self.btplay3.layer.borderWidth      = 0.15
        self.btplay3.clipsToBounds          = true
        
        self.btplay4.layer.cornerRadius     = 10
        self.btplay4.layer.borderColor      = UIColor.black.cgColor
        self.btplay4.layer.borderWidth      = 0.15
        self.btplay4.clipsToBounds          = true
        
        self.btplay5.layer.cornerRadius     = 10
        self.btplay5.layer.borderColor      = UIColor.black.cgColor
        self.btplay5.layer.borderWidth      = 0.15
        self.btplay5.clipsToBounds          = true
        
        self.btplay6.layer.cornerRadius     = 10
        self.btplay6.layer.borderColor      = UIColor.black.cgColor
        self.btplay6.layer.borderWidth      = 0.15
        self.btplay6.clipsToBounds          = true
        
        self.bwplay1.layer.cornerRadius     = 10
        self.bwplay1.layer.borderColor      = UIColor.black.cgColor
        self.bwplay1.layer.borderWidth      = 0.15
        self.bwplay1.clipsToBounds          = true
        
        self.bwplay2.layer.cornerRadius     = 10
        self.bwplay2.layer.borderColor      = UIColor.black.cgColor
        self.bwplay2.layer.borderWidth      = 0.15
        self.bwplay2.clipsToBounds          = true
        
        self.bwplay3.layer.cornerRadius     = 10
        self.bwplay3.layer.borderColor      = UIColor.black.cgColor
        self.bwplay3.layer.borderWidth      = 0.15
        self.bwplay3.clipsToBounds          = true
        
        self.bwplay4.layer.cornerRadius     = 10
        self.bwplay4.layer.borderColor      = UIColor.black.cgColor
        self.bwplay4.layer.borderWidth      = 0.15
        self.bwplay4.clipsToBounds          = true
        
        self.wkplay1.layer.cornerRadius     = 10
        self.wkplay1.layer.borderColor      = UIColor.black.cgColor
        self.wkplay1.layer.borderWidth      = 0.15
        self.wkplay1.clipsToBounds          = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CustomizedView()
        Set_Value()
        // Do any additional setup after loading the view.
    }
    
    // Action for captain radio button
    @IBAction func captain1(_ sender: UIButton){
        if sender.isSelected {
            sender.isSelected = false
            finalModel.Captain.removeAll()
            print("jyf:- \(finalModel.Captain)")
        } else {
            sender.isSelected = true
            clickBtn = "1"
            print("clickbtn:-\(clickBtn.count)")
            finalModel.Captain.removeAll()
            captainBtn2.isSelected = false
            captainBtn3.isSelected = false
            captainBtn4.isSelected = false
            captainBtn5.isSelected = false
            captainBtn6.isSelected = false
            captainBtn7.isSelected = false
            captainBtn8.isSelected = false
            captainBtn9.isSelected = false
            captainBtn10.isSelected = false
            captainBtn11.isSelected = false
            print("previousvalue:- \(finalModel.Captain)")
            let capID = savedBatsmanTeams.CompanyID[0]
            finalModel.Captain.append(capID)
            print("updated captain:- \(finalModel.Captain)")
        }
    }
    @IBAction func captain2(_ sender: UIButton){
        if sender.isSelected {
            sender.isSelected = false
            finalModel.Captain.removeAll()
            print("jyf:- \(finalModel.Captain)")
        } else {
            sender.isSelected = true
            clickBtn = "1"
            print("clickbtn:-\(clickBtn.count)")
             finalModel.Captain.removeAll()
             captainBtn1.isSelected = false
             captainBtn3.isSelected = false
             captainBtn4.isSelected = false
             captainBtn5.isSelected = false
             captainBtn6.isSelected = false
             captainBtn7.isSelected = false
             captainBtn8.isSelected = false
             captainBtn9.isSelected = false
             captainBtn10.isSelected = false
             captainBtn11.isSelected = false
            print("previousvalue:- \(finalModel.Captain)")
            let capID = savedBatsmanTeams.CompanyID[1]
            finalModel.Captain.append(capID)
            print("updated captain:- \(finalModel.Captain)")
        }
    }
    @IBAction func captain3(_ sender: UIButton){
        if sender.isSelected {
            sender.isSelected = false
            finalModel.Captain.removeAll()
            print("jyf:- \(finalModel.Captain)")
        } else {
            sender.isSelected = true
            clickBtn = "1"
            print("clickbtn:-\(clickBtn.count)")
             finalModel.Captain.removeAll()
             captainBtn2.isSelected = false
             captainBtn1.isSelected = false
             captainBtn4.isSelected = false
             captainBtn5.isSelected = false
             captainBtn6.isSelected = false
             captainBtn7.isSelected = false
             captainBtn8.isSelected = false
             captainBtn9.isSelected = false
             captainBtn10.isSelected = false
             captainBtn11.isSelected = false
            print("previousvalue:- \(finalModel.Captain)")
            let capID = savedBatsmanTeams.CompanyID[2]
            finalModel.Captain.append(capID)
            print("updated captain:- \(finalModel.Captain)")
        }
    }
    @IBAction func captain4(_ sender: UIButton){
        if sender.isSelected {
            sender.isSelected = false
            finalModel.Captain.removeAll()
            print("jyf:- \(finalModel.Captain)")
        } else {
            sender.isSelected = true
            clickBtn = "1"
            print("clickbtn:-\(clickBtn.count)")
             finalModel.Captain.removeAll()
             captainBtn2.isSelected = false
             captainBtn3.isSelected = false
             captainBtn1.isSelected = false
             captainBtn5.isSelected = false
             captainBtn6.isSelected = false
             captainBtn7.isSelected = false
             captainBtn8.isSelected = false
             captainBtn9.isSelected = false
             captainBtn10.isSelected = false
             captainBtn11.isSelected = false
            print("previousvalue:- \(finalModel.Captain)")
            let capID = savedBatsmanTeams.CompanyID[3]
            finalModel.Captain.append(capID)
            print("updated captain:- \(finalModel.Captain)")
        }
    }
    @IBAction func captain5(_ sender: UIButton){
        if sender.isSelected {
            sender.isSelected = false
            finalModel.Captain.removeAll()
            print("jyf:- \(finalModel.Captain)")
        } else {
            sender.isSelected = true
            clickBtn = "1"
            print("clickbtn:-\(clickBtn.count)")
             finalModel.Captain.removeAll()
             captainBtn2.isSelected = false
             captainBtn3.isSelected = false
             captainBtn4.isSelected = false
             captainBtn1.isSelected = false
             captainBtn6.isSelected = false
             captainBtn7.isSelected = false
             captainBtn8.isSelected = false
             captainBtn9.isSelected = false
            captainBtn10.isSelected = false
            captainBtn11.isSelected = false
            print("previousvalue:- \(finalModel.Captain)")
            let capID = savedBatsmanTeams.CompanyID[4]
            finalModel.Captain.append(capID)
            print("updated captain:- \(finalModel.Captain)")
        }
    }
    @IBAction func captain6(_ sender: UIButton){
        if sender.isSelected {
            sender.isSelected = false
            finalModel.Captain.removeAll()
            print("jyf:- \(finalModel.Captain)")
        } else {
            sender.isSelected = true
            clickBtn = "1"
            print("clickbtn:-\(clickBtn.count)")
             finalModel.Captain.removeAll()
             captainBtn2.isSelected = false
             captainBtn3.isSelected = false
             captainBtn4.isSelected = false
             captainBtn5.isSelected = false
             captainBtn1.isSelected = false
             captainBtn7.isSelected = false
             captainBtn8.isSelected = false
             captainBtn9.isSelected = false
             captainBtn10.isSelected = false
             captainBtn11.isSelected = false
            print("previousvalue:- \(finalModel.Captain)")
            let capID = savedBatsmanTeams.CompanyID[5]
            finalModel.Captain.append(capID)
            print("updated captain:- \(finalModel.Captain)")
        }
    }
    @IBAction func captain7(_ sender: UIButton){
        if sender.isSelected {
            sender.isSelected = false
            finalModel.Captain.removeAll()
            print("jyf:- \(finalModel.Captain)")
        } else {
            sender.isSelected = true
            clickBtn = "1"
            print("clickbtn:-\(clickBtn.count)")
             finalModel.Captain.removeAll()
             captainBtn2.isSelected = false
             captainBtn3.isSelected = false
             captainBtn4.isSelected = false
             captainBtn5.isSelected = false
             captainBtn6.isSelected = false
             captainBtn1.isSelected = false
             captainBtn8.isSelected = false
             captainBtn9.isSelected = false
            captainBtn10.isSelected = false
            captainBtn11.isSelected = false
            print("previousvalue:- \(finalModel.Captain)")
            let capID = savedBowlerTeams.CompanyID[0]
            finalModel.Captain.append(capID)
            print("updated captain:- \(finalModel.Captain)")
        }
    }
    @IBAction func captain8(_ sender: UIButton){
        if sender.isSelected {
            sender.isSelected = false
            finalModel.Captain.removeAll()
            print("jyf:- \(finalModel.Captain)")
        } else {
            sender.isSelected = true
            clickBtn = "1"
            print("clickbtn:-\(clickBtn.count)")
             finalModel.Captain.removeAll()
             captainBtn2.isSelected = false
             captainBtn3.isSelected = false
             captainBtn4.isSelected = false
             captainBtn5.isSelected = false
             captainBtn6.isSelected = false
             captainBtn7.isSelected = false
             captainBtn1.isSelected = false
             captainBtn9.isSelected = false
             captainBtn10.isSelected = false
             captainBtn11.isSelected = false
            print("previousvalue:- \(finalModel.Captain)")
            let capID = savedBowlerTeams.CompanyID[1]
            finalModel.Captain.append(capID)
            print("updated captain:- \(finalModel.Captain)")
        }
    }
    @IBAction func captain9(_ sender: UIButton){
        if sender.isSelected {
            sender.isSelected = false
            finalModel.Captain.removeAll()
            print("jyf:- \(finalModel.Captain)")
        } else {
            sender.isSelected = true
            clickBtn = "1"
            print("clickbtn:-\(clickBtn.count)")
             finalModel.Captain.removeAll()
             captainBtn2.isSelected = false
             captainBtn3.isSelected = false
             captainBtn4.isSelected = false
             captainBtn5.isSelected = false
             captainBtn6.isSelected = false
             captainBtn7.isSelected = false
             captainBtn8.isSelected = false
             captainBtn1.isSelected = false
             captainBtn10.isSelected = false
             captainBtn11.isSelected = false
            print("previousvalue:- \(finalModel.Captain)")
            let capID = savedBowlerTeams.CompanyID[2]
            finalModel.Captain.append(capID)
            print("updated captain:- \(finalModel.Captain)")
        }
    }
    @IBAction func captain10(_ sender: UIButton){
        if sender.isSelected {
            sender.isSelected = false
            finalModel.Captain.removeAll()
            print("jyf:- \(finalModel.Captain)")
        } else {
            sender.isSelected = true
            clickBtn = "1"
            print("clickbtn:-\(clickBtn.count)")
             finalModel.Captain.removeAll()
             captainBtn2.isSelected = false
             captainBtn3.isSelected = false
             captainBtn4.isSelected = false
             captainBtn5.isSelected = false
             captainBtn6.isSelected = false
             captainBtn7.isSelected = false
             captainBtn8.isSelected = false
             captainBtn9.isSelected = false
             captainBtn1.isSelected = false
             captainBtn11.isSelected = false
            print("previousvalue:- \(finalModel.Captain)")
            let capID = savedBowlerTeams.CompanyID[3]
            finalModel.Captain.append(capID)
            print("updated captain:- \(finalModel.Captain)")
        }
    }
    @IBAction func captain11(_ sender: UIButton){
        if sender.isSelected {
            sender.isSelected = false
            finalModel.Captain.removeAll()
            print("jyf:- \(finalModel.Captain)")
        } else {
            sender.isSelected = true
            clickBtn = "1"
            print("clickbtn:-\(clickBtn.count)")
             finalModel.Captain.removeAll()
             captainBtn2.isSelected = false
             captainBtn3.isSelected = false
             captainBtn4.isSelected = false
             captainBtn5.isSelected = false
             captainBtn6.isSelected = false
             captainBtn7.isSelected = false
             captainBtn8.isSelected = false
             captainBtn9.isSelected = false
             captainBtn10.isSelected = false
             captainBtn1.isSelected = false
            print("previousvalue:- \(finalModel.Captain)")
            let capID = savedWicketKeeperTeams.CompanyID[0]
            finalModel.Captain.append(capID)
            print("updated captain:- \(finalModel.Captain)")
        }
    }
    
    // Action for star player radio button
    @IBAction func starPlayer1(_ sender: UIButton){
        if sender.isSelected {
            sender.isSelected = false
            self.buttonCount.remove(at: 0)
            finalModel.starPlayer.removeLast()
            print("vla:- \(finalModel.starPlayer)")
             starPlayer2.isUserInteractionEnabled = true
             starPlayer3.isUserInteractionEnabled = true
             starPlayer4.isUserInteractionEnabled = true
             starPlayer5.isUserInteractionEnabled = true
             starPlayer6.isUserInteractionEnabled = true
             starPlayer7.isUserInteractionEnabled = true
             starPlayer8.isUserInteractionEnabled = true
             starPlayer9.isUserInteractionEnabled = true
             starPlayer10.isUserInteractionEnabled = true
             starPlayer11.isUserInteractionEnabled = true
        }else {
            sender.isSelected = true
            let value = 1
            self.buttonCount.append(value)
            let myst = savedBatsmanTeams.CompanyID[0]
            finalModel.starPlayer.append(myst)
            print("valuer:- \(finalModel.starPlayer)")
            print("updatedValue = \(self.buttonCount)")
            if buttonCount.count >= 3 {
                print("no more clicks")
               starPlayer2.isUserInteractionEnabled = false
               starPlayer3.isUserInteractionEnabled = false
               starPlayer4.isUserInteractionEnabled = false
               starPlayer5.isUserInteractionEnabled = false
               starPlayer6.isUserInteractionEnabled = false
               starPlayer7.isUserInteractionEnabled = false
               starPlayer8.isUserInteractionEnabled = false
               starPlayer9.isUserInteractionEnabled = false
               starPlayer10.isUserInteractionEnabled = false
               starPlayer11.isUserInteractionEnabled = false
                print("value = \(self.buttonCount)")
            }
        }
    }
    @IBAction func starPlayer2(_ sender: UIButton){
           if sender.isSelected {
               sender.isSelected = false
               self.buttonCount.remove(at: 0)
               finalModel.starPlayer.removeLast()
               print("vla:- \(finalModel.starPlayer)")
                starPlayer1.isUserInteractionEnabled = true
                starPlayer3.isUserInteractionEnabled = true
                starPlayer4.isUserInteractionEnabled = true
                starPlayer5.isUserInteractionEnabled = true
                starPlayer6.isUserInteractionEnabled = true
                starPlayer7.isUserInteractionEnabled = true
                starPlayer8.isUserInteractionEnabled = true
                starPlayer9.isUserInteractionEnabled = true
                starPlayer10.isUserInteractionEnabled = true
                starPlayer11.isUserInteractionEnabled = true
           }else {
               sender.isSelected = true
               let value = 1
               self.buttonCount.append(value)
            let myst = savedBatsmanTeams.CompanyID[1]
            finalModel.starPlayer.append(myst)
               print("valuer:- \(finalModel.starPlayer)")
               print("updatedValue = \(self.buttonCount)")
               if buttonCount.count >= 3 {
                   print("no more clicks")
                  starPlayer1.isUserInteractionEnabled = false
                  starPlayer3.isUserInteractionEnabled = false
                  starPlayer4.isUserInteractionEnabled = false
                  starPlayer5.isUserInteractionEnabled = false
                  starPlayer6.isUserInteractionEnabled = false
                  starPlayer7.isUserInteractionEnabled = false
                  starPlayer8.isUserInteractionEnabled = false
                  starPlayer9.isUserInteractionEnabled = false
                  starPlayer10.isUserInteractionEnabled = false
                  starPlayer11.isUserInteractionEnabled = false
                   print("value = \(self.buttonCount)")
               }
           }
       }
    @IBAction func starPlayer3(_ sender: UIButton){
           if sender.isSelected {
               sender.isSelected = false
               self.buttonCount.remove(at: 0)
               finalModel.starPlayer.removeLast()
               print("vla:- \(finalModel.starPlayer)")
                starPlayer2.isUserInteractionEnabled = true
                starPlayer1.isUserInteractionEnabled = true
                starPlayer4.isUserInteractionEnabled = true
                starPlayer5.isUserInteractionEnabled = true
                starPlayer6.isUserInteractionEnabled = true
                starPlayer7.isUserInteractionEnabled = true
                starPlayer8.isUserInteractionEnabled = true
                starPlayer9.isUserInteractionEnabled = true
                starPlayer10.isUserInteractionEnabled = true
                starPlayer11.isUserInteractionEnabled = true
           }else {
               sender.isSelected = true
               let value = 1
               self.buttonCount.append(value)
            let myst = savedBatsmanTeams.CompanyID[2]
            finalModel.starPlayer.append(myst)
               print("valuer:- \(finalModel.starPlayer)")
               print("updatedValue = \(self.buttonCount)")
               if buttonCount.count >= 3 {
                   print("no more clicks")
                  starPlayer2.isUserInteractionEnabled = false
                  starPlayer1.isUserInteractionEnabled = false
                  starPlayer4.isUserInteractionEnabled = false
                  starPlayer5.isUserInteractionEnabled = false
                  starPlayer6.isUserInteractionEnabled = false
                  starPlayer7.isUserInteractionEnabled = false
                  starPlayer8.isUserInteractionEnabled = false
                  starPlayer9.isUserInteractionEnabled = false
                  starPlayer10.isUserInteractionEnabled = false
                  starPlayer11.isUserInteractionEnabled = false
                   print("value = \(self.buttonCount)")
               }
           }
       }
    @IBAction func starPlayer4(_ sender: UIButton){
           if sender.isSelected {
               sender.isSelected = false
               self.buttonCount.remove(at: 0)
               finalModel.starPlayer.removeLast()
               print("vla:- \(finalModel.starPlayer)")
                starPlayer2.isUserInteractionEnabled = true
                starPlayer3.isUserInteractionEnabled = true
                starPlayer1.isUserInteractionEnabled = true
                starPlayer5.isUserInteractionEnabled = true
                starPlayer6.isUserInteractionEnabled = true
                starPlayer7.isUserInteractionEnabled = true
                starPlayer8.isUserInteractionEnabled = true
                starPlayer9.isUserInteractionEnabled = true
                starPlayer10.isUserInteractionEnabled = true
                starPlayer11.isUserInteractionEnabled = true
           }else {
               sender.isSelected = true
               let value = 1
               self.buttonCount.append(value)
            let myst = savedBatsmanTeams.CompanyID[3]
            finalModel.starPlayer.append(myst)
               print("valuer:- \(finalModel.starPlayer)")
               print("updatedValue = \(self.buttonCount)")
               if buttonCount.count >= 3 {
                   print("no more clicks")
                  starPlayer2.isUserInteractionEnabled = false
                  starPlayer3.isUserInteractionEnabled = false
                  starPlayer1.isUserInteractionEnabled = false
                  starPlayer5.isUserInteractionEnabled = false
                  starPlayer6.isUserInteractionEnabled = false
                  starPlayer7.isUserInteractionEnabled = false
                  starPlayer8.isUserInteractionEnabled = false
                  starPlayer9.isUserInteractionEnabled = false
                  starPlayer10.isUserInteractionEnabled = false
                  starPlayer11.isUserInteractionEnabled = false
                   print("value = \(self.buttonCount)")
               }
           }
       }
    @IBAction func starPlayer5(_ sender: UIButton){
           if sender.isSelected {
               sender.isSelected = false
               self.buttonCount.remove(at: 0)
               finalModel.starPlayer.removeLast()
               print("vla:- \(finalModel.starPlayer)")
                starPlayer2.isUserInteractionEnabled = true
                starPlayer3.isUserInteractionEnabled = true
                starPlayer4.isUserInteractionEnabled = true
                starPlayer1.isUserInteractionEnabled = true
                starPlayer6.isUserInteractionEnabled = true
                starPlayer7.isUserInteractionEnabled = true
                starPlayer8.isUserInteractionEnabled = true
                starPlayer9.isUserInteractionEnabled = true
                starPlayer10.isUserInteractionEnabled = true
                starPlayer11.isUserInteractionEnabled = true
           }else {
               sender.isSelected = true
               let value = 1
               self.buttonCount.append(value)
            let myst = savedBatsmanTeams.CompanyID[4]
            finalModel.starPlayer.append(myst)
               print("valuer:- \(finalModel.starPlayer)")
               print("updatedValue = \(self.buttonCount)")
               if buttonCount.count >= 3 {
                   print("no more clicks")
                  starPlayer2.isUserInteractionEnabled = false
                  starPlayer3.isUserInteractionEnabled = false
                  starPlayer4.isUserInteractionEnabled = false
                  starPlayer1.isUserInteractionEnabled = false
                  starPlayer6.isUserInteractionEnabled = false
                  starPlayer7.isUserInteractionEnabled = false
                  starPlayer8.isUserInteractionEnabled = false
                  starPlayer9.isUserInteractionEnabled = false
                  starPlayer10.isUserInteractionEnabled = false
                  starPlayer11.isUserInteractionEnabled = false
                   print("value = \(self.buttonCount)")
               }
           }
       }
    @IBAction func starPlayer6(_ sender: UIButton){
           if sender.isSelected {
               sender.isSelected = false
               self.buttonCount.remove(at: 0)
               finalModel.starPlayer.removeLast()
               print("vla:- \(finalModel.starPlayer)")
                starPlayer2.isUserInteractionEnabled = true
                starPlayer3.isUserInteractionEnabled = true
                starPlayer4.isUserInteractionEnabled = true
                starPlayer5.isUserInteractionEnabled = true
                starPlayer1.isUserInteractionEnabled = true
                starPlayer7.isUserInteractionEnabled = true
                starPlayer8.isUserInteractionEnabled = true
                starPlayer9.isUserInteractionEnabled = true
                starPlayer10.isUserInteractionEnabled = true
                starPlayer11.isUserInteractionEnabled = true
           }else {
               sender.isSelected = true
               let value = 1
               self.buttonCount.append(value)
            let myst = savedBatsmanTeams.CompanyID[5]
            finalModel.starPlayer.append(myst)
               print("valuer:- \(finalModel.starPlayer)")
               print("updatedValue = \(self.buttonCount)")
               if buttonCount.count >= 3 {
                   print("no more clicks")
                  starPlayer2.isUserInteractionEnabled = false
                  starPlayer3.isUserInteractionEnabled = false
                  starPlayer4.isUserInteractionEnabled = false
                  starPlayer5.isUserInteractionEnabled = false
                  starPlayer1.isUserInteractionEnabled = false
                  starPlayer7.isUserInteractionEnabled = false
                  starPlayer8.isUserInteractionEnabled = false
                  starPlayer9.isUserInteractionEnabled = false
                  starPlayer10.isUserInteractionEnabled = false
                  starPlayer11.isUserInteractionEnabled = false
                   print("value = \(self.buttonCount)")
               }
           }
       }
    @IBAction func starPlayer7(_ sender: UIButton){
           if sender.isSelected {
               sender.isSelected = false
               self.buttonCount.remove(at: 0)
               finalModel.starPlayer.removeLast()
               print("vla:- \(finalModel.starPlayer)")
                starPlayer2.isUserInteractionEnabled = true
                starPlayer3.isUserInteractionEnabled = true
                starPlayer4.isUserInteractionEnabled = true
                starPlayer5.isUserInteractionEnabled = true
                starPlayer6.isUserInteractionEnabled = true
                starPlayer1.isUserInteractionEnabled = true
                starPlayer8.isUserInteractionEnabled = true
                starPlayer9.isUserInteractionEnabled = true
                starPlayer10.isUserInteractionEnabled = true
                starPlayer11.isUserInteractionEnabled = true
           }else {
               sender.isSelected = true
               let value = 1
               self.buttonCount.append(value)
            let myst = savedBowlerTeams.CompanyID[0]
            finalModel.starPlayer.append(myst)
               print("valuer:- \(finalModel.starPlayer)")
               print("updatedValue = \(self.buttonCount)")
               if buttonCount.count >= 3 {
                   print("no more clicks")
                  starPlayer2.isUserInteractionEnabled = false
                  starPlayer3.isUserInteractionEnabled = false
                  starPlayer4.isUserInteractionEnabled = false
                  starPlayer5.isUserInteractionEnabled = false
                  starPlayer6.isUserInteractionEnabled = false
                  starPlayer1.isUserInteractionEnabled = false
                  starPlayer8.isUserInteractionEnabled = false
                  starPlayer9.isUserInteractionEnabled = false
                  starPlayer10.isUserInteractionEnabled = false
                  starPlayer11.isUserInteractionEnabled = false
                   print("value = \(self.buttonCount)")
               }
           }
       }
    @IBAction func starPlayer8(_ sender: UIButton){
           if sender.isSelected {
               sender.isSelected = false
               self.buttonCount.remove(at: 0)
               finalModel.starPlayer.removeLast()
               print("vla:- \(finalModel.starPlayer)")
                starPlayer2.isUserInteractionEnabled = true
                starPlayer3.isUserInteractionEnabled = true
                starPlayer4.isUserInteractionEnabled = true
                starPlayer5.isUserInteractionEnabled = true
                starPlayer6.isUserInteractionEnabled = true
                starPlayer7.isUserInteractionEnabled = true
                starPlayer1.isUserInteractionEnabled = true
                starPlayer9.isUserInteractionEnabled = true
                starPlayer10.isUserInteractionEnabled = true
                starPlayer11.isUserInteractionEnabled = true
           }else {
               sender.isSelected = true
               let value = 1
               self.buttonCount.append(value)
            let myst = savedBowlerTeams.CompanyID[1]
            finalModel.starPlayer.append(myst)
               print("valuer:- \(finalModel.starPlayer)")
               print("updatedValue = \(self.buttonCount)")
               if buttonCount.count >= 3 {
                   print("no more clicks")
                  starPlayer2.isUserInteractionEnabled = false
                  starPlayer3.isUserInteractionEnabled = false
                  starPlayer4.isUserInteractionEnabled = false
                  starPlayer5.isUserInteractionEnabled = false
                  starPlayer6.isUserInteractionEnabled = false
                  starPlayer7.isUserInteractionEnabled = false
                  starPlayer1.isUserInteractionEnabled = false
                  starPlayer9.isUserInteractionEnabled = false
                  starPlayer10.isUserInteractionEnabled = false
                  starPlayer11.isUserInteractionEnabled = false
                   print("value = \(self.buttonCount)")
               }
           }
       }
    @IBAction func starPlayer9(_ sender: UIButton){
           if sender.isSelected {
               sender.isSelected = false
               self.buttonCount.remove(at: 0)
               finalModel.starPlayer.removeLast()
               print("vla:- \(finalModel.starPlayer)")
                starPlayer2.isUserInteractionEnabled = true
                starPlayer3.isUserInteractionEnabled = true
                starPlayer4.isUserInteractionEnabled = true
                starPlayer5.isUserInteractionEnabled = true
                starPlayer6.isUserInteractionEnabled = true
                starPlayer7.isUserInteractionEnabled = true
                starPlayer8.isUserInteractionEnabled = true
                starPlayer1.isUserInteractionEnabled = true
                starPlayer10.isUserInteractionEnabled = true
                starPlayer11.isUserInteractionEnabled = true
           }else {
               sender.isSelected = true
               let value = 1
               self.buttonCount.append(value)
            let myst = savedBowlerTeams.CompanyID[2]
            finalModel.starPlayer.append(myst)
               print("valuer:- \(finalModel.starPlayer)")
               print("updatedValue = \(self.buttonCount)")
               if buttonCount.count >= 3 {
                   print("no more clicks")
                  starPlayer2.isUserInteractionEnabled = false
                  starPlayer3.isUserInteractionEnabled = false
                  starPlayer4.isUserInteractionEnabled = false
                  starPlayer5.isUserInteractionEnabled = false
                  starPlayer6.isUserInteractionEnabled = false
                  starPlayer7.isUserInteractionEnabled = false
                  starPlayer8.isUserInteractionEnabled = false
                  starPlayer1.isUserInteractionEnabled = false
                  starPlayer10.isUserInteractionEnabled = false
                  starPlayer11.isUserInteractionEnabled = false
                   print("value = \(self.buttonCount)")
               }
           }
       }
    @IBAction func starPlayer10(_ sender: UIButton){
           if sender.isSelected {
               sender.isSelected = false
               self.buttonCount.remove(at: 0)
               finalModel.starPlayer.removeLast()
               print("vla:- \(finalModel.starPlayer)")
                starPlayer2.isUserInteractionEnabled = true
                starPlayer3.isUserInteractionEnabled = true
                starPlayer4.isUserInteractionEnabled = true
                starPlayer5.isUserInteractionEnabled = true
                starPlayer6.isUserInteractionEnabled = true
                starPlayer7.isUserInteractionEnabled = true
                starPlayer8.isUserInteractionEnabled = true
                starPlayer9.isUserInteractionEnabled = true
                starPlayer1.isUserInteractionEnabled = true
                starPlayer11.isUserInteractionEnabled = true
           }else {
               sender.isSelected = true
               let value = 1
               self.buttonCount.append(value)
            let myst = savedBowlerTeams.CompanyID[3]
            finalModel.starPlayer.append(myst)
               print("valuer:- \(finalModel.starPlayer)")
               print("updatedValue = \(self.buttonCount)")
               if buttonCount.count >= 3 {
                   print("no more clicks")
                  starPlayer2.isUserInteractionEnabled = false
                  starPlayer3.isUserInteractionEnabled = false
                  starPlayer4.isUserInteractionEnabled = false
                  starPlayer5.isUserInteractionEnabled = false
                  starPlayer6.isUserInteractionEnabled = false
                  starPlayer7.isUserInteractionEnabled = false
                  starPlayer8.isUserInteractionEnabled = false
                  starPlayer9.isUserInteractionEnabled = false
                  starPlayer1.isUserInteractionEnabled = false
                  starPlayer11.isUserInteractionEnabled = false
                   print("value = \(self.buttonCount)")
               }
           }
       }
    @IBAction func starPlayer11(_ sender: UIButton){
           if sender.isSelected {
               sender.isSelected = false
               self.buttonCount.remove(at: 0)
               finalModel.starPlayer.removeLast()
               print("vla:- \(finalModel.starPlayer)")
                starPlayer2.isUserInteractionEnabled = true
                starPlayer3.isUserInteractionEnabled = true
                starPlayer4.isUserInteractionEnabled = true
                starPlayer5.isUserInteractionEnabled = true
                starPlayer6.isUserInteractionEnabled = true
                starPlayer7.isUserInteractionEnabled = true
                starPlayer8.isUserInteractionEnabled = true
                starPlayer9.isUserInteractionEnabled = true
                starPlayer10.isUserInteractionEnabled = true
                starPlayer1.isUserInteractionEnabled = true
           }else {
               sender.isSelected = true
               let value = 1
               self.buttonCount.append(value)
            let myst = savedWicketKeeperTeams.CompanyID[0]
            finalModel.starPlayer.append(myst)
               print("valuer:- \(finalModel.starPlayer)")
               print("updatedValue = \(self.buttonCount)")
               if buttonCount.count >= 3 {
                   print("no more clicks")
                  starPlayer2.isUserInteractionEnabled = false
                  starPlayer3.isUserInteractionEnabled = false
                  starPlayer4.isUserInteractionEnabled = false
                  starPlayer5.isUserInteractionEnabled = false
                  starPlayer6.isUserInteractionEnabled = false
                  starPlayer7.isUserInteractionEnabled = false
                  starPlayer8.isUserInteractionEnabled = false
                  starPlayer9.isUserInteractionEnabled = false
                  starPlayer10.isUserInteractionEnabled = false
                  starPlayer1.isUserInteractionEnabled = false
                   print("value = \(self.buttonCount)")
               }
           }
       }
    
    @IBAction func CreateTeam(_ sender: Any){
        print("starplayer:- \(finalModel.starPlayer.count)")
        print("captainplayer:- \(finalModel.Captain.count)")
        print("print:-\(clickBtn.count)")
        
        if clickBtn.count == 1{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "letsplay")
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let alert = UIAlertController(title: "Please Select 1 Captain and 3 Star Players", message: "", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}
