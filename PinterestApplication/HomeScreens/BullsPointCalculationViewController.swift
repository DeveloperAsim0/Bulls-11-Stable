//
//  BullsPointCalculationViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 18/05/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class BullsPointCalculationViewController: UIViewController {

    @IBOutlet weak var selectview   : UIView!
    @IBOutlet weak var createview   : UIView!
    @IBOutlet weak var joinview     : UIView!
    
    @IBOutlet weak var firstView    : UIView!
    @IBOutlet weak var secondView   : UIView!
    
    @IBOutlet weak var nonspecialView  : UIView!
    @IBOutlet weak var specialview     : UIView!
    @IBOutlet weak var playbutton      : UIButton!
    
    fileprivate func CustomizeBigViews() {
        playbutton.layer.cornerRadius = 15
        
        nonspecialView.layer.cornerRadius = 15
        specialview.layer.cornerRadius    = 15
        
        firstView.layer.cornerRadius  = 5
        firstView.layer.borderColor   = UIColor.black.cgColor
        firstView.layer.borderWidth   = 0.15
        firstView.clipsToBounds       = true
        
        secondView.layer.cornerRadius = 5
        secondView.layer.borderColor  = UIColor.black.cgColor
        secondView.layer.borderWidth  = 0.15
        secondView.clipsToBounds      = true
    }
    
    fileprivate func CustomizeViews2(){
        selectview.backgroundColor    = .clear
        selectview.layer.cornerRadius = selectview.frame.size.width/2
        selectview.layer.borderColor  = UIColor.white.cgColor
        selectview.layer.borderWidth  = 1.5
        selectview.clipsToBounds      = true
        
        createview.backgroundColor    = .clear
        createview.layer.cornerRadius = createview.frame.size.width/2
        createview.layer.borderColor  = UIColor.white.cgColor
        createview.layer.borderWidth  = 1.5
        createview.clipsToBounds      = true
        
        joinview.backgroundColor      = .white
        joinview.layer.cornerRadius   = joinview.frame.size.width/2
        joinview.layer.borderColor    = UIColor.white.cgColor
        joinview.layer.borderWidth    = 1.5
        joinview.clipsToBounds        = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CustomizeViews2()
        CustomizeBigViews()
        // Do any additional setup after loading the view.
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
