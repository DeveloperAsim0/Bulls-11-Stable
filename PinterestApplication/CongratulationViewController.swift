//
//  CongratulationViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 10/06/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class CongratulationViewController: UIViewController {
    
    @IBOutlet weak var skipbtn: UIButton!
    @IBOutlet weak var congratulation: UILabel!
    @IBOutlet weak var betterlucknexttime: UILabel!
    @IBOutlet weak var pointsadd: UILabel!
    
    fileprivate func customBtn() {
        skipbtn.layer.cornerRadius = 5
        skipbtn.layer.borderWidth = 2
        skipbtn.layer.borderColor = UIColor.white.cgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customBtn()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Skip(_ sender: Any) {
        let alert = UIAlertController(title: "Winner", message: "Congratulation", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "customtab")
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
}
