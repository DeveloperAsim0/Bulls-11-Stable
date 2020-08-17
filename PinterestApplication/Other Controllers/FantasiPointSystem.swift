//
//  FantasiPointSystem.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 16/05/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class FantasiPointSystem: UIViewController {

    @IBOutlet weak var pasivebtn: UIButton!
    @IBOutlet weak var activebtn: UIButton!
    @IBOutlet weak var contView: UIView!
    @IBOutlet weak var active: UIView!
    @IBOutlet weak var pasive: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = "back"
        title = "Fantasy Point System"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 19/255, blue: 126/255, alpha: 1)
        contView.layer.cornerRadius = 15
        contView.layer.masksToBounds = false
        contView.layer.shadowColor = UIColor.lightGray.cgColor
        contView.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        contView.layer.shadowOpacity = 0.7
        contView.layer.shadowRadius = 3.0
                // Do any additional setup after loading the view.
    }
    

    
    @IBAction func activeTapped(_ sender: Any) {
        active.isHidden = false
        pasive.isHidden = true
    }
    
    
    @IBAction func passiveTapped(_ sender: Any) {
        pasive.isHidden = false
        active.isHidden = true
    }
    
    
    
    @IBAction func segment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            active.alpha = 1
            pasive.alpha = 0
        } else {
            active.alpha = 0
            pasive.alpha = 1
        }
        
    }
    
    
   

}
