//
//  TeamResultViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 22/07/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftKeychainWrapper

class TeamResultViewController: UIViewController {

    @IBOutlet weak var topConstraints: NSLayoutConstraint!
    @IBOutlet weak var tableView     : UITableView!
    @IBOutlet weak var myusername    : UILabel!
    @IBOutlet weak var mypoints      : UILabel!
    @IBOutlet weak var myentryfee    : UILabel!
    @IBOutlet weak var mycaptain     : UILabel!
    @IBOutlet weak var mystarplayer1 : UILabel!
    @IBOutlet weak var mystarplayer2 : UILabel!
    @IBOutlet weak var mystarplayer3 : UILabel!
    @IBOutlet weak var firstView     : UIView!
    @IBOutlet weak var thirdView     : UIView!
    @IBOutlet weak var middleView    : UIView!
    @IBOutlet weak var rank          : UILabel!
    
    let Api_Key = "BULLS11@2020"
    var d_ID = String()
    var API_URL = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        Get_Details()
        customizeView()
        print("myurl:- \(API_URL)")
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        Get_Details()
    }
    
    fileprivate func customizeView() {
    }
    
    func Get_Details() {
        let header:HTTPHeaders = [
                   "X-API-KEY": "\(self.Api_Key)"
               ]
               
        let parameters = [
            "contest_id" : d_ID
        ]
        
        print("myparams:- \(parameters)")
               AF.request(API_URL, method: .post, parameters: parameters,encoding: JSONEncoding.default, headers: header).authenticate(username: "admin", password: "1234").responseJSON { response in
                   switch response.result {
                   case .success:
                       print(response.result)
                       let myresult = try? JSON(data: response.data!)
                       print(myresult!["data"])
                       let resultArray = myresult!["data"]
                       Result.amount.removeAll()
                       Result.captain.removeAll()
                       Result.starPlayer3.removeAll()
                       Result.starPlayer2.removeAll()
                       Result.starPlayer1.removeAll()
                       Result.user_id.removeAll()
                       Result.amount.removeAll()
                       Result.result.removeAll()
                       Result.team_id.removeAll()
                       Result.rank.removeAll()
                       myPersonalData.captain.removeAll()
                       myPersonalData.myentryfee.removeAll()
                       myPersonalData.mypoints.removeAll()
                       myPersonalData.myuserName.removeAll()
                       myPersonalData.starplay3.removeAll()
                       myPersonalData.starplay2.removeAll()
                       myPersonalData.starplay1.removeAll()
                       myPersonalData.rank.removeAll()
                       myPersonalData.teamid.removeAll()
                       for i in resultArray.arrayValue {
                        let userid = i["user_id"].stringValue
                        Result.user_id.append(userid)
                        let savedid = KeychainWrapper.standard.string(forKey: "userID")
                        if userid == savedid {
                            print("myname:- \(i["user_name"])")
                            let myusername = i["user_name"].stringValue
                            myPersonalData.myuserName.append(myusername)
                            let mypoints = i["result"].stringValue
                            myPersonalData.mypoints.append(mypoints)
                            let mycaptain = i["captain"].stringValue
                            myPersonalData.captain.append(mycaptain)
                            print("cap:-\(myPersonalData.captain)")
                            let mystarplayer1 = i["star_player1"].stringValue
                            myPersonalData.starplay1.append(mystarplayer1)
                            let mystarplayer2 = i["star_player2"].stringValue
                            myPersonalData.starplay2.append(mystarplayer2)
                            let mystarplayer3 = i["star_player3"].stringValue
                            myPersonalData.starplay3.append(mystarplayer3)
                            let myentryfee = i["amount"].stringValue
                            myPersonalData.myentryfee.append(myentryfee)
                            let rank = i["rank"].stringValue
                            myPersonalData.rank.append(rank)
                            let teamId = i["team_id"].stringValue
                            myPersonalData.teamid.append(teamId)
                            
//                            self.topConstraints.constant = 181
//                            self.firstView.isHidden = false
                        } else {
//                            self.firstView.isHidden = true
//                            self.topConstraints.constant = 0
                            let userID = i["team_id"].stringValue
                            Result.team_id.append(userID)
                            let results = i["result"].stringValue
                            Result.result.append(results)
                            let Amount = i["amount"].stringValue
                            Result.amount.append(Amount)
                            let starplayer1 = i["star_player1"].stringValue
                            Result.starPlayer1.append(starplayer1)
                            print("starplayer1:-\(Result.starPlayer1)")
                            let starplayer2 = i["star_player2"].stringValue
                            Result.starPlayer2.append(starplayer2)
                            print("starplayer1:-\(Result.starPlayer2)")
                            let starplayer3 = i["star_player3"].stringValue
                            print("starplayer1:-\(Result.starPlayer3)")
                            Result.starPlayer3.append(starplayer3)
                            let captain = i["captain"].stringValue
                            Result.captain.append(captain)
                            let username = i["user_name"].stringValue
                            Result.userna.append(username)
                            let rank = i["rank"].stringValue
                            Result.rank.append(rank)
                        }
                       }
//
                       print("mywholedata:- \(myPersonalData.myuserName)")
                       self.tableView.reloadData()
                       break
                   case .failure(let eror):
                    let refreshAlert = UIAlertController(title: "Alert", message: "No Contest Found", preferredStyle: .alert)
                    refreshAlert.addAction(UIAlertAction(title: "Try After Some Time", style: .default, handler: nil))
                    self.present(refreshAlert, animated: true, completion: nil)
                       print(eror.errorDescription)
                   }
               }
    }
}

extension TeamResultViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myPersonalData.teamid.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var returnCell: UITableViewCell!
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamresultcell")as! teamresultcell
        if indexPath.section == 0 {
            cell.captain.text   = myPersonalData.captain[indexPath.row]
            cell.starplay1.text = myPersonalData.starplay1[indexPath.row]
            cell.starplay2.text = myPersonalData.starplay2[indexPath.row]
            cell.starplay3.text = myPersonalData.starplay3[indexPath.row]
            cell.points.text    = myPersonalData.mypoints[indexPath.row]
            cell.entryFee.text  = "₹" + myPersonalData.myentryfee[indexPath.row]
            cell.username.text  = myPersonalData.myuserName[indexPath.row]
            cell.rank.text      = "#" + myPersonalData.rank[indexPath.row]
            return cell
        } else {
        cell.captain.text   = Result.captain[indexPath.row]
        cell.starplay1.text = Result.starPlayer1[indexPath.row]
        cell.starplay2.text = Result.starPlayer2[indexPath.row]
        cell.starplay3.text = Result.starPlayer3[indexPath.row]
        cell.points.text    = Result.result[indexPath.row]
        cell.entryFee.text  = "₹" + Result.amount[indexPath.row]
        cell.username.text  = Result.userna[indexPath.row]
        cell.rank.text      = "#" + Result.rank[indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    
}
