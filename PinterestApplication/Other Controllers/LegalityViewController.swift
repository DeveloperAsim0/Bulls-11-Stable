//
//  LegalityViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 15/05/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class LegalityViewController: UIViewController {

    @IBOutlet weak var firstroundBTN: UIImageView!
    @IBOutlet weak var secondroundBTN: UIImageView!
    @IBOutlet weak var thirdroundBTN: UIImageView!
    @IBOutlet weak var fourthroundBTN: UIImageView!
    @IBOutlet weak var fifthroundBTN: UIImageView!
    @IBOutlet weak var sixthroundBTN: UIImageView!
    
    fileprivate func CustomizeButton() {
//        firstroundBTN.layer.cornerRadius = firstroundBTN.frame.size.width/2
//        firstroundBTN.clipsToBounds = true
//        secondroundBTN.layer.cornerRadius = secondroundBTN.frame.size.width/2
//        secondroundBTN.clipsToBounds = true
//        thirdroundBTN.layer.borderWidth = 1.0
//        thirdroundBTN.layer.masksToBounds = false
//        thirdroundBTN.layer.borderColor = UIColor.black.cgColor
//        thirdroundBTN.layer.cornerRadius = thirdroundBTN.frame.size.width / 2
//        thirdroundBTN.clipsToBounds = true
//        fourthroundBTN.layer.borderWidth = 1.0
//        fourthroundBTN.layer.masksToBounds = false
//        fourthroundBTN.layer.borderColor = UIColor.black.cgColor
//        fourthroundBTN.layer.cornerRadius = fourthroundBTN.frame.size.width / 2
//        fourthroundBTN.clipsToBounds = true
//        fifthroundBTN.layer.borderWidth = 1.0
//        fifthroundBTN.layer.masksToBounds = false
//        fifthroundBTN.layer.borderColor = UIColor.black.cgColor
//        fifthroundBTN.layer.cornerRadius = fifthroundBTN.frame.size.width / 2
//        fifthroundBTN.clipsToBounds = true
//        sixthroundBTN.layer.cornerRadius = sixthroundBTN.frame.size.width/2
//        sixthroundBTN.clipsToBounds = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = ""

        title = "Legality"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 19/255, blue: 126/255, alpha: 1)
        CustomizeButton()
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
