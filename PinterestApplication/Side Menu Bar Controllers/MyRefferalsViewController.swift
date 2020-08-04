//
//  MyRefferalsViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 13/05/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class MyRefferalsViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    
    let cornerRadius: CGFloat = 6.0
    
    fileprivate func CustomNavBar(){
        title = "My Referrals"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 41/255, blue: 122/255, alpha: 1)
    }
    
    fileprivate func CustomizeView(){
        myView.layer.shadowColor    = UIColor.gray.cgColor
        myView.layer.shadowOffset   = CGSize(width: 0, height: 1.0)
        myView.layer.shadowOpacity  = 0.5
        myView.layer.shadowRadius   = 2.0
        myView.layer.cornerRadius   = cornerRadius
        myView.layer.masksToBounds  = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = ""

        CustomNavBar()
        CustomizeView()
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
