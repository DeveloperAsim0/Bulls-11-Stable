//
//  WeeklyPlaysViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 08/08/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit
import Alamofire
import SwiftKeychainWrapper
import SwiftyJSON

class WeeklyPlaysViewController: UIViewController {

        @IBOutlet weak var selectView: UIView!
        @IBOutlet weak var createview: UIView!
        @IBOutlet weak var joinview: UIView!
        @IBOutlet weak var pointsview: UIView!
        @IBOutlet weak var unpaidView: UIView!
        @IBOutlet weak var pointslbl: UILabel!
        @IBOutlet weak var butt : UIButton!
        
        @IBOutlet weak var lbl: UILabel!
        @IBOutlet weak var lbl2: UILabel!
        @IBOutlet weak var lbl3: UILabel!
        
        @IBOutlet weak var blackview: UIButton!
        @IBOutlet weak var pinkview: UIButton!
        
        @IBOutlet weak var firstView: UIView!
        @IBOutlet weak var secondview: UIView!
        @IBOutlet weak var thirdview: UIView!
        
        // for particular buttons not using tableview for sorting the data
        @IBOutlet weak var firstfeeBtn: UIButton!
        @IBOutlet weak var secondfeeBtn: UIButton!
        @IBOutlet weak var thirdfeeBtn: UIButton!
        
        @IBOutlet weak var firstprizeLbl1:UIButton!
        @IBOutlet weak var priceKittylbl1: UILabel!
        @IBOutlet weak var totalprizeLbl1:UIButton!
        
        @IBOutlet weak var firstprizeLbl2:UIButton!
        @IBOutlet weak var priceKittylbl2: UILabel!
        @IBOutlet weak var totalprizeLbl2:UIButton!
        
        @IBOutlet weak var firstprizeLbl3:UIButton!
        @IBOutlet weak var priceKittylbl13: UILabel!
        @IBOutlet weak var totalprizeLbl3:UIButton!
        
        var Api_Key = "BULLS11@2020"
        var teamtype = String()
        var mycoins = Int()
        var saveFees = [String]()
        var savefirstprize = [String]()
        var saveprittykit = [String]()
        var savetotalprize = [String]()
        var updated = [String]()
        var userIDMerge = [String]()
        var specialplayer = [String]()
        var selection = "paid"
        var currency = String()
        var currencyType = "coins"
        var userid = KeychainWrapper.standard.string(forKey: "userID")
        var myURL = String()
        var detailsURL = "http://projectstatus.co.in/Bulls11/api/authentication/user/"
        fileprivate func CustomizeView() {
            pointsview.layer.cornerRadius = 7
            pointsview.layer.borderColor = UIColor(red: 212/255, green: 71/255, blue: 141/255, alpha: 1.0).cgColor
            pointsview.layer.borderWidth = 1.3
            pointsview.clipsToBounds = true
            
            pointsview.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.40).cgColor
            pointsview.layer.shadowOffset = CGSize(width: 0, height: 3)
            pointsview.layer.shadowOpacity = 1.0
            pointsview.layer.shadowRadius = 7.0
            pointsview.layer.masksToBounds = false
            
            butt.layer.cornerRadius = 5
            
            lbl.layer.masksToBounds = true
            lbl.layer.cornerRadius = 10
            
            lbl2.layer.masksToBounds = true
            lbl2.layer.cornerRadius = 10
            
            lbl3.layer.masksToBounds = true
            lbl3.layer.cornerRadius = 10
            
            priceKittylbl1.layer.masksToBounds = true
            priceKittylbl1.layer.cornerRadius = 10
            
            priceKittylbl2.layer.masksToBounds = true
            priceKittylbl2.layer.cornerRadius = 10
            
            priceKittylbl13.layer.masksToBounds = true
            priceKittylbl13.layer.cornerRadius = 10
            
            
            selectView.layer.cornerRadius = selectView.frame.size.width/2
            selectView.layer.borderColor = UIColor.white.cgColor
            selectView.layer.borderWidth = 3
            selectView.clipsToBounds = true
            
            createview.layer.cornerRadius = createview.frame.size.width/2
            createview.layer.borderColor = UIColor.white.cgColor
            createview.layer.borderWidth = 3
            createview.clipsToBounds = true
            
            joinview.layer.cornerRadius = joinview.frame.size.width/2
            joinview.backgroundColor = .white
            joinview.layer.borderWidth = 3
            joinview.clipsToBounds = true
            
            
            firstView.layer.cornerRadius = 5
            firstView.layer.shadowOffset = CGSize(width: 0, height: 3)
            firstView.layer.shadowOpacity = 0.6
            firstView.layer.shadowRadius = 3.0
            firstView.layer.shadowColor = UIColor.lightGray.cgColor
            
            
            secondview.layer.cornerRadius = 5
            secondview.layer.shadowOffset = CGSize(width: 0, height: 3)
            secondview.layer.shadowOpacity = 0.6
            secondview.layer.shadowRadius = 3.0
            secondview.layer.shadowColor = UIColor.lightGray.cgColor
            
            
            thirdview.layer.cornerRadius = 5
            thirdview.layer.shadowOffset = CGSize(width: 0, height: 3)
            thirdview.layer.shadowOpacity = 0.6
            thirdview.layer.shadowRadius = 3.0
            thirdview.layer.shadowColor = UIColor.lightGray.cgColor
            
        }
        
        fileprivate func Method(){
            // for btn
            self.lbl.text = "Fee - ₹" + model.savingFee1
            self.lbl2.text = "Fee - ₹" + model.savingFee2
            self.lbl3.text = "Fee - ₹" + model.savingFee3
            
            // for lbls
            self.priceKittylbl1.text = "Paid User -" + model.savingPaidUsers1
            self.priceKittylbl2.text = "Paid User -" + model.savingPaidUsers1
            self.priceKittylbl13.text = "Paid User -" + model.savingPaidUsers1

            self.totalprizeLbl1.titleLabel?.text = "Total Slots -" + model.savingTotalUsers
            self.totalprizeLbl2.titleLabel?.text = "Total Slots -" + model.savingTotalUsers
            self.totalprizeLbl3.titleLabel?.text = "Total Slots -" + model.savingTotalUsers
            
            self.firstprizeLbl1.titleLabel?.text = "Free User -" + model.savingFreeUsers
            self.firstprizeLbl2.titleLabel?.text = "Free User -" + model.savingFreeUsers
            self.firstprizeLbl3.titleLabel?.text = "Free User -" + model.savingFreeUsers
        }
        
        
        func Send_Details() {
            let header:HTTPHeaders = [
                "X-API-KEY": "\(self.Api_Key)"
            ]
        let parameter = [
            "user_id": userid!,
            "paid_unpaid": selection,
            "amount_type": currencyType,
            "amount": currency,
            "c_id": userIDMerge,
            "captain": finalModel.Captain,
            "sp_player": finalModel.starPlayer,
            "contest_id": model.actualDateID,
            "team_type": teamtype
            ] as [String : Any]
            print("params:- \(parameter)")
            AF.request(self.myURL, method: .post, parameters: parameter,encoding: JSONEncoding.default, headers: header).authenticate(username: "admin", password: "1234").responseJSON { response in
                       switch response.result {
                       case .success:
                        print(response.result)
                        let result = try? JSON(data: response.data!)
                        print("dailyresult:- \(String(describing: result))")
                        break
                       case .failure:
                        print(response.error?.errorDescription)
                }
            }
        }
    
    func Fetch_Profile() {
        let header:HTTPHeaders = [
            "X-API-KEY": "\(self.Api_Key)"
        ]
        print("userid::-\(KeychainWrapper.standard.string(forKey: "userID")!)")
        print("url::-\(self.detailsURL + KeychainWrapper.standard.string(forKey: "userID")!)")
        AF.request(self.detailsURL + KeychainWrapper.standard.string(forKey: "userID")!, method: .get, parameters: nil,encoding: JSONEncoding.default, headers: header).authenticate(username: "admin", password: "1234").responseJSON { response in
                   switch response.result {
                   case .success:
                    print(response.result)
                    let result = try? JSON(data: response.data!)
                    print("myResult:- \(result!.dictionaryValue)")
                    let finalResult = result!.dictionaryValue
                    let bullspoints = finalResult["bull_points"]?.stringValue
                    let bullscoins = finalResult["bulls_coin"]?.intValue
                    self.mycoins = bullscoins!
                    break
                   case .failure:
                    print(response.error.debugDescription)
            }
        }
    }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.unpaidView.isHidden = true
            self.pinkview.isSelected = true
            Method()
            CustomizeView()
            self.userIDMerge = savedBatsmanTeams.CompanyID + savedBowlerTeams.CompanyID + savedWicketKeeperTeams.CompanyID
            print("updated:- \(semiFinalBatsmanModel.Captains)")
             print("totalslotsvalue:- \(model.totalSlots[0])")
            print("allusers:- \(userIDMerge)")
            print("usersid:- \(String(describing: userid))")
            self.myURL = "http://projectstatus.co.in/Bulls11/api/authentication/create-weekly-team"
            // Do any additional setup after loading the view.
        }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(true)
           Fetch_Profile()
           
       }
    
    @IBAction func paid(_ sender: UIButton) {
            if sender.isSelected {
                sender.isSelected = false
                blackview.isSelected = false
            } else {
                sender.isSelected = true
                blackview.isSelected = false
                self.unpaidView.isHidden = true
                self.currencyType = "coins"
            //    self.unpaidView.isHidden = false
                self.firstView.isHidden = false
                self.secondview.isHidden = false
                self.thirdview.isHidden = false
                self.selection = "paid"
            }
        }
        
        @IBAction func unpaid(_ sender: UIButton) {
            if sender.isSelected {
                       sender.isSelected = false
                pinkview.isSelected = false
                   } else {
                sender.isSelected = true
                self.currencyType = "points"
                pinkview.isSelected = false
                self.unpaidView.isHidden = false
                self.firstView.isHidden = true
                self.secondview.isHidden = true
                self.thirdview.isHidden = true
                self.selection = "unpaid"
           }
        }
        
        @IBAction func pointsBtn(_ sender: Any){
            self.currency = self.pointslbl.text!
            print("pointcurrency:-\(self.currency)")
        }
        
        @IBAction func firstBtn(_ sender: Any){
            lbl.backgroundColor = UIColor(red: 212/255, green: 100/255, blue: 141/255, alpha: 1.0)
            lbl2.backgroundColor = UIColor(red: 212/255, green: 71/255, blue: 141/255, alpha: 1.0)
            lbl3.backgroundColor = UIColor(red: 212/255, green: 71/255, blue: 141/255, alpha: 1.0)
            self.currency = model.savingFee1
            self.teamtype = "small"
           // finalModel.currency = Int(self.saveFees[0])!
            print("currenct1-\(self.currency)")
        }
        
        @IBAction func secondBtn(_ sender: Any){
            lbl.backgroundColor = UIColor(red: 212/255, green: 71/255, blue: 141/255, alpha: 1.0)
                   lbl2.backgroundColor = UIColor(red: 212/255, green: 100/255, blue: 141/255, alpha: 1.0)
                   lbl3.backgroundColor = UIColor(red: 212/255, green: 71/255, blue: 141/255, alpha: 1.0)
            self.currency = model.savingFee2
            self.teamtype = "medium"
           // print("modules:- \(self.saveFees[1])")
            //finalModel.currency = Int(self.saveFees[1])!
            print("currenct2-\(self.currency)")
        }
        
        @IBAction func thirdBtn(_ sender: Any){
            lbl.backgroundColor = UIColor(red: 212/255, green: 71/255, blue: 141/255, alpha: 1.0)
                   lbl2.backgroundColor = UIColor(red: 212/255, green: 71/255, blue: 141/255, alpha: 1.0)
                   lbl3.backgroundColor = UIColor(red: 212/255, green: 100/255, blue: 141/255, alpha: 1.0)
            self.currency = model.savingFee3
            self.teamtype = "large"
           // finalModel.currency = Int(self.saveFees[2])!
            print("currenct3-\(self.currency)")
        }
        
        @IBAction func LetsPlay(_ sender: Any) {
            print(self.currency)
            print(mycoins)
            Fetch_Profile()
            var changeInt = Int(self.currency)
            print("curr:- \(changeInt)")
            
            if changeInt! > mycoins {
           
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                          let vc = storyboard.instantiateViewController(withIdentifier: "addcash")
                          vc.modalPresentationStyle = .currentContext
                          self.navigationController!.pushViewController(vc, animated: true)
            } else {
                Send_Details()
                            let alert = UIAlertController(title: "Team Created Successfully", message: "", preferredStyle: UIAlertController.Style.alert)
                           alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action in

                                 let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                                                      let vc = storyboard.instantiateViewController(withIdentifier: "customtab")
                                                                      vc.modalPresentationStyle = .fullScreen
                                                                      self.present(vc, animated: true, completion: nil)
                                                                  }))
                                                                  self.present(alert, animated: true, completion: nil)
                
              
    }
    }

    }
