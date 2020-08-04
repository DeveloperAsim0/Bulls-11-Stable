//
//  OTPViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 11/05/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class OTPViewController: UIViewController {

    fileprivate func CustomNavBar(){
        title = "OTP"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 41/255, blue: 122/255, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         CustomNavBar()
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
