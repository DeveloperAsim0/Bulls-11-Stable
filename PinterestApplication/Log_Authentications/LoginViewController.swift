//
//  LoginViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 11/05/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit
import IQKeyboardManager
import Alamofire
import SwiftyJSON
import SwiftKeychainWrapper

class LoginViewController: UIViewController {

    @IBOutlet weak var myactivity: UIActivityIndicatorView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var mobileEmail: UITextField!
    
    let Login_URL = "https://projectstatus.co.in/Bulls11/api/authentication/login"
    let Api_Key = "BULLS11@2020"
    
    fileprivate func CustomNavBar(){
        self.navigationController?.navigationBar.tintColor = UIColor.white
           title = "Login"
           let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
           navigationController?.navigationBar.titleTextAttributes = textAttributes
           self.navigationController?.navigationBar.barTintColor = UIColor(red: 212/255, green: 71/255, blue: 140/255, alpha: 1)
       }
       
       fileprivate func CustomizeTextField() {
               mobileEmail.attributedPlaceholder = NSAttributedString(string: "  Enter Email.", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
               passwordField.attributedPlaceholder = NSAttributedString(string: "  Enter Password.", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
           }
       
       fileprivate func CustomizeRegisterBtn() {
           loginBtn.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
           loginBtn.layer.shadowOffset = CGSize(width: 0, height: 3)
           loginBtn.layer.shadowOpacity = 1.0
           loginBtn.layer.shadowRadius = 10.0
           loginBtn.layer.masksToBounds = false
       }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myactivity.isHidden = true
        CustomNavBar()
        CustomizeTextField()
        CustomizeRegisterBtn()
        // Do any additional setup after loading the view.
    }

    
      func Fetch_Data() {
        self.myactivity.isHidden = false
        self.myactivity.startAnimating()
        let header:HTTPHeaders = [
            "X-API-KEY": "\(self.Api_Key)"
        ]
        
        let parameters = [
            "email": mobileEmail.text,
            "password": passwordField.text
        ]
        
        AF.request(self.Login_URL, method: .post, parameters: parameters,encoding: JSONEncoding.default, headers: header).authenticate(username: "admin", password: "1234").responseJSON { response in
            switch response.result {
            case .success:
                print(response.result)
                let myresult = try? JSON(data: response.data!)
                if myresult?["status"] == false {
                    let alert = UIAlertController(title: "Alert", message: "Wrong Email or Password", preferredStyle: .alert)
                    self.present(alert, animated: true, completion: nil)

                    // change to desired number of seconds (in this case 5 seconds)
                    let when = DispatchTime.now() + 2
                    DispatchQueue.main.asyncAfter(deadline: when){
                      // your code with delay
                      alert.dismiss(animated: true, completion: nil)
                    }
                } else {
                    print(Date().description(with: .current))
                    let Result = myresult!["data"].dictionaryValue
                    let userid = Result["id"]!.stringValue
                    Login_Model.id.append(userid)
                    let referralCode = Result["referal_code"]!.stringValue
                    let isRefferal: Bool = KeychainWrapper.standard.set(referralCode, forKey: "refferalCode")
                    let lastname = Result["last_name"]!.stringValue
                    Login_Model.last_name.append(lastname)
                    let firstname = Result["first_name"]!.stringValue
                    Login_Model.first_name.append(firstname)
                    let profile = Result["profile_pic"]!.stringValue
                    Login_Model.profile_pic.append(profile)
                    print("mine:- \(String(describing: myresult?["message"].stringValue))")
                    let isSaved: Bool = KeychainWrapper.standard.set(userid, forKey: "userID")
                    print("useri:- \(KeychainWrapper.standard.string(forKey: "userID"))")
                    let isProfile = KeychainWrapper.standard.set(profile, forKey: "profilepic")
                    let isFullName: Bool = KeychainWrapper.standard.set(firstname + lastname, forKey: "fullname")
                     UserDefaults.standard.set(true, forKey: "UserHasSubmittedPassword")
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "customtab")
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    appDelegate.window?.rootViewController = vc
//                    vc.modalPresentationStyle = .fullScreen
//                    self.present(vc, animated: true, completion: nil)
                }
                self.myactivity.stopAnimating()
                self.myactivity.isHidden = true
                break
            case .failure(let eror):
                print(eror.errorDescription)
            }
        }
        
    }
    
    @IBAction func LoginBTN(_ sender: Any){
        if mobileEmail.text == "" || passwordField.text == "" {
            emailView.shake()
            passwordView.shake()
        } else {
            Fetch_Data()
            print("textField has some text")
        }
    }
    
    @IBAction func RegisterBtnSegue(_ sender: Any){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "signupSegue")
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension UIView {
    func shake(duration timeDuration: Double = 0.07, repeat countRepeat: Float = 3){
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = timeDuration
        animation.repeatCount = countRepeat
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        self.layer.add(animation, forKey: "position")
    }
}

