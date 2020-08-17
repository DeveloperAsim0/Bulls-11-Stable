//
//  ForGetviewViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 10/08/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftKeychainWrapper

class ForGetviewViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var myView: UIView!

    var apikey = "BULLS11@2020"
    
    fileprivate func CustomNavBar(){
           self.navigationController?.navigationBar.tintColor = UIColor.white
              title = "Update Password"
              let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
              navigationController?.navigationBar.titleTextAttributes = textAttributes
             self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 19/255, blue: 126/255, alpha: 1)
          }
          
          fileprivate func CustomizeTextField() {
                  emailField.attributedPlaceholder = NSAttributedString(string: "  Enter Email.", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
              }
    
    func Get_Details() {
        let header:HTTPHeaders = [
                   "X-API-KEY": "\(self.apikey)"
               ]
               
               let parameters = [
                "email": emailField.text
               ]
               
        AF.request("https://projectstatus.co.in/Bulls11/api/authentication/email-validate", method: .post, parameters: parameters as Parameters,encoding: JSONEncoding.default, headers: header).authenticate(username: "admin", password: "1234").responseJSON { response in
                   switch response.result {
                   case .success:
                   print(response.result)
                  let refreshAlert = UIAlertController(title: "Alert", message: "Check your mail for otp", preferredStyle: UIAlertController.Style.alert)
                             refreshAlert.addAction(UIAlertAction(title: "ok", style: .default, handler: { (action: UIAlertAction!) in
//                          KeychainWrapper.standard.set(self.emailField.text!, forKey: "emailtext")
                                             let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                            let vc = storyboard.instantiateViewController(withIdentifier: "updatepassotp") as! UpdatpassotpViewController
                                vc.emailstring = self.emailField.text!
                                            self.navigationController?.pushViewController(vc, animated: true)
                                 print("Handle Ok logic here")
                             }))
                  self.present(refreshAlert, animated: true, completion: nil)
                  
                   case .failure(let eror):
                     print(eror.errorDescription)
                }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CustomizeTextField()
        CustomNavBar()
        // Do any additional setup after loading the view.
    }

    @IBAction func sendOTP(_ sender: Any){
        if emailField.text == "" {
                   myView.shake()
                   
               } else {
                    Get_Details()
                   print("textField has some text")
               }
       
    }

}
