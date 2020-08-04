//
//  MorePlayersViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 18/05/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class MorePlayersViewController: UIViewController {

    @IBOutlet weak var backBtn          : UIButton!
    @IBOutlet weak var ActiveBtn        : UIButton!
    @IBOutlet weak var passiveBtn       : UIButton!
    
    @IBOutlet weak var selectview       : UIView!
    @IBOutlet weak var createview       : UIView!
    @IBOutlet weak var joinview         : UIView!
    
    @IBOutlet weak var batsmanbtn       : UIButton!
    @IBOutlet weak var allrounderbtn    : UIButton!
    @IBOutlet weak var bowlerbtn        : UIButton!
    @IBOutlet weak var wicketkeeperbtn  : UIButton!
    
    @IBOutlet weak var batsmanview1     : UIView!
    @IBOutlet weak var batsmanview2     : UIView!
    @IBOutlet weak var batsmanview3     : UIView!
    
    @IBOutlet weak var allrounderview1  : UIView!
    @IBOutlet weak var allrounderview2  : UIView!
    @IBOutlet weak var allrounderview3  : UIView!
    
    @IBOutlet weak var bowlerbtn1       : UIView!
    @IBOutlet weak var bowlerbtn2       : UIView!
    @IBOutlet weak var bowlerbtn3       : UIView!
    
    @IBOutlet weak var wicketkeeperbtn1 : UIView!
    @IBOutlet weak var wicketkeeperbtn2 : UIView!
    @IBOutlet weak var wicketkeeperbtn3 : UIView!
    
//    fileprivate func CustomizeButton(){
//        ActiveBtn.layer.cornerRadius  = 15
//        passiveBtn.layer.cornerRadius = 15
//    }
//
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
    
    fileprivate func CustomizeViews(){
        batsmanbtn.layer.cornerRadius      = 15
        allrounderbtn.layer.cornerRadius   = 15
        bowlerbtn.layer.cornerRadius       = 15
        wicketkeeperbtn.layer.cornerRadius = 15
        //backBtn.layer.cornerRadius = 15
        
        batsmanview1.layer.cornerRadius = 5
        batsmanview1.layer.borderColor  = UIColor.black.cgColor
        batsmanview1.layer.borderWidth  = 0.15
        batsmanview1.clipsToBounds      = true
        
        batsmanview2.layer.cornerRadius = 5
        batsmanview2.layer.borderColor  = UIColor.black.cgColor
        batsmanview2.layer.borderWidth  = 0.15
        batsmanview2.clipsToBounds      = true
        
        batsmanview3.layer.cornerRadius = 5
        batsmanview3.layer.borderColor  = UIColor.black.cgColor
        batsmanview3.layer.borderWidth  = 0.15
        batsmanview3.clipsToBounds      = true
        
        allrounderview1.layer.cornerRadius = 5
        allrounderview1.layer.borderColor  = UIColor.black.cgColor
        allrounderview1.layer.borderWidth  = 0.15
        allrounderview1.clipsToBounds      = true
         
        allrounderview2.layer.cornerRadius = 5
        allrounderview2.layer.borderColor  = UIColor.black.cgColor
        allrounderview2.layer.borderWidth  = 0.15
        allrounderview2.clipsToBounds      = true
        
        allrounderview3.layer.cornerRadius = 5
        allrounderview3.layer.borderColor  = UIColor.black.cgColor
        allrounderview3.layer.borderWidth  = 0.15
        allrounderview3.clipsToBounds      = true
        
        bowlerbtn1.layer.cornerRadius = 5
        bowlerbtn1.layer.borderColor  = UIColor.black.cgColor
        bowlerbtn1.layer.borderWidth  = 0.15
        bowlerbtn1.clipsToBounds      = true
        
        bowlerbtn2.layer.cornerRadius = 5
        bowlerbtn2.layer.borderColor  = UIColor.black.cgColor
        bowlerbtn2.layer.borderWidth  = 0.15
        bowlerbtn2.clipsToBounds      = true
        
        bowlerbtn3.layer.cornerRadius = 5
        bowlerbtn3.layer.borderColor  = UIColor.black.cgColor
        bowlerbtn3.layer.borderWidth  = 0.15
        bowlerbtn3.clipsToBounds      = true
        
       wicketkeeperbtn1.layer.cornerRadius = 5
       wicketkeeperbtn1.layer.borderColor  = UIColor.black.cgColor
       wicketkeeperbtn1.layer.borderWidth  = 0.15
       wicketkeeperbtn1.clipsToBounds      = true
        
        wicketkeeperbtn2.layer.cornerRadius = 5
        wicketkeeperbtn2.layer.borderColor  = UIColor.black.cgColor
        wicketkeeperbtn2.layer.borderWidth  = 0.15
        wicketkeeperbtn2.clipsToBounds      = true
        
        wicketkeeperbtn3.layer.cornerRadius = 5
        wicketkeeperbtn3.layer.borderColor  = UIColor.black.cgColor
        wicketkeeperbtn3.layer.borderWidth  = 0.15
        wicketkeeperbtn3.clipsToBounds      = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
          CustomizeViews()
        CustomizeViews2()
      //  CustomizeButton()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func next(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "selectcaptain")
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
