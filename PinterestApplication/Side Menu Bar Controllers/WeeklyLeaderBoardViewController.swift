//
//  WeeklyLeaderBoardViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 14/05/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class WeeklyLeaderBoardViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    
    var Api_Key = "BULLS11@2020"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = ""
        Get_Details()
         title = "Weekly LeaderBoard"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 212/255, green: 71/255, blue: 140/255, alpha: 1)
        // Do any additional setup after loading the view.
    }
    
    func Get_Details(){
        let header:HTTPHeaders = [
            "X-API-KEY": "\(self.Api_Key)"
        ]
        
        AF.request("https://projectstatus.co.in/Bulls11/api/authentication/leaderboard", method: .get, parameters: nil,encoding: JSONEncoding.default, headers: header).authenticate(username: "admin", password: "1234").responseJSON { response in
            switch response.result {
            case .success:
                print(response.result)
                let myresult = try? JSON(data: response.data!)
                print(myresult!["data"])
                let resultArray = myresult!["data"]
                WeeklyleaderBoard.rank.removeAll()
                WeeklyleaderBoard.profile.removeAll()
                WeeklyleaderBoard.points.removeAll()
                WeeklyleaderBoard.username.removeAll()
                for i in resultArray.arrayValue {
                    print("myi= \(i["rank"].stringValue)")
                    let rank = i["rank"].stringValue
                    WeeklyleaderBoard.rank.append(rank)
                    let points = i["result"].stringValue
                    WeeklyleaderBoard.points.append(points)
                    let profile = i["profile_pic"].stringValue
                    WeeklyleaderBoard.profile.append(profile)
                    let username = i["user_name"].stringValue
                    WeeklyleaderBoard.username.append(username)
                }
                self.table.reloadData()
//                self.tableView.reloadData()
                // self.refresher.endRefreshing()
                break
            case .failure(let eror):
                print(eror.errorDescription)
            }
        }
    }
    
}

extension WeeklyLeaderBoardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WeeklyleaderBoard.username.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "leaderBoardCell") as! leaderBoardCell
        cell.userIcon.sd_setImage(with: URL(string: WeeklyleaderBoard.profile[indexPath.row]), placeholderImage: UIImage(named: "user icon"))
        cell.name.text = WeeklyleaderBoard.username[indexPath.row]
        cell.points.text = WeeklyleaderBoard.points[indexPath.row]
        cell.rank.text = "#" + WeeklyleaderBoard.rank[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
}
