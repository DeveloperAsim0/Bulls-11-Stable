//
//  SubscriptionPartner.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 11/08/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

class SubscriptionPartner: UIViewController {
    @IBOutlet weak var first: UIButton!
    @IBOutlet weak var second: UIButton!
    @IBOutlet weak var third: UIButton!
    @IBOutlet weak var fourth: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
      //  KeychainWrapper.standard.removeObject(forKey: "condition")
        print(KeychainWrapper.standard.string(forKey: "conditon"))
        if KeychainWrapper.standard.string(forKey: "conditon") != nil {
           
            let refreshAlert = UIAlertController(title: "Alert", message: "You can only puchase subscription once a month", preferredStyle: .actionSheet)
                       refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                       self.present(refreshAlert, animated: true, completion: nil)
            self.first.isUserInteractionEnabled = false
            self.second.isUserInteractionEnabled = false
            self.third.isUserInteractionEnabled = false
            self.fourth.isUserInteractionEnabled = false
        } else {
            print("welldone")
        }
    }
    
    @IBAction func first(_ sender: Any){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "addcash") as! AddCashViewController
        vc.modalPresentationStyle = .fullScreen
        vc.valu = 1
        vc.subsfor = "monthly"
        vc.amou = "250"
        vc.check = 1
        var condition = "sure"
        KeychainWrapper.standard.set(condition, forKey: "conditon")
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func second(_ sender: Any){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "addcash") as! AddCashViewController
        vc.modalPresentationStyle = .fullScreen
        vc.valu = 1
        vc.subsfor = "quarterly"
        vc.amou = "650"
        vc.check = 1
        var condition = "sure"
        KeychainWrapper.standard.set(condition, forKey: "conditon")
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func third(_ sender: Any){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "addcash") as! AddCashViewController
        vc.modalPresentationStyle = .fullScreen
        vc.valu = 1
        vc.subsfor = "half"
        vc.amou = "1200"
        vc.check = 1
        var condition = "sure"
        KeychainWrapper.standard.set(condition, forKey: "conditon")
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func fourth(_ sender: Any){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "addcash") as! AddCashViewController
        vc.modalPresentationStyle = .fullScreen
        vc.valu = 1
        vc.subsfor = "anually"
        vc.amou = "2000"
        vc.check = 1
        var condition = "sure"
        KeychainWrapper.standard.set(condition, forKey: "conditon")
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
