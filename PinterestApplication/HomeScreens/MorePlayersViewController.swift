//
//  MorePlayersViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 18/05/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class MorePlayersViewController: UIViewController {

    @IBOutlet weak var selectview       : UIView!
    @IBOutlet weak var createview       : UIView!
    @IBOutlet weak var joinview         : UIView!
    
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
    
    fileprivate func CustomizeViews2() {
        selectview.backgroundColor    = .clear
        selectview.layer.cornerRadius = selectview.frame.size.width/2
        selectview.layer.borderColor  = UIColor.white.cgColor
        selectview.layer.borderWidth  = 1.5
        selectview.clipsToBounds      = true
        
        createview.backgroundColor    = .white
        createview.layer.cornerRadius = createview.frame.size.width/2
        createview.layer.borderColor  = UIColor.white.cgColor
        createview.layer.borderWidth  = 1.5
        createview.clipsToBounds      = true
        
        joinview.layer.cornerRadius = joinview.frame.size.width/2
        joinview.layer.borderColor  = UIColor.white.cgColor
        joinview.layer.borderWidth  = 1.5
        joinview.clipsToBounds      = true
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
    
    fileprivate func Set_Value() {
        
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CustomizeViews2()
        Set_Value()
        CustomizedView()
      //  CustomizeButton()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func next(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "selectcaptain")
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
