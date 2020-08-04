//
//  AddCashViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 14/05/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit
import Razorpay
import SafariServices
import Alamofire
import SwiftyJSON
import SwiftKeychainWrapper

class AddCashViewController: UIViewController, RazorpayPaymentCompletionProtocol {
  
    @IBOutlet weak var myview       : UIView!
    @IBOutlet weak var firstBtn     : UIButton!
    @IBOutlet weak var secondBtn    : UIButton!
    @IBOutlet weak var thirdBtn     : UIButton!
    @IBOutlet weak var cashfield    : UITextField!
    @IBOutlet weak var currentBalance: UILabel!
    
    var pofileUrl = "http://projectstatus.co.in/Bulls11/api/authentication/user/"
    var pressamount = String()
    var actualamount = finalModel.currency * 100
    var razorpayD: RazorpayCheckout!
    let URl = "https://projectstatus.co.in/Bulls11/api/authentication/payment-save"
    let Api_Key = "BULLS11@2020"
    
    fileprivate func CustomizeView(){
        myview.layer.shadowColor = UIColor.gray.cgColor
        myview.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        myview.layer.shadowOpacity = 0.5
        myview.layer.shadowRadius = 2.0
       // myview.layer.cornerRadius = cornerRadius
        myview.layer.masksToBounds = false
    }
    
    fileprivate func CustomizeButton(){
        cashfield.layer.borderColor = UIColor.lightGray.cgColor
        cashfield.layer.borderWidth = 1
        cashfield.layer.masksToBounds = true
        
        firstBtn.layer.borderColor = UIColor.lightGray.cgColor
        firstBtn.layer.borderWidth = 1
       // myview.layer.cornerRadius = cornerRadius
        firstBtn.layer.masksToBounds = true
        
        secondBtn.layer.borderColor = UIColor.lightGray.cgColor
        secondBtn.layer.borderWidth = 1
        // myview.layer.cornerRadius = cornerRadius
         secondBtn.layer.masksToBounds = true
        
        thirdBtn.layer.borderColor = UIColor.lightGray.cgColor
        thirdBtn.layer.borderWidth = 1
        // myview.layer.cornerRadius = cornerRadius
         thirdBtn.layer.masksToBounds = true
        
    }
    
    func sendDetails() {
        let header:HTTPHeaders = [
                       "X-API-KEY": "\(self.Api_Key)"
                   ]
               let parameter = [
                "user_id": KeychainWrapper.standard.string(forKey: "userID")!,
                "amount": cashfield.text!,
                "ref_no": finalModel.paymentID
                   
                   ] as [String : Any]
                   print("params:- \(parameter)")
                   AF.request("https://projectstatus.co.in/Bulls11/api/authentication/payment-save", method: .post, parameters: parameter,encoding: JSONEncoding.default, headers: header).authenticate(username: "admin", password: "1234").responseJSON { response in
                              switch response.result {
                              case .success:
                               print(response.result)
                               let result = try? JSON(data: response.data!)
                               print("result:- \(String(describing: result))")
                               break
                              case .failure:
                               print(response.error?.errorDescription)
            }
        }
    }
    
    func showPaymentForm() {
        let vars = Int(cashfield.text!)!
        var two = vars * 100
        let name = KeychainWrapper.standard.string(forKey: "fullname")
        let email = KeychainWrapper.standard.string(forKey: "email")
        let phone = KeychainWrapper.standard.string(forKey: "phone")
        let params: [String: Any] = [
            "amount": two,
            "description": "Sample Product",
            "image": UIImage(named: "logo bulls 11"),
            "name": name,
            "prifill": [
                "contact": phone,
                "email": email
             ],
            "theme": [
                "color": "#CB2D88"
            ]
        ]
        razorpayD.open(params)
    }

    func onPaymentError(_ code: Int32, description str: String) {
        let alert = UIAlertController(title: "Failed", message: "\(str)", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func onPaymentSuccess(_ payment_id: String) {
        let refreshAlert = UIAlertController(title: "Alert", message: "Success", preferredStyle: UIAlertController.Style.alert)
                          refreshAlert.addAction(UIAlertAction(title: "Clear", style: .default, handler: { (action: UIAlertAction!) in
                            finalModel.paymentID = payment_id
                            self.sendDetails()
                              print("Handle Ok logic here")
                          }))
               self.present(refreshAlert, animated: true, completion: nil)
    }
    
    func fetch_Profile() {
        let header:HTTPHeaders = [
            "X-API-KEY": "\(self.Api_Key)"
        ]
        AF.request(self.pofileUrl + KeychainWrapper.standard.string(forKey: "userID")!, method: .get, parameters: nil,encoding: JSONEncoding.default, headers: header).authenticate(username: "admin", password: "1234").responseJSON { response in
                   switch response.result {
                   case .success:
                    print(response.result)
                    let result = try? JSON(data: response.data!)
                    print("myResult:- \(result!.dictionaryValue)")
                    let finalResult = result!.dictionaryValue
                   let bullscoins = finalResult["bulls_coin"]?.stringValue
                    self.currentBalance.text = "₹" + bullscoins!
                    break
                   case .failure:
                    print(response.error.debugDescription)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = ""
        razorpayD = RazorpayCheckout.initWithKey("rzp_test_1DP5mmOlF5G5ag", andDelegate: self)
        title = "Add Cash"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 212/255, green: 71/255, blue: 140/255, alpha: 1)
        cashfield.text = "100"
         CustomizeButton()
         CustomizeView()
        fetch_Profile()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetch_Profile()
    }
    
    @IBAction func setcashValue1(_ sender: Any) {
        self.cashfield.text = nil
        self.cashfield.text = "100"
    }
    
    @IBAction func setcashValue2(_ sender: Any) {
        self.cashfield.text = nil
        self.cashfield.text = "200"
    }

    @IBAction func setcashValue3(_ sender: Any) {
        self.cashfield.text = nil
        self.cashfield.text = "500"
    }
    
    @IBAction func addCashRedirect(_ sender: Any){
        showPaymentForm()
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
