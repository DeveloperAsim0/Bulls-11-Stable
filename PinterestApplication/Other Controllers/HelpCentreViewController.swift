//
//  HelpCentreViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 15/05/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class HelpCentreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = ""

        title = "Help Centre"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 212/255, green: 71/255, blue: 140/255, alpha: 1)
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
