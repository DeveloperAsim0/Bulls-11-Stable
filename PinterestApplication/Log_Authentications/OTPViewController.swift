//
//  OTPViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 11/05/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftKeychainWrapper

class OTPViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var text: UITextField!
    @IBOutlet weak var email: UILabel!
    
    let maxValue = 1
    let api_key = "BULLS11@2020"
    
    fileprivate func switch_text_field() {
        
    }
    
    fileprivate func CustomNavBar(){
        title = "OTP"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 41/255, blue: 122/255, alpha: 1)
        email.text = KeychainWrapper.standard.string(forKey: "email")
    }
    
    func Fetch_Details() {
       
        let email = KeychainWrapper.standard.string(forKey: "email")
        let header:HTTPHeaders = [
            "X-API-KEY": "\(self.api_key)"
        ]
        
        let parameters = [
            "email": email,
            "otp": text.text
        ]
        
        AF.request("https://projectstatus.co.in/Bulls11/api/authentication/otp-varify", method: .post, parameters: parameters as Parameters,encoding: JSONEncoding.default, headers: header).authenticate(username: "admin", password: "1234").responseJSON { response in
            switch response.result {
            case .success:
                print(response.result)
                let myresult = try? JSON(data: response.data!)
                print("myresult:- \(myresult!["status"])")
                let status = myresult!["status"]
                if status == false {
                    let refreshAlert = UIAlertController(title: "Wrong Otp", message: "Please insert correct otp", preferredStyle: .alert)
                    refreshAlert.addAction(UIAlertAction(title: "Enter Again", style: .default, handler: nil))
                    self.present(refreshAlert, animated: true, completion: nil)
                    
                } else {
                    UserDefaults.standard.set(true, forKey: "UserHasSubmittedPassword")
                    let refreshAlert = UIAlertController(title: "Successfully Activated", message: "", preferredStyle: .alert)
                    refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                        
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let vc = storyboard.instantiateViewController(withIdentifier: "customtab")
                        let appDelegate = UIApplication.shared.delegate as! AppDelegate
                        appDelegate.window?.rootViewController = vc
                        vc.modalPresentationStyle = .fullScreen
                        self.present(vc, animated: true, completion: nil)
                    }))
                    self.present(refreshAlert, animated: true, completion: nil)
                }
            case .failure(let eror):
                print(eror.errorDescription)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CustomNavBar()
       
        // Do any additional setup after loading the view.
    }
    
    @IBAction func activate(_ sender: Any){
        Fetch_Details()
    }
    
}
