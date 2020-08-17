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
    var emailSaved = ""
    
    fileprivate func switch_text_field() {
        
    }
    
    fileprivate func CustomNavBar(){
        title = "OTP"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 19/255, blue: 126/255, alpha: 1)
        email.text = emailSaved
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
         let currentText = text.text ?? ""

           // attempt to read the range they are trying to change, or exit if we can't
           guard let stringRange = Range(range, in: currentText) else { return false }

           // add their new text to the existing text
           let updatedText = currentText.replacingCharacters(in: stringRange, with: string)

           // make sure the result is under 16 characters
           return updatedText.count <= 6
    }
    
    func Fetch_Details() {
       
//        let email = KeychainWrapper.standard.string(forKey: "email")
        let header:HTTPHeaders = [
            "X-API-KEY": "\(self.api_key)"
        ]
        
        let parameters = [
            "email": email.text,
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
                    refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(refreshAlert, animated: true, completion: nil)
                    
                } else {
                    let refreshAlert = UIAlertController(title: "Successfully Activated", message: "", preferredStyle: .alert)
                    refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                        
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let vc = storyboard.instantiateViewController(withIdentifier: "loginSegue") as! LoginViewController
                        
//                        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//                        appDelegate.window?.rootViewController = vc
                         vc.modalPresentationStyle = .fullScreen
                        vc.navigationItem.hidesBackButton = true
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
            "email": email.text,
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CustomNavBar()
       
        // Do any additional setup after loading the view.
    }
    
    @IBAction func activate(_ sender: Any){
        Fetch_Details()
    }
    
    @IBAction func resendOTP(_ sender: Any){
        resendOTP()
    }
    
}
