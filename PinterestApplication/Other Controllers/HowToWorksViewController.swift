//
//  HowToWorksViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 14/05/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class HowToWorksViewController: UIViewController {

    @IBOutlet weak var firstview : UIView!
    @IBOutlet weak var secondview: UIView!
    @IBOutlet weak var thirdview : UIView!
    @IBOutlet weak var fourthview: UIView!
    
    let cornerRadius:CGFloat = 8.0
    
    fileprivate func CustomizeView(){
        firstview.layer.shadowColor = UIColor.gray.cgColor
        firstview.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        firstview.layer.shadowOpacity = 0.5
        firstview.layer.shadowRadius = 2.0
        firstview.layer.cornerRadius = cornerRadius
        firstview.layer.masksToBounds = false
        
         secondview.layer.shadowColor = UIColor.gray.cgColor
         secondview.layer.shadowOffset = CGSize(width: 0, height: 1.0)
         secondview.layer.shadowOpacity = 0.5
         secondview.layer.shadowRadius = 2.0
         secondview.layer.cornerRadius = cornerRadius
         secondview.layer.masksToBounds = false
        
         thirdview.layer.shadowColor = UIColor.gray.cgColor
         thirdview.layer.shadowOffset = CGSize(width: 0, height: 1.0)
         thirdview.layer.shadowOpacity = 0.5
         thirdview.layer.shadowRadius = 2.0
         thirdview.layer.cornerRadius = cornerRadius
         thirdview.layer.masksToBounds = false
        
         fourthview.layer.shadowColor = UIColor.gray.cgColor
         fourthview.layer.shadowOffset = CGSize(width: 0, height: 1.0)
         fourthview.layer.shadowOpacity = 0.5
         fourthview.layer.shadowRadius = 2.0
         fourthview.layer.cornerRadius = cornerRadius
         fourthview.layer.masksToBounds = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = ""

        title = "How to works"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 212/255, green: 71/255, blue: 140/255, alpha: 1)
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
