//
//  HomeViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 13/05/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import SDWebImage
import Alamofire
import SwiftyJSON
import TransitionButton

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var btnview: UIView!
    @IBOutlet weak var collectionV: UICollectionView!
    
    //Home controller outlets:
    @IBOutlet weak var selectview: UIView!
    @IBOutlet weak var createview: UIView!
    @IBOutlet weak var joinview: UIView!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var fourthView: UIView!
    @IBOutlet weak var sidemenuview: UIView!
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var popView: UIView!
    @IBOutlet weak var popfirst: UIView!
    @IBOutlet weak var popseconde: UIView!
    @IBOutlet weak var payfirst: UILabel!
    @IBOutlet weak var getfirst: UILabel!
    @IBOutlet weak var paysecond: UILabel!
    @IBOutlet weak var getsecond: UILabel!
    
    @IBOutlet weak var leadingConstraints: NSLayoutConstraint!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var topConstraints: NSLayoutConstraint!
    
    @IBOutlet weak var firstinheritview: UIView!
    @IBOutlet weak var secondinheritview: UIView!
    @IBOutlet weak var thirdinheritview: UIView!
    @IBOutlet weak var fourthInheritView: UIView!
    
    //Next button outlet:
    @IBOutlet weak var Daily: UIButton!
    @IBOutlet weak var Weekly: UIButton!
    @IBOutlet weak var Quiz: UIButton!
    @IBOutlet weak var winQuiz: UIButton!
    
    //Side Menu outlet:
    @IBOutlet weak var UserName: UILabel!
    
    var sideMenu4 = false
    var popmenu = false
    let Profile_URL = "http://projectstatus.co.in/Bulls11/api/authentication/user/"
    let Api_Key = "BULLS11@2020"
    var namearr = ["My Profile", "Weekly Leaderboard", "Hall of Fame", "My Balance", "My Rewards & Offer", "My Refferals", "Point Systems", "Logout"]
    
    var iconArr = ["myprofile", "my_contest_icon", "hall_of_fame", "mybalance", "myrewardsoffers", "myreferrals", "myinfosettings", "logout"]
    
    var images = [UIImage(named: "banner"),
                  UIImage(named: "ad"),
                  UIImage(named: "download")
    ]
    var quizDetails = "https://projectstatus.co.in/Bulls11/api/authentication/quick-quiz-options"
    
    fileprivate func CustomNavBar(){
        title = "HOME"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 19/255, blue: 126/255, alpha: 1)
    }
    
    func customizeButton() {
    }
    
    fileprivate func CustomizeViews(){
        
        self.profilePic.layer.cornerRadius = self.profilePic.frame.size.width/2
        
        sidemenuview.layer.borderColor = UIColor.darkGray.cgColor
        sidemenuview.layer.borderWidth = 1
        sidemenuview.layer.masksToBounds = true
        
        selectview.layer.cornerRadius = selectview.frame.size.width/2
        selectview.clipsToBounds = true
        
        createview.layer.cornerRadius = createview.frame.size.width/2
        createview.layer.borderColor = UIColor.white.cgColor
        createview.layer.borderWidth = 1.5
        createview.clipsToBounds = true
        
        joinview.layer.cornerRadius = joinview.frame.size.width/2
        joinview.layer.borderColor = UIColor.white.cgColor
        joinview.layer.borderWidth = 1.5
        joinview.clipsToBounds = true
        
        firstView.layer.cornerRadius = 7
        firstView.layer.borderColor = UIColor(red: 212/255, green: 71/255, blue: 141/255, alpha: 1.0).cgColor
        firstView.layer.borderWidth = 1.3
        firstView.clipsToBounds = true
        
        firstView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.40).cgColor
        firstView.layer.shadowOffset = CGSize(width: 0, height: 3)
        firstView.layer.shadowOpacity = 1.0
        firstView.layer.shadowRadius = 7.0
        firstView.layer.masksToBounds = false
        
        popView.layer.cornerRadius = 7
        popView.layer.borderColor = UIColor.darkGray.cgColor
        popView.layer.borderWidth = 1.3
        popView.clipsToBounds = true
        
        popView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.40).cgColor
        popView.layer.shadowOffset = CGSize(width: 0, height: 3)
        popView.layer.shadowOpacity = 1.0
        popView.layer.shadowRadius = 7.0
        popView.layer.masksToBounds = false
        
        popfirst.layer.cornerRadius = 7
        popfirst.layer.borderColor = UIColor(red: 212/255, green: 71/255, blue: 141/255, alpha: 1.0).cgColor
        popfirst.layer.borderWidth = 1.3
        popfirst.clipsToBounds = true
        
        
        popseconde.layer.cornerRadius = 7
        popseconde.layer.borderColor = UIColor(red: 212/255, green: 71/255, blue: 141/255, alpha: 1.0).cgColor
        popseconde.layer.borderWidth = 1.3
        popseconde.clipsToBounds = true
        
        secondView.layer.cornerRadius = 7
        secondView.layer.borderColor = UIColor(red: 212/255, green: 71/255, blue: 141/255, alpha: 1.0).cgColor
        secondView.layer.borderWidth = 1.3
        secondView.clipsToBounds = true
        
        secondView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.40).cgColor
        secondView.layer.shadowOffset = CGSize(width: 0, height: 3)
        secondView.layer.shadowOpacity = 1.0
        secondView.layer.shadowRadius = 7.0
        secondView.layer.masksToBounds = false
        
        fourthView.layer.cornerRadius = 7
        fourthView.layer.borderColor = UIColor(red: 212/255, green: 71/255, blue: 141/255, alpha: 1.0).cgColor
        fourthView.layer.borderWidth = 1.3
        fourthView.clipsToBounds = true
        
        fourthView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.40).cgColor
        fourthView.layer.shadowOffset = CGSize(width: 0, height: 3)
        fourthView.layer.shadowOpacity = 1.0
        fourthView.layer.shadowRadius = 7.0
        fourthView.layer.masksToBounds = false
        
        thirdView.layer.cornerRadius = 7
        thirdView.layer.borderColor = UIColor(red: 212/255, green: 71/255, blue: 141/255, alpha: 1.0).cgColor
        thirdView.layer.borderWidth = 1.3
        thirdView.clipsToBounds = true
        
        thirdView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.40).cgColor
        thirdView.layer.shadowOffset = CGSize(width: 0, height: 3)
        thirdView.layer.shadowOpacity = 1.0
        thirdView.layer.shadowRadius = 7.0
        thirdView.layer.masksToBounds = false
    
    }
    
    fileprivate func setanimation(_ viewtoanimate: UIView) {
        UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            viewtoanimate.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
        }) { (_) in
        UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
                   viewtoanimate.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                   let vc = storyboard.instantiateViewController(withIdentifier: "trade") as! SelectYourTradeViewController
                                   vc.modalPresentationStyle = .fullScreen
                                   vc.Date_URL = "http://projectstatus.co.in/Bulls11/api/authentication/date-list"
                                   vc.NextApiUrl = "http://projectstatus.co.in/Bulls11/api/authentication/choose-player"
                                   finalModel.contest_type = "Daily"
                                   self.navigationController?.pushViewController(vc, animated: true)
           
        }
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
                self.profilePic.sd_setImage(with: URL(string: profilepic!), placeholderImage: UIImage(named: "user icon"))
                break
            case .failure:
                print(response.error.debugDescription)
            }
        }
    }
    
    func SetWin_Details() {
        let header:HTTPHeaders = [
            "X-API-KEY": "\(self.Api_Key)"
        ]
        
        AF.request(quizDetails, method: .get, parameters: nil,encoding: JSONEncoding.default, headers: header).authenticate(username: "admin", password: "1234").responseJSON{ response in
            switch response.result {
            case .success:
                print("ok:-\(response.result)")
                let result = try? JSON(data: response.data!)
                print("details:-  \(String(describing: result))")
                let data = result!["data"]
                QuizOptions.coins.removeAll()
                QuizOptions.id.removeAll()
                for i in data.arrayValue {
                    let coins = i["coins"].stringValue
                    let coinsInt = i["coins"].intValue
                    QuizOptions.Coins2x.append(coinsInt)
                    QuizOptions.coins.append(coins)
                    print("mycoins:= \(QuizOptions.coins)")
                    let id  = i["id"].stringValue
                    QuizOptions.id.append(id)
                }
                let setstring = QuizOptions.Coins2x[0] * 2
                let setstring2 = QuizOptions.Coins2x[1] * 2
                self.payfirst.text = QuizOptions.coins[0]
                self.paysecond.text = QuizOptions.coins[1]
                self.getfirst.text = String(setstring)
                self.getsecond.text = String(setstring2)
                break
            case .failure:
                print(response.error.debugDescription)
            }
        }
    }
    
    func startTimer() {

        let timer =  Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.scrollAutomatically), userInfo: nil, repeats: true)
    }


    @objc func scrollAutomatically(_ timer1: Timer) {

        if let coll  = collectionV {
            for cell in coll.visibleCells {
                let indexPath: IndexPath? = coll.indexPath(for: cell)
                if ((indexPath?.row)! < images.count - 1){
                    let indexPath1: IndexPath?
                    indexPath1 = IndexPath.init(row: (indexPath?.row)! + 1, section: (indexPath?.section)!)

                    coll.scrollToItem(at: indexPath1!, at: .right, animated: true)
                }
                else{
                    let indexPath1: IndexPath?
                    indexPath1 = IndexPath.init(row: 0, section: (indexPath?.section)!)
                    coll.scrollToItem(at: indexPath1!, at: .left, animated: true)
                }

            }
        }
    }
    
    fileprivate func getQuizOptionsDetails() {
//        self.getfirst.text = QuizOptions.coins[0]
//        self.getsecond.text = QuizOptions.coins[1]
    }
    
    
    fileprivate func removeModels() {
       savedBatsmanTeams.CompanyName.removeAll()
       savedBatsmanTeams.CompanyID.removeAll()
       savedBowlerTeams.CompanyID.removeAll()
       savedBowlerTeams.CompanyName.removeAll()
       savedWicketKeeperTeams.CompanyName.removeAll()
       savedWicketKeeperTeams.CompanyID.removeAll()
    }
    
   // func gradientColor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        Fetch_Profile()
         SetWin_Details()
        getQuizOptionsDetails()
        print("myvalue= \(QuizOptions.coins)")
        //self.navigationController?.navigationBar.topItem?.title = "HOME"
        CustomNavBar()
        CustomizeViews()
        removeModels()
       
        // KeychainWrapper.standard.removeObject(forKey: "DateSaved")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title="HOME"
        Fetch_Profile()
//        self.btnview.layer.cornerRadius = 15
//        self.btnview.clipsToBounds = true
        Daily.layer.cornerRadius = 15
        savedBatsmanTeams.CompanyName.removeAll()
        savedBatsmanTeams.CompanyID.removeAll()
        savedBowlerTeams.CompanyID.removeAll()
        savedBowlerTeams.CompanyName.removeAll()
        savedWicketKeeperTeams.CompanyName.removeAll()
        savedWicketKeeperTeams.CompanyID.removeAll()
    }
    
    @IBAction func DailyBtnSegue(_ sender: UIButton) {
        print("sure")
        //self.setanimation(sender)
        
        Daily.transform = CGAffineTransform(scaleX: 0.50, y: 0.50)
        UIView.animate(withDuration: 2.0,
                       delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 6.0,
                       options: .allowUserInteraction,
                       animations: { [weak self] in
                        self?.Daily.transform = .identity
            },
                       completion: nil)
        
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let vc = storyboard.instantiateViewController(withIdentifier: "trade") as! SelectYourTradeViewController
    vc.modalPresentationStyle = .fullScreen
    vc.Date_URL = "http://projectstatus.co.in/Bulls11/api/authentication/date-list"
    vc.NextApiUrl = "http://projectstatus.co.in/Bulls11/api/authentication/choose-player"
    finalModel.contest_type = "Daily"
    self.navigationController?.pushViewController(vc, animated: true)
            
    }
    
    @IBAction func WeeklyBtnSegue(_ sender: Any) {
        Weekly.transform = CGAffineTransform(scaleX: 0.50, y: 0.50)
        UIView.animate(withDuration: 2.0,
                       delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 6.0,
                       options: .allowUserInteraction,
                       animations: { [weak self] in
                        self?.Weekly.transform = .identity
            },
                       completion: nil)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "trade") as! SelectYourTradeViewController
        vc.modalPresentationStyle = .fullScreen
        vc.Date_URL = "http://projectstatus.co.in/Bulls11/api/authentication/weekly-date-list"
        vc.NextApiUrl = "http://projectstatus.co.in/Bulls11/api/authentication/choose-player"
        finalModel.contest_type = "Weekly"
        SaveState.saveController = 1
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func WinQuiz(_ sender: Any){
        winQuiz.transform = CGAffineTransform(scaleX: 0.50, y: 0.50)
        UIView.animate(withDuration: 2.0,
                       delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 6.0,
                       options: .allowUserInteraction,
                       animations: { [weak self] in
                        self?.winQuiz.transform = .identity
            },
                       completion: nil)
        
       if (popmenu) {
            topConstraints.constant = 2000
            UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseIn, animations: {
                self.view.layoutIfNeeded()
                //self.view.backgroundColor = .white
            })
        } else {
            topConstraints.constant = 150
            UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseIn, animations: {
                self.view.layoutIfNeeded()
                self.view.backgroundColor = UIColor(red: 155/255, green: 156/255, blue: 157/255, alpha: 1)
            })
        }
        
        popmenu = !popmenu
    }
    
    @IBAction func QuizBtnSegue(_ sender: Any) {
        Quiz.transform = CGAffineTransform(scaleX: 0.50, y: 0.50)
        UIView.animate(withDuration: 2.0,
                       delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 6.0,
                       options: .allowUserInteraction,
                       animations: { [weak self] in
                        self?.Quiz.transform = .identity
            },
                       completion: nil)
        
        let dateFormatter : DateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                    let date = Date()
                    let dateString = dateFormatter.string(from: date)
                    let interval = date.timeIntervalSince1970
                    print("mydate:- \(dateString)")
                    print("mytime:-\(interval)")
        let savedDate = KeychainWrapper.standard.string(forKey: "DateSaved")
        print("savedDate:- \(String(describing: savedDate))")
                if dateString != savedDate {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "contestVC") as! contestVC
        vc.modalPresentationStyle = .fullScreen
        vc.Quiz_URL = "https://projectstatus.co.in/Bulls11/api/authentication/quiz"
        vc.numb = "quiz"
        vc.resultURL = "http://projectstatus.co.in/Bulls11/api/authentication/quiz_result"
        self.navigationController?.pushViewController(vc, animated: true)
                } else {
                    let refreshAlert = UIAlertController(title: "Alert", message: "You can only play this quiz once a day", preferredStyle: .alert)
                    refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(refreshAlert, animated: true, completion: nil)
            }
    }
    
    @IBAction func openSideMenu(_ sender: Any){
        if (sideMenu4) {
            leadingConstraints.constant = -260
            UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseIn, animations: {
                self.view.layoutIfNeeded()
                //self.view.backgroundColor = .white
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
    
    @IBAction func btn1(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "wincoins") as! WinCoinsViewController
        vc.modalPresentationStyle = .fullScreen
        vc.amount = QuizOptions.coins[0]
       
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btn2(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "wincoins") as! WinCoinsViewController
        vc.modalPresentationStyle = .fullScreen
        vc.amount = QuizOptions.coins[1]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
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
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
            
            
        } else if indexPath.row == 6 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                      let vc = storyboard.instantiateViewController(withIdentifier: "bullspointcalculation")
                      vc.modalPresentationStyle = .fullScreen
                      self.navigationController?.pushViewController(vc, animated: true)
            
        } else if indexPath.row == 7 {
            UserDefaults.standard.removeObject(forKey: "UserHasSubmittedPassword")
            KeychainWrapper.standard.removeAllKeys()
            print("userid:- \(String(describing: KeychainWrapper.standard.string(forKey: "userID")))")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "view")
            vc.modalPresentationStyle = .fullScreen
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionV.dequeueReusableCell(withReuseIdentifier: "page", for: indexPath) as! pageCollectionviewCell
        cell.imagess.image = images[indexPath.row]
        return cell
    }
}

extension UIButton{
    func pulseate () {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.6
        pulse.fromValue = 0.95
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 2
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        layer.add(pulse, forKey: nil)
    }
}
