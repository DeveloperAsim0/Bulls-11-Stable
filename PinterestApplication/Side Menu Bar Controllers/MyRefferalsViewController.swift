//
//  MyRefferalsViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 13/05/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import Alamofire
import SwiftyJSON

class MyRefferalsViewController: UIViewController {
    
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var refferalcode: UILabel!
    @IBOutlet weak var filed: UITextField!
    @IBOutlet weak var shareBtn: UIButton!
    
    var usertype = String()
    var mymin = ""
    var myexp = ""
    let Profile_URL = "http://projectstatus.co.in/Bulls11/api/authentication/user/"
    let Api_Key = "BULLS11@2020"
    let cornerRadius: CGFloat = 6.0
    var coun = 0
    fileprivate func CustomNavBar(){
        filed.attributedPlaceholder = NSAttributedString(string: "Enter Code", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
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
        self.refferalcode.text = KeychainWrapper.standard.string(forKey: "refferalCode")
        CustomNavBar()
        CustomizeView()
        print("myvalidity\(KeychainWrapper.standard.removeObject(forKey: "validity"))")
        Fetch_Profile()
        print("myvali:- \(self.usertype)")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        Fetch_Profile()
    }
    
    func Fetch_Profile() {
        let header:HTTPHeaders = [
            "X-API-KEY": "\(self.Api_Key)"
        ]
        
        AF.request(self.Profile_URL + KeychainWrapper.standard.string(forKey: "userID")!, method: .get, parameters: nil,encoding: JSONEncoding.default, headers: header).authenticate(username: "admin", password: "1234").responseJSON{ response in
            switch response.result {
            case .success:
                print("ok:-\(response.result)")
                let result = try? JSON(data: response.data!)
                print("myResult:- \(result!.dictionaryValue)")
                let finalResult = result!.dictionaryValue
                print("firstname:- \(finalResult["first_name"]!.stringValue)")
                let fullname = finalResult["first_name"]!.stringValue + finalResult["last_name"]!.stringValue
                let expvalidity = finalResult["subs_exp"]!.stringValue
                self.myexp = expvalidity
                let mimvalidity = finalResult["subs_date"]!.stringValue
                self.mymin = mimvalidity
                let usertype = finalResult["user_type"]!.stringValue
                self.usertype = usertype
                break
            case .failure:
                print(response.error.debugDescription)
            }
        }
    }
    
    @IBAction func share(_ sender: Any){
        let code = self.refferalcode.text
        let image = #imageLiteral(resourceName: "bulls point")
        let shares = [code, image] as [Any]
        let activityVC = UIActivityViewController(activityItems: shares, applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
        print("hurray !!!!!!")
    }
    
    @IBAction func Partner(_ sender: Any){
        if usertype == "P" {
            
            let refreshAlert = UIAlertController(title: "Alert", message: "You can purchase subscription once a year", preferredStyle: .alert)
            refreshAlert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(refreshAlert, animated: true, completion: nil)
            
        } else {
            let value = 1
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "addcash") as! AddCashViewController
            vc.modalPresentationStyle = .fullScreen
            vc.valu = "P"
            vc.valu1 = value
            vc.amou = "1000"
            vc.check = 1
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
}
