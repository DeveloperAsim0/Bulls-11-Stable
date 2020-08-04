//
//  MoreViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 13/05/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftKeychainWrapper
import SDWebImage

class MoreViewController: UIViewController {

    @IBOutlet weak var leadingConstraints: NSLayoutConstraint!
    @IBOutlet weak var myprofile: UIImageView!
    @IBOutlet weak var weeklyleaderboard: UIButton!
    @IBOutlet weak var halloffame: UIButton!
    @IBOutlet weak var mybalance: UIButton!
    @IBOutlet weak var myrewards: UIButton!
    @IBOutlet weak var myrefferals: UIButton!
    @IBOutlet weak var myinfo: UIButton!
    @IBOutlet weak var mysideview: UIView!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var UserName: UILabel!
    
    var sideMenu4 = false
    let Profile_URL = "http://projectstatus.co.in/Bulls11/api/authentication/user/"
       let Api_Key = "BULLS11@2020"
    var namearr = ["My Profile", "Weekly Leaderboard", "Hall of Fame", "My Balance", "My Rewards & Offer", "My Refferals", "Point Systems", "Logout"]
    
    var iconArr = ["myprofile", "my_contest_icon", "hall_of_fame", "mybalance", "myrewardsoffers", "myreferrals", "pointsystem", "logout"]
    
    fileprivate func CustomNavBar(){
        title = "MORE"
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
                    self.UserName.text = fullname
                    let profilepic = finalResult["profile_pic"]?.stringValue
                    self.myprofile.sd_setImage(with: URL(string: profilepic!), placeholderImage: UIImage(named: "user icon"))
                    break
                   case .failure:
                    print(response.error.debugDescription)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CustomNavBar()
        Fetch_Profile()
        self.myprofile.layer.cornerRadius = self.myprofile.frame.size.width/2
        mysideview.layer.borderColor = UIColor.darkGray.cgColor
        mysideview.layer.borderWidth = 1
        mysideview.layer.masksToBounds = true
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            self.navigationItem.title="MORE"
        Fetch_Profile()
    }
    
    @IBAction func openSideMenu(_ sender: Any){
        if (sideMenu4) {
            leadingConstraints.constant = -260
            UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseIn, animations: {
                self.view.layoutIfNeeded()
                self.view.backgroundColor = .white
            })
        } else {
            leadingConstraints.constant = 0
            UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseIn, animations: {
                self.view.layoutIfNeeded()
                self.view.backgroundColor = UIColor(red: 155/255, green: 156/255, blue: 157/255, alpha: 1)
            })
        }
        
        sideMenu4 = !sideMenu4
    }
    
    //Main controller Actions
    
    @IBAction func inviteFriend(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "refferal")
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func fantasyPointSystem(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "webleague") as! WevViewLeagalityViewController
        vc.my = "http://projectstatus.co.in/Bulls11/html/fantasypointsystem.html"
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func howtoPlay(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "webleague") as! WevViewLeagalityViewController
        // for how to play
        vc.my = "http://projectstatus.co.in/Bulls11/html/howtoplay.html"
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func helpDesk(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "webleague") as! WevViewLeagalityViewController
        // for helpcentre
        vc.my = "http://projectstatus.co.in/Bulls11/html/helpcenter.html"
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func legality(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "webleague") as! WevViewLeagalityViewController
        // for leaguelity
        vc.my = "http://projectstatus.co.in/Bulls11/html/legality.html"
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func termsConditions(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "bullspointcalculation")
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func howtowork(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
               let vc = storyboard.instantiateViewController(withIdentifier: "webleague") as! WevViewLeagalityViewController
               // for how to work
            vc.my = "http://projectstatus.co.in/Bulls11/html/howtoworks.html"
               vc.modalPresentationStyle = .fullScreen
               self.navigationController?.pushViewController(vc, animated: true)
    }
    

}

extension MoreViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "more") as! sidemenuCell
        cell.name.text = namearr[indexPath.row]
        cell.icon.image = UIImage(named: iconArr[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
    }
}
