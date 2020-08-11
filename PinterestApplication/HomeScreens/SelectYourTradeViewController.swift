//
//  SelectYourTradeViewController.swift
//  
//
//  Created by Mihir Vyas on 18/05/20.
//

import UIKit
import Alamofire
import SwiftyJSON

class SelectYourTradeViewController: UIViewController {
    
    @IBOutlet weak var tableView   : UITableView!
    @IBOutlet weak var selectview  : UIView!
    @IBOutlet weak var createview  : UIView!
    @IBOutlet weak var joinview    : UIView!
    @IBOutlet weak var cont        : UILabel!
    
    var refresher: UIRefreshControl!
    var Date_URL = String()
    let Api_Key = "BULLS11@2020"
    var NextApiUrl = String()
    
    fileprivate func CustomizeViews(){
        selectview.backgroundColor      = .clear
        selectview.layer.cornerRadius   = selectview.frame.size.width/2
        selectview.layer.borderColor    = UIColor.white.cgColor
        selectview.layer.borderWidth    = 1.5
        selectview.clipsToBounds        = true
        
        createview.backgroundColor      = .white
        createview.layer.cornerRadius   = createview.frame.size.width/2
        createview.layer.borderColor    = UIColor.white.cgColor
        createview.layer.borderWidth    = 1.5
        createview.clipsToBounds        = true
        
        joinview.layer.cornerRadius     = joinview.frame.size.width/2
        joinview.layer.borderColor      = UIColor.white.cgColor
        joinview.layer.borderWidth      = 1.5
        joinview.clipsToBounds          = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        Fetch_Data()
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    
    func get_Current_Time() {
        let date = Date()
        let calender = NSCalendar.current
        let components = calender.dateComponents([.hour, .minute], from: date)
        print("mytime:= \(components)")
//        let calendar = Calendar.current
//
//        let hour = calendar.component(.hour, from: date)
//        let minutes = calendar.component(.minute, from: date)
//
//        let mytime: String = "\(hour):\(minutes)"
//        let currentTime: String = "\(2):\(13)"
//        print("hours = \(mytime)")
//        let formatDate = DateFormatter()
//           formatDate.dateFormat = "dd/MM/yyyy HH:mm"
//           let drawDate = formatDate.string(from: mytime)
//           print(drawDate)
//        let difference = Calendar.current.dateComponents([.hour, .minute], from: drawDate, to: currentTime)
//        let formattedString = String(format: "%02ld%02ld", difference.hour!, difference.minute!)
//        print(formattedString)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CustomizeViews()
        get_Current_Time()
        
        //        refresher = UIRefreshControl()
        //
        //        refresher.attributedTitle = NSAttributedString(string: "Pull to refresh")
        //
        //        refresher.addTarget(self, action: #selector(self.Fetch_Data), for: .valueChanged)
        //
        //        self.tableView.addSubview(refresher)
        
        Fetch_Data()
    }
    @objc func Fetch_Data() {
        let header:HTTPHeaders = [
            "X-API-KEY": "\(self.Api_Key)"
        ]
        
        AF.request(self.Date_URL, method: .get, parameters: nil,encoding: JSONEncoding.default, headers: header).authenticate(username: "admin", password: "1234").responseJSON { response in
            switch response.result {
            case .success:
                print(response.result)
                let myresult = try? JSON(data: response.data!)
                print(myresult!["data"])
                let resultArray = myresult!["data"]
                model.date_details.removeAll()
                model.dateID.removeAll()
                model.date.removeAll()
                model.prizeAmount.removeAll()
                model.paidUsers.removeAll()
                model.freeUsers.removeAll()
                model.totalSlots.removeAll()
                model.startingtime.removeAll()
                model.fee4.removeAll()
                model.fee3.removeAll()
                model.fee2.removeAll()
                model.fee1.removeAll()
                model.resultTime.removeAll()
                for i in resultArray.arrayValue {
                    print("y i value:- \(i)")
                    let details = i["small_content"].stringValue
                    model.date_details.append(details)
                    let id = i["d_id"].stringValue
                    print("id:- \(id)")
                    model.dateID.append(id)
                    let date = i["dates"].stringValue
                    model.date.append(date)
                    let prizeAmount = i["prize_amount"].stringValue
                    model.prizeAmount.append(prizeAmount)
                    let paidUsers = i["paid_users"].stringValue
                    model.paidUsers.append(paidUsers)
                    let freeUsers = i["free_users"].stringValue
                    model.freeUsers.append(freeUsers)
                    let totalSlots = i["total_slots"].stringValue
                    model.totalSlots.append(totalSlots)
                    let startContest = i["start_time"].stringValue
                    print("star:- \(startContest)")
                    model.startingtime.append(startContest)
                    let timing = i["result_time"].intValue
                    print("timing:- \(timing)")
                    model.resultTime.append(timing)
                    let fee1 = i["fee1"].stringValue
                    model.fee1.append(fee1)
                    let fee2  = i["fee2"].stringValue
                    model.fee2.append(fee2)
                    let fee3  = i["fee3"].stringValue
                    model.fee3.append(fee3)
                    print("myfee:-\(model.fee3)")
                    let fee4 = i["fee4"].stringValue
                    model.fee4.append(fee4)
                    print("myfee1:-\(model.fee4)")
                }
                self.tableView.reloadData()
                // self.refresher.endRefreshing()
                break
            case .failure(let eror):
                print(eror.errorDescription)
            }
        }
    }
}

extension SelectYourTradeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.date.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tradecell") as! SelectTradeTableViewCell
        cell.DateLabel.text = model.date[indexPath.row]
        cell.DetailLabel.text = model.date_details[indexPath.row]
        print("times:- \(model.resultTime)")
        //cell.apidate = model.resultTime[indexPath.row]
    //    cell.ActualTimer = model.resultTime[indexPath.row]
        //        cell.totalPrize.text = "₹" + model.prizeAmount[indexPath.row]
        //        cell.freeUsers.text = model.freeUsers[indexPath.row]
        //        cell.PaidUsers.text = model.paidUsers[indexPath.row]
        //        cell.totalSlots.text = model.totalSlots[indexPath.row]
       //
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let yourDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let newDateString = dateFormatter.string(from: yourDate)
        print("mytime:- \(newDateString)")
       
//        if newDateString < "09:00" {
            print("look")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "choose") as! ChooseTeamViewController
            vc.ApiURL = self.NextApiUrl
            // vc.myDateID = model.dateID
            model.actualDateID = model.dateID[indexPath.row]
            model.savingFee1 = model.fee1[indexPath.row]
            model.savingFee2 = model.fee2[indexPath.row]
            model.savingFee3 = model.fee3[indexPath.row]
            model.savingFee4 = model.fee4[indexPath.row]
            model.savingPaidUsers1 = model.paidUsers[indexPath.row]
            model.savingFreeUsers = model.freeUsers[indexPath.row]
            model.savingTotalUsers = model.totalSlots[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
//        } else {
//            let refreshAlert = UIAlertController(title: "Alert", message: "You can only play contest before 9 AM", preferredStyle: .alert)
//            refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
//            self.present(refreshAlert, animated: true, completion: nil)
//            print("shutup")
       // }
        
    }
}


