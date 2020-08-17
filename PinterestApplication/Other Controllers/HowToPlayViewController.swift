//
//  HowToPlayViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 15/05/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class HowToPlayViewController: UIViewController {

    @IBOutlet var myhideview: [UIView]!
    @IBOutlet weak var dropbtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = ""
        title = "How To Play"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 19/255, blue: 126/255, alpha: 1)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func IntroductionDropDown(_ sender: UIButton) {
        myhideview.forEach { (label) in
            UIView.animate(withDuration: 0.1, delay: 0.0, options: .transitionCurlUp, animations: {
                label.isHidden = !label.isHidden
                if label.isHidden {
                    self.dropbtn.setTitleColor(UIColor.black, for: .normal)
                    self.dropbtn.imageView?.tintColor = .black
                } else {
                    self.dropbtn.setTitleColor(UIColor(red: 210/255, green: 72/255, blue: 141/255, alpha: 1.0), for: .normal)
                    self.dropbtn.imageView?.tintColor = UIColor(red: 210/255, green: 72/255, blue: 141/255, alpha: 1.0)
                }
            
            self.view.layoutIfNeeded()
            })
        }
        if sender.isSelected {
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
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
