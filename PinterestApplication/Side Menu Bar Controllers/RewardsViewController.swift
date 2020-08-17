//
//  RewardsViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 14/05/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftKeychainWrapper

class RewardsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let API_URL = "https://projectstatus.co.in/Bulls11/api/authentication/coupen-code"
    let Api_Key = "BULLS11@2020"
    var selectCoupon = String()
    var selectAmount = String()
    
    fileprivate func CustomizeView(){
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    func Get_Details() {
        let header:HTTPHeaders = [
                   "X-API-KEY": "\(self.Api_Key)"
               ]
               
               AF.request(self.API_URL, method: .get, parameters: nil,encoding: JSONEncoding.default, headers: header).authenticate(username: "admin", password: "1234").responseJSON{ response in
                   switch response.result {
                          case .success:
                           print("ok:-\(response.result)")
                           let result = try? JSON(data: response.data!)
                           print("results:= \(result!["data"])")
                           let data = result!["data"]
                           refferalSaved.code.removeAll()
                           refferalSaved.couponid.removeAll()
                           refferalSaved.couponValue.removeAll()
                           refferalSaved.details.removeAll()
                           refferalSaved.datetime.removeAll()
                           for i in data.arrayValue {
                            let code        = i["code"].stringValue
                            refferalSaved.code.append(code)
                            let datetime    = i["coupen_validity"].stringValue
                            refferalSaved.datetime.append(datetime)
                            let couponValue = i["coupen_value"].stringValue
                            refferalSaved.couponValue.append(couponValue)
                            let couponid    = i["coupen_id"].stringValue
                            refferalSaved.couponid.append(couponid)
                            let details     = i["coupen_details"].stringValue
                            refferalSaved.details.append(details)
                           }
                           self.tableView.reloadData()
                           break
                          case .failure:
                           print(response.error.debugDescription)
                   }
           }
    }
    
    func set_Details() {
        let userid = KeychainWrapper.standard.string(forKey: "userID")
        let header:HTTPHeaders = [
                          "X-API-KEY": "\(self.Api_Key)"
                      ]
        let parameters = [
            "user_id": userid,
            "coupen_id": selectCoupon,
            "amount": selectAmount
        ]
                      print("params:- \(parameters)")
        AF.request("https://projectstatus.co.in/Bulls11/api/authentication/apply-coupen-code", method: .post, parameters: parameters,encoding: JSONEncoding.default, headers: header).authenticate(username: "admin", password: "1234").responseJSON{ response in
                          switch response.result {
                                 case .success:
                                  print("ok:-\(response.result)")
                                  let result = try? JSON(data: response.data!)
                                  let data = result!["message"].stringValue
                                  let refreshAlert = UIAlertController(title: "Success", message: "\(data)", preferredStyle: .alert)
                                  refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                                  self.present(refreshAlert, animated: true, completion: nil)
                                  break
                                 case .failure:
                                  print(response.error.debugDescription)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = ""
        title = "Rewards"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 19/255, blue: 126/255, alpha: 1)
         CustomizeView()
         Get_Details()
    }
}

extension RewardsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refferalSaved.couponid.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "rewardcell") as! RewardTableViewCell
        cell.details.text = refferalSaved.details[indexPath.row]
        cell.date.text = refferalSaved.datetime[indexPath.row]
        cell.price.text = "₹" + refferalSaved.couponValue[indexPath.row]
         return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rewardcell") as! RewardTableViewCell
        self.selectCoupon = refferalSaved.couponid[indexPath.row]
        self.selectAmount = refferalSaved.couponValue[indexPath.row]
        set_Details()
    }
    
}
