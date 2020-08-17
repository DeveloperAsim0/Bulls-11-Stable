//
//  MyHallOfFameViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 13/05/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

class MyHallOfFameViewController: UIViewController {
    
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var pic: UIImageView!

    fileprivate func CustomNavBar(){
        title = "Hall of Fame"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 19/255, blue: 126/255, alpha: 1)
        self.pic.layer.cornerRadius = self.pic.bounds.width/2
        self.pic.layer.borderWidth = 1
        self.pic.layer.borderColor = UIColor.white.cgColor
        self.pic.layer.masksToBounds = true
    }
    
    var Api_Key = "BULLS11@2020"
    override func viewDidLoad() {
        super.viewDidLoad()
       Get_Details()
        CustomNavBar()
        self.navigationController?.navigationBar.topItem?.title = ""

        // Do any additional setup after loading the view.
    }
    
    func Get_Details() {
        let header:HTTPHeaders = [
                    "X-API-KEY": "\(self.Api_Key)"
                ]
                
                AF.request("https://projectstatus.co.in/Bulls11/api/authentication/hall-of-fame", method: .get, parameters: nil,encoding: JSONEncoding.default, headers: header).authenticate(username: "admin", password: "1234").responseJSON { response in
                    switch response.result {
                    case .success:
                        print(response.result)
                        let myresult = try? JSON(data: response.data!)
                        print(myresult!["data"].dictionaryValue)
                        let resultArray = myresult!["data"].dictionaryValue
                        print("myi= \(resultArray["user_name"]!.stringValue)")
                            let profile = resultArray["profile_pic"]!.stringValue
                            self.pic.sd_setImage(with: URL(string: profile), placeholderImage: UIImage(named: "user icon"))
                            let username = resultArray["user_name"]!.stringValue
                            self.username.text = username
        //                self.tableView.reloadData()
                        // self.refresher.endRefreshing()
                        break
                    case .failure(let eror):
                        print(eror.errorDescription)
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
