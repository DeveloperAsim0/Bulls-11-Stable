//
//  ContestViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 13/05/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftKeychainWrapper

class ContestViewController: UIViewController {

    @IBOutlet weak var leadingConstraints: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableView2: UITableView!
    @IBOutlet weak var tableView3: UITableView!
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var sideMenu: UIView!
    @IBOutlet weak var dailybtn: UIButton!
    @IBOutlet weak var weeklybtn: UIButton!
    
    
    var List_URL = "http://projectstatus.co.in/Bulls11/api/authentication/date-list"
    let Profile_URL = "http://projectstatus.co.in/Bulls11/api/authentication/user/"
    var sideMenu2 = false
    let Api_Key = "BULLS11@2020"
    var namearr = ["My Profile", "Weekly Leaderboard", "Hall of Fame", "My Balance", "My Rewards & Offer", "My Refferals", "Point Systems", "Logout"]
    
    var iconArr = ["myprofile", "my_contest_icon", "hall_of_fame", "mybalance", "myrewardsoffers", "myreferrals", "myinfosettings", "logout"]
    
    fileprivate func CustomNavBar(){
        title = "RESULT"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 212/255, green: 71/255, blue: 140/255, alpha: 1)
    }
    
    func Fetch_Profile() {
        let header:HTTPHeaders = [
            "X-API-KEY": "\(self.Api_Key)"
        ]
        
        AF.request(self.Profile_URL + KeychainWrapper.standard.string(forKey: "userID")!, method: .get, parameters: nil,encoding: JSONEncoding.default, headers: header).authenticate(username: "admin", password: "1234").responseJSON{ response in
            switch response.result {
                   case .success:
                    print("ok:-\(response.result)")
                    let result = try? JSON(data: response.data!)
                    print("myResult:- \(result!.dictionaryValue)")
                    let finalResult = result!.dictionaryValue
                    print("firstname:- \(finalResult["first_name"]!.stringValue)")
                    let fullname = finalResult["first_name"]!.stringValue + finalResult["last_name"]!.stringValue
                    self.username.text = fullname
                    let profilepic = finalResult["profile_pic"]?.stringValue
                    self.profilePic.sd_setImage(with: URL(string: profilepic!), placeholderImage: UIImage(named: "user icon"))
                    break
                   case .failure:
                    print(response.error.debugDescription)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.profilePic.layer.cornerRadius = self.profilePic.frame.size.width/2
        sideMenu.layer.borderColor = UIColor.darkGray.cgColor
        sideMenu.layer.borderWidth = 1
        sideMenu.layer.masksToBounds = true
         Fetch_Data()
         CustomNavBar()
        Fetch_Profile()
        tableView3.isHidden = true
        dailybtn.layer.cornerRadius = 10
        dailybtn.clipsToBounds = true
        
        weeklybtn.layer.cornerRadius = 10
        weeklybtn.clipsToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        Fetch_Data()
        Fetch_Profile()
    }
    func Fetch_Data() {
        let header:HTTPHeaders = [
            "X-API-KEY": "\(self.Api_Key)"
        ]
        
        AF.request(self.List_URL, method: .get, parameters: nil,encoding: JSONEncoding.default, headers: header).authenticate(username: "admin", password: "1234").responseJSON { response in
            switch response.result {
            case .success:
                print(response.result)
                let myresult = try? JSON(data: response.data!)
                print(myresult!["data"])
                let resultArray = myresult!["data"]
                model.date.removeAll()
                model.dateID.removeAll()
                model.totalSlots.removeAll()
                model.paidUsers.removeAll()
                model.freeUsers.removeAll()
                model.prizeAmount.removeAll()
                for i in resultArray.arrayValue {
                    print("y i value:- \(i)")
                    let details = i["small_content"].stringValue
                    model.date_details.append(details)
                    let id = i["d_id"].stringValue
                    print("id:- \(id)")
                    model.dateID.append(id)
                    let date = i["dates"].stringValue
                    model.date.append(date)
                    let prizeAmount = i["dates"].stringValue
                    model.prizeAmount.append(prizeAmount)
                    let paidUsers = i["paid_users"].stringValue
                    model.paidUsers.append(paidUsers)
                    let freeUsers = i["free_users"].stringValue
                    model.freeUsers.append(freeUsers)
                    let totalSlots = i["small_content"].stringValue
                    model.totalSlots.append(totalSlots)
                }
                self.tableView.reloadData()
                break
            case .failure(let eror):
                print(eror.errorDescription)
            }
        }
    }
    
    func Fetch_Data2() {
        let header:HTTPHeaders = [
            "X-API-KEY": "\(self.Api_Key)"
        ]
        
        AF.request("http://projectstatus.co.in/Bulls11/api/authentication/weekly-date-list", method: .get, parameters: nil,encoding: JSONEncoding.default, headers: header).authenticate(username: "admin", password: "1234").responseJSON { response in
            switch response.result {
            case .success:
                print(response.result)
                let myresult = try? JSON(data: response.data!)
                print(myresult!["data"])
                let resultArray = myresult!["data"]
                model.date.removeAll()
                model.dateID.removeAll()
                model.totalSlots.removeAll()
                model.paidUsers.removeAll()
                model.freeUsers.removeAll()
                model.prizeAmount.removeAll()
                for i in resultArray.arrayValue {
                    print("y i value:- \(i)")
                    let details = i["small_content"].stringValue
                    model.date_details.append(details)
                    let id = i["d_id"].stringValue
                    print("id:- \(id)")
                    model.dateID.append(id)
                    let date = i["dates"].stringValue
                    model.date.append(date)
                    let prizeAmount = i["dates"].stringValue
                    model.prizeAmount.append(prizeAmount)
                    let paidUsers = i["paid_users"].stringValue
                    model.paidUsers.append(paidUsers)
                    let freeUsers = i["free_users"].stringValue
                    model.freeUsers.append(freeUsers)
                    let totalSlots = i["small_content"].stringValue
                    model.totalSlots.append(totalSlots)
                }
                self.tableView3.reloadData()
                break
            case .failure(let eror):
                print(eror.errorDescription)
            }
        }
    }
    
    
    @IBAction func Daily(_ sender: Any){
        self.List_URL = "http://projectstatus.co.in/Bulls11/api/authentication/date-list"
        Fetch_Data()
        tableView3.isHidden = true
        tableView2.isHidden = false
    }
    
    @IBAction func weekly(_ sender: Any){
         Fetch_Data2()
        tableView2.isHidden = true
        tableView3.isHidden = false
    }
    
    @IBAction func openSideMenu(_ sender: Any){
        if (sideMenu2) {
            leadingConstraints.constant = -260
            UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseIn, animations: {
                self.view.layoutIfNeeded()
                self.view.backgroundColor = .white
            })
        } else {
            leadingConstraints.constant = 0
            UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseIn, animations: {
                self.view.layoutIfNeeded()
              //  self.view.backgroundColor = UIColor(red: 155/255, green: 156/255, blue: 157/255, alpha: 1)
            })
        }
        
        sideMenu2 = !sideMenu2
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

extension ContestViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView.tag == 1{
            return UITableView.automaticDimension
        } else if tableView.tag == 2 {
            return 120
        } else if tableView.tag == 3{
        return 120
        }
        return 120
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 1 {
            return 8
        }else if tableView.tag == 2  {
        return model.dateID.count
        } else if tableView.tag == 3 {
            return model.dateID.count
        }
        return model.dateID.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 1{
            let cell = tableView2.dequeueReusableCell(withIdentifier: "more") as! sidemenuCell
            cell.name.text = namearr[indexPath.row]
            cell.icon.image = UIImage(named: iconArr[indexPath.row])
            return cell
        } else if tableView.tag == 2{
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultcontestcell") as! ResultContestTableViewCell
        cell.price_Amount.text = model.prizeAmount[indexPath.row]
        cell.price_Kitty.text = model.totalSlots[indexPath.row]
        return cell
        } else if tableView.tag == 3 {
            let cell = tableView3.dequeueReusableCell(withIdentifier: "resultcontestcell") as! ResultContestTableViewCell
            cell.price_Amount.text = "₹" + model.prizeAmount[indexPath.row]
            cell.price_Kitty.text = model.totalSlots[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.tag == 1{
            if indexPath.row == 0 {
             let storyboard = UIStoryboard(name: "Main", bundle: nil)
             let vc = storyboard.instantiateViewController(withIdentifier: "profileview")
             vc.modalPresentationStyle = .fullScreen
             vc.navigationController?.navigationBar.topItem?.title = " "
             self.navigationController?.pushViewController(vc, animated: true)
                 
             } else if indexPath.row == 1 {
                 let storyboard = UIStoryboard(name: "Main", bundle: nil)
                     let vc = storyboard.instantiateViewController(withIdentifier: "weeklyleaderboard")
                 vc.modalPresentationStyle = .fullScreen
                     vc.navigationController?.navigationBar.topItem?.title = " "
                     self.navigationController?.pushViewController(vc, animated: true)
             
             } else if indexPath.row == 2 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                      let vc = storyboard.instantiateViewController(withIdentifier: "halloffame")
                   vc.modalPresentationStyle = .fullScreen
                      self.navigationController?.pushViewController(vc, animated: true)
                 
             } else if indexPath.row == 3 {
             let storyboard = UIStoryboard(name: "Main", bundle: nil)
                       let vc = storyboard.instantiateViewController(withIdentifier: "balance")
                    vc.modalPresentationStyle = .fullScreen
                       self.navigationController?.pushViewController(vc, animated: true)
                 
             } else if indexPath.row == 4 {
             let storyboard = UIStoryboard(name: "Main", bundle: nil)
                       let vc = storyboard.instantiateViewController(withIdentifier: "rewards")
                    vc.modalPresentationStyle = .fullScreen
                       self.navigationController?.pushViewController(vc, animated: true)
                 
                 
             } else if indexPath.row == 5 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
             let vc = storyboard.instantiateViewController(withIdentifier: "refferal")
             vc.modalPresentationStyle = .fullScreen
             self.navigationController?.pushViewController(vc, animated: true)
                 
             } else if indexPath.row == 6 {
             
             } else if indexPath.row == 7 {
               UserDefaults.standard.removeObject(forKey: "UserHasSubmittedPassword")
               KeychainWrapper.standard.removeAllKeys()
               print("userid:- \(KeychainWrapper.standard.string(forKey: "userID"))")
               let storyboard = UIStoryboard(name: "Main", bundle: nil)
               let vc = storyboard.instantiateViewController(withIdentifier: "view")
               vc.modalPresentationStyle = .fullScreen
               vc.hidesBottomBarWhenPushed = true
               self.navigationController?.pushViewController(vc, animated: true)
             }
        } else if tableView.tag == 2 {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "teamresult") as! TeamResultViewController
        vc.d_ID = model.dateID[indexPath.row]
            vc.API_URL = "https://projectstatus.co.in/Bulls11/api/authentication/my-team"
        self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "teamresult") as! TeamResultViewController
            vc.d_ID = model.dateID[indexPath.row]
            vc.API_URL = "https://projectstatus.co.in/Bulls11/api/authentication/my-weekly-team"
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
