//
//  UpdatePasswordViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 10/08/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftKeychainWrapper

class UpdatePasswordViewController: UIViewController {

    @IBOutlet weak var passBtn: UIButton!
    @IBOutlet weak var pass1: UITextField!
    @IBOutlet weak var passview1: UIView!
    
    var savedString = ""
    var apikey = "BULLS11@2020"
    fileprivate func CustomNavBar(){
        self.navigationController?.navigationBar.tintColor = UIColor.white
           title = "Update Password"
           let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
           navigationController?.navigationBar.titleTextAttributes = textAttributes
           self.navigationController?.navigationBar.barTintColor = UIColor(red: 212/255, green: 71/255, blue: 140/255, alpha: 1)
       }
       
       fileprivate func CustomizeTextField() {
               pass1.attributedPlaceholder = NSAttributedString(string: "  Enter Password.", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
           }
       
       fileprivate func CustomizePasswordBtn() {
           passBtn.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
           passBtn.layer.shadowOffset = CGSize(width: 0, height: 3)
           passBtn.layer.shadowOpacity = 1.0
           passBtn.layer.shadowRadius = 10.0
           passBtn.layer.masksToBounds = false
       }
    
    func Get_Details() {
        let header:HTTPHeaders = [
                   "X-API-KEY": "\(self.apikey)"
               ]
               
               let parameters = [
                "email": savedString,
                "password": pass1.text
                ] as [String : Any]
               
               AF.request("https://projectstatus.co.in/Bulls11/api/authentication/update-password", method: .post, parameters: parameters,encoding: JSONEncoding.default, headers: header).authenticate(username: "admin", password: "1234").responseJSON { response in
                   switch response.result {
                   case .success:
                   print(response.result)
                   let refreshAlert = UIAlertController(title: "Alert", message: "Successfully Updated", preferredStyle: UIAlertController.Style.alert)
                                               refreshAlert.addAction(UIAlertAction(title: "ok", style: .default, handler: { (action: UIAlertAction!) in
                                           
                                                               let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                                                                 let vc = storyboard.instantiateViewController(withIdentifier: "loginSegue")
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
        CustomNavBar()
        CustomizeTextField()
        CustomizePasswordBtn()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func set(_ sender: Any){
        if pass1.text == "" {
                         passview1.shake()
                         
                     } else {
                         Get_Details()
                         print("textField has some text")
                     }
        
    }
    
}

extension UIView {
    func shaked(duration timeDuration: Double = 0.07, repeat countRepeat: Float = 3){
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = timeDuration
        animation.repeatCount = countRepeat
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        self.layer.add(animation, forKey: "position")
    }
}

