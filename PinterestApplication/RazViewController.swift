//
//  RazViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 07/08/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit
import Razorpay
import SwiftKeychainWrapper
import Alamofire
import SwiftyJSON

class RazViewController: UIViewController, RazorpayPaymentCompletionProtocol {
    
    

    var razorpayD: RazorpayCheckout!
    var Api_Key = "BULLS11@2020"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        razorpayD = RazorpayCheckout.initWithKey("rzp_test_1DP5mmOlF5G5ag", andDelegate: self)
      showPaymentForm()
        // Do any additional setup after loading the view.
    }
    
    func showPaymentForm() {
//        let vars = Int(cashfield.text!)!
//        var two = vars * 100
        let name = KeychainWrapper.standard.string(forKey: "fullname")
        let email = KeychainWrapper.standard.string(forKey: "email")
        let phone = KeychainWrapper.standard.string(forKey: "phone")
        let params: [String: Any] = [
            "amount": "10000",
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
        
    }
    
    func onPaymentSuccess(_ payment_id: String) {
        let refreshAlert = UIAlertController(title: "Alert", message: "Success", preferredStyle: UIAlertController.Style.alert)
                          refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                            finalModel.paymentID = payment_id
                            self.sendDetails()
                              print("Handle Ok logic here")
                          }))
               self.present(refreshAlert, animated: true, completion: nil)
    }

    func sendDetails() {
           let header:HTTPHeaders = [
                          "X-API-KEY": "\(self.Api_Key)"
                      ]
                  let parameter = [
                   "user_id": KeychainWrapper.standard.string(forKey: "userID")!,
                   "amount": "100",
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
