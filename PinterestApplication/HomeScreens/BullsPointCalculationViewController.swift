//
//  BullsPointCalculationViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 18/05/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class BullsPointCalculationViewController: UIViewController {

    @IBOutlet weak var firstView    : UIView!
    @IBOutlet weak var secondView   : UIView!
    
    @IBOutlet weak var nonspecialView  : UIView!
    @IBOutlet weak var specialview     : UIView!
    
    fileprivate func CustomizeBigViews() {
        
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = ""
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
