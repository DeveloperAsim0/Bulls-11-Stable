//
//  UpdatpassotpViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 10/08/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftKeychainWrapper

class UpdatpassotpViewController: UIViewController {

    @IBOutlet weak var emaillbl: UILabel!
    @IBOutlet weak var textfil: UITextField!
    @IBOutlet weak var myView: UIView!
    
    var emailstring = ""
    fileprivate func CustomNavBar(){
        title = "OTP"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 19/255, blue: 126/255, alpha: 1)
        emaillbl.text = emailstring
    }
     let api_key = "BULLS11@2020"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    CustomNavBar()
        // Do any additional setup after loading the view.
    }
    
    func Fetch_Details() {
       
//        let email = KeychainWrapper.standard.string(forKey: "emailtext")
        let header:HTTPHeaders = [
            "X-API-KEY": "\(self.api_key)"
        ]
        
        let parameters = [
            "email": emailstring,
            "otp": textfil.text
            ] as [String : Any]
        
        AF.request("https://projectstatus.co.in/Bulls11/api/authentication/otp-varify", method: .post, parameters: parameters as Parameters,encoding: JSONEncoding.default, headers: header).authenticate(username: "admin", password: "1234").responseJSON { response in
            switch response.result {
            case .success:
                print(response.result)
                let myresult = try? JSON(data: response.data!)
                print("myresult:- \(myresult!["status"])")
                let status = myresult!["status"]
                if status == false {
                    let refreshAlert = UIAlertController(title: "Wrong Otp", message: "Please insert correct otp", preferredStyle: .alert)
                    refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(refreshAlert, animated: true, completion: nil)
                } else {
                    let refreshAlert = UIAlertController(title:"Email Verified", message: "", preferredStyle: .alert)
                    refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                        
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let vc = storyboard.instantiateViewController(withIdentifier: "updatepassword") as! UpdatePasswordViewController
                        vc.savedString = self.emailstring
                        vc.modalPresentationStyle = .fullScreen
                        self.navigationController!.pushViewController(vc, animated: true)
                    }))
                    self.present(refreshAlert, animated: true, completion: nil)
                }
            case .failure(let eror):
                print(eror.errorDescription)
            }
        }
    }
    
    func resendOTP() {
        let header:HTTPHeaders = [
                   "X-API-KEY": "\(self.api_key)"
               ]
               
               let parameters = [
                   "email": emailstring,
                   ] as [String : Any]
               
               AF.request("https://projectstatus.co.in/Bulls11/api/authentication/resend-otp", method: .post, parameters: parameters as Parameters,encoding: JSONEncoding.default, headers: header).authenticate(username: "admin", password: "1234").responseJSON { response in
                   switch response.result {
                   case .success:
                       print(response.result)
                           let refreshAlert = UIAlertController(title:"Alert", message: "Please check your mail for otp", preferredStyle: .alert)
                           refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                           }))
                           self.present(refreshAlert, animated: true, completion: nil)
                       
                   case .failure(let eror):
                       print(eror.errorDescription)
                   }
               }
           }
    
    
    @IBAction func validateOTP(_ sender: Any){
        if textfil.text == "" {
                         myView.shake()
                         
                     } else {
                          Fetch_Details()
                         print("textField has some text")
                     }
    }
        @IBAction func ResendOTP(_ sender: Any){
               resendOTP()
           }

    
}
    
   

