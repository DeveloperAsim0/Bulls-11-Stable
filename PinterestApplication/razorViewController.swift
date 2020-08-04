//
//  razorViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 28/07/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit
import Razorpay
import  Alamofire
import SwiftyJSON

class razorViewController: UIViewController, RazorpayPaymentCompletionProtocol {
  
    
    var pressamount = String()
    var actualamount = finalModel.currency * 100
    var razorpayD: RazorpayCheckout!
    let URl = "https://projectstatus.co.in/Bulls11/api/authentication/payment-save"
    let Api_Key = "BULLS11@2020"
    

//    func sendDetails() {
//        let header:HTTPHeaders = [
//                       "X-API-KEY": "\(self.Api_Key)"
//                   ]
//               let parameter = [
//                "user_id": KeychainWrapper.standard.string(forKey: "userID")!,
//                "amount": cashfield.text!,
//                "ref_no": finalModel.paymentID
//
//                   ] as [String : Any]
//                   print("params:- \(parameter)")
//                   AF.request("https://projectstatus.co.in/Bulls11/api/authentication/payment-save", method: .post, parameters: parameter,encoding: JSONEncoding.default, headers: header).authenticate(username: "admin", password: "1234").responseJSON { response in
//                              switch response.result {
//                              case .success:
//                               print(response.result)
//                               let result = try? JSON(data: response.data!)
//                               print("result:- \(String(describing: result))")
//                               break
//                              case .failure:
//                               print(response.error?.errorDescription)
//            }
//        }
//    }
    
    func showPaymentForm() {
     //   let vars = Int(cashfield.text!)!
      //  var two = vars * 100
        let params: [String: Any] = [
            "amount": "10000",
            "description": "Sample Product",
            "image": UIImage(named: "logo bulls 11"),
            "name": "Mihir-vyas",
            "prifill": [
                "contact": "9876543201",
                "email": "mihir@acentriatech.com"
             ],
            "theme": [
                "color": "#CB2D88"
            ]
        ]
        razorpayD.open(params)
    }

    func onPaymentError(_ code: Int32, description str: String) {
//        let alert = UIAlertController(title: "Failed", message: "\(str)", preferredStyle: .alert)
//        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//        alert.addAction(action)
//        self.present(alert, animated: true, completion: nil)
    }
    
    func onPaymentSuccess(_ payment_id: String) {
//        let refreshAlert = UIAlertController(title: "Alert", message: "Success", preferredStyle: UIAlertController.Style.alert)
//                          refreshAlert.addAction(UIAlertAction(title: "Clear", style: .default, handler: { (action: UIAlertAction!) in
//                            finalModel.paymentID = payment_id
//                            self.sendDetails()
//                              print("Handle Ok logic here")
//                          }))
//               self.present(refreshAlert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = ""
        razorpayD = RazorpayCheckout.initWithKey("rzp_test_1DP5mmOlF5G5ag", andDelegate: self)
        title = "Add Cash"
        showPaymentForm()
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 212/255, green: 71/255, blue: 140/255, alpha: 1)
       
        // Do any additional setup after loading the view.
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
