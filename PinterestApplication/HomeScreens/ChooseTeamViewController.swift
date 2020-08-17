//
//  ChooseTeamViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 18/05/20.
//  Copyright © 2020 Mihir Vyas. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ChooseTeamViewController: UIViewController {
    
    @IBOutlet var batsmanImages: [UIImageView]!
    @IBOutlet var bowlerImages: [UIImageView]!
    @IBOutlet var wicketImages: [UIImageView]!
    // @IBOutlet var allrounderImages: [UIImageView]!
    
    @IBOutlet weak var firstcircle      : UIImageView!
    @IBOutlet weak var secondcircle     : UIImageView!
    @IBOutlet weak var thirdcircle      : UIImageView!
    @IBOutlet weak var fourthcircle     : UIImageView!
    @IBOutlet weak var fifthcircle      : UIImageView!
    @IBOutlet weak var sixthcircle      : UIImageView!
    @IBOutlet weak var seventhcircle    : UIImageView!
    @IBOutlet weak var eightcircle      : UIImageView!
    @IBOutlet weak var ninthcircle      : UIImageView!
    @IBOutlet weak var tenthcircle      : UIImageView!
    @IBOutlet weak var eleventhcircle   : UIImageView!
    
    @IBOutlet weak var selectview       : UIView!
    @IBOutlet weak var createview       : UIView!
    @IBOutlet weak var joinview         : UIView!
    
    @IBOutlet weak var playerPointView  : UIView!
    @IBOutlet weak var teamView         : UIView!
    @IBOutlet weak var table1           : UITableView!
    @IBOutlet weak var table2           : UITableView!
    @IBOutlet weak var table3           : UITableView!
    @IBOutlet weak var table4           : UITableView!
    @IBOutlet weak var batsmen          : UIButton!
    @IBOutlet weak var bowler           : UIButton!
    @IBOutlet weak var wicketKeeper     : UIButton!
    @IBOutlet weak var special          : UIButton!
    @IBOutlet weak var more             : UIButton!
    //@IBOutlet weak var selected         : UIButton!
    
    // for saving fees:-
     var Fee1 = String()
     var Fee2 = String()
     var Fee3 = String()
     var Fee4 = String()
    
    var BatsmanNumber = 1
    var BowlerNumber = 1
    var WicketKeeperNumber = 1
    var batsmantag = Int()
    var bowlertag = Int()
    var allroundertag = Int()
    var wicketkeepartag = Int()
    
    var ApiURL = String()
    let Api_Key = "BULLS11@2020"
    var myDateID = String()
    var myimagesNames = [UIImage(named: "wicket_keeper"), UIImage(named: "boll"), UIImage(named: "All-rounder"),UIImage(named: "bate")]
    var mywicket = UIImage(named: "wicket_keeper")
    var mybatsman = UIImage(named: "bate")
    var mybowler = UIImage(named: "boll")
    var myallrounder = UIImage(named: "All-rounder")
    
    fileprivate func circularbutton(){
        firstcircle.layer.cornerRadius  = 12.5
        firstcircle.layer.borderColor   = UIColor.gray.cgColor
        firstcircle.layer.borderWidth   = 0.5
        firstcircle.layer.masksToBounds = true
        
        secondcircle.layer.cornerRadius = 12.5
        secondcircle.layer.borderColor  = UIColor.gray.cgColor
        secondcircle.layer.borderWidth  = 0.5
        secondcircle.layer.masksToBounds = true
        
        thirdcircle.layer.cornerRadius  = 12.5
        thirdcircle.layer.borderColor   = UIColor.gray.cgColor
        thirdcircle.layer.borderWidth   = 0.5
        thirdcircle.layer.masksToBounds = true
        
        fourthcircle.layer.cornerRadius  = 12.5
        fourthcircle.layer.borderColor   = UIColor.gray.cgColor
        fourthcircle.layer.borderWidth   = 0.5
        fourthcircle.layer.masksToBounds = true
        
        fifthcircle.layer.cornerRadius   = 12.5
        fifthcircle.layer.borderColor    = UIColor.gray.cgColor
        fifthcircle.layer.borderWidth    = 0.5
        fifthcircle.layer.masksToBounds  = true
        
        sixthcircle.layer.cornerRadius   = 12.5
        sixthcircle.layer.borderColor    = UIColor.gray.cgColor
        sixthcircle.layer.borderWidth    = 0.5
        sixthcircle.layer.masksToBounds  = true
        
        seventhcircle.layer.cornerRadius  = 12.5
        seventhcircle.layer.borderColor   = UIColor.gray.cgColor
        seventhcircle.layer.borderWidth   = 0.5
        seventhcircle.layer.masksToBounds = true
        
        eightcircle.layer.cornerRadius  = 12.5
        eightcircle.layer.borderColor   = UIColor.gray.cgColor
        eightcircle.layer.borderWidth   = 0.5
        eightcircle.layer.masksToBounds = true
        
        ninthcircle.layer.cornerRadius  = 12.5
        ninthcircle.layer.borderColor   = UIColor.gray.cgColor
        ninthcircle.layer.borderWidth   = 0.5
        ninthcircle.layer.masksToBounds = true
        
        tenthcircle.layer.cornerRadius  = 12.5
        tenthcircle.layer.borderColor   = UIColor.gray.cgColor
        tenthcircle.layer.borderWidth   = 0.5
        tenthcircle.layer.masksToBounds = true
        
        eleventhcircle.layer.cornerRadius  = 12.5
        eleventhcircle.layer.borderColor   = UIColor.gray.cgColor
        eleventhcircle.layer.borderWidth   = 0.5
        eleventhcircle.layer.masksToBounds = true
    }
    
    fileprivate func CustomizeViews2(){
        selectview.backgroundColor    = .clear
        selectview.layer.cornerRadius = selectview.frame.size.width/2
        selectview.layer.borderColor  = UIColor.white.cgColor
        selectview.layer.borderWidth  = 1.5
        selectview.clipsToBounds      = true
        
        createview.backgroundColor    = .white
        createview.layer.cornerRadius = createview.frame.size.width/2
        createview.layer.borderColor  = UIColor.white.cgColor
        createview.layer.borderWidth  = 1.5
        createview.clipsToBounds      = true
        
        joinview.backgroundColor     = .clear
        joinview.layer.cornerRadius  = joinview.frame.size.width/2
        joinview.layer.borderColor   = UIColor.white.cgColor
        joinview.layer.borderWidth   = 1.5
        joinview.clipsToBounds       = true
    }
    
    fileprivate func editButton(){
        
        teamView.layer.cornerRadius  = 8
        teamView.layer.borderColor   = UIColor.gray.cgColor
        teamView.layer.borderWidth   = 0.5
        teamView.layer.masksToBounds = true
        
        playerPointView.layer.cornerRadius  = 8
        playerPointView.layer.borderColor   = UIColor.gray.cgColor
        playerPointView.layer.borderWidth   = 0.5
        playerPointView.layer.masksToBounds = true
        
        special.layer.cornerRadius  = 15
        special.layer.masksToBounds = true
        
        more.layer.cornerRadius = 15
        more.layer.masksToBounds = true
        
        batsmen.layer.masksToBounds = false
        batsmen.layer.cornerRadius  = 12.5
        batsmen.layer.borderColor   = UIColor.gray.cgColor
        batsmen.layer.borderWidth   = 0.5
        batsmen.layer.shadowColor = UIColor.black.cgColor
        batsmen.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        batsmen.layer.shadowOpacity = 0.5
        batsmen.layer.shadowRadius = 1.0
        //batsmen.layer.masksToBounds = true
      
        bowler.layer.masksToBounds = false
        bowler.layer.cornerRadius  = 12.5
        bowler.layer.borderColor   = UIColor.gray.cgColor
        bowler.layer.borderWidth   = 0.5
        bowler.layer.shadowColor = UIColor.black.cgColor
        bowler.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        bowler.layer.shadowOpacity = 0.5
        bowler.layer.shadowRadius = 1.0
        bowler.backgroundColor = .clear
        //        allRounder.layer.cornerRadius  = 12.5
        //        allRounder.layer.borderColor   = UIColor.gray.cgColor
        //        allRounder.layer.borderWidth   = 0.5
        //        allRounder.layer.masksToBounds = true
        
        wicketKeeper.layer.masksToBounds = false
        wicketKeeper.layer.cornerRadius  = 12.5
        wicketKeeper.layer.borderColor   = UIColor.gray.cgColor
        wicketKeeper.layer.borderWidth   = 0.5
        wicketKeeper.layer.shadowColor = UIColor.black.cgColor
        wicketKeeper.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        wicketKeeper.layer.shadowOpacity = 0.5
        wicketKeeper.layer.shadowRadius = 1.0
        wicketKeeper.backgroundColor = .clear
    }
    
    func ShowAlert()  {
        let refreshAlert = UIAlertController(title: "", message: "Please select players to create team", preferredStyle: .alert)
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(refreshAlert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editButton()
        CustomizeViews2()
        circularbutton()
        Fetch_Data()
        ShowAlert()
        savedBatsmanTeams.CompanyID.removeAll()
        savedBowlerTeams.CompanyID.removeAll()
        savedWicketKeeperTeams.CompanyID.removeAll()
        self.table1.estimatedRowHeight = 80
        self.table1.rowHeight = UITableView.automaticDimension
        self.table2.estimatedRowHeight = 80
        self.table2.rowHeight = UITableView.automaticDimension
        self.table3.estimatedRowHeight = 80
        self.table3.rowHeight = UITableView.automaticDimension
        self.table4.estimatedRowHeight = 80
        self.table4.rowHeight = UITableView.automaticDimension
        print("alright")
        seventhcircle.image = nil
        // Do any additional setup after loading the view.
    }
    
    func Fetch_Data() {
        //        self.myactivity.isHidden = false
        //        self.myactivity.startAnimating()
        let header:HTTPHeaders = [
            "X-API-KEY": "\(self.Api_Key)"
        ]
        
        AF.request("http://projectstatus.co.in/Bulls11/api/authentication/list-datewise-compnaies", method: .get, parameters: nil,encoding: JSONEncoding.default, headers: header).authenticate(username: "admin", password: "1234").responseJSON { response in
            switch response.result {
            case .success:
                let myresult = try? JSON(data: response.data!)
                print("level:-\(myresult!["data"])")
                let ResultArray = myresult!["data"]
                model.CoreDiff.removeAll()
                model.NonCoreDiff.removeAll()
                model.TopTenCore.removeAll()
                model.TopNonCore.removeAll()
                model.final_wicket_keeper.removeAll()
                model.final_Bowler.removeAll()
                model.final_Batsman.removeAll()
                model.final_batsman_details.removeAll()
                savedBatsmanTeams.CompanyID.removeAll()
                model.final_bowler_details.removeAll()
                model.final_wicketkeepar_details.removeAll()
                self.BatsmanNumber = 1
                self.BowlerNumber = 1
                self.WicketKeeperNumber = 1
                for i in ResultArray.arrayValue {
                    print("mycoretype:- \(i["core_type"].stringValue)")
                    let set = i["core_type"].stringValue
                    let company = i["c_type"].stringValue
                    let diff = i["diff"].stringValue
                    print("mydif:- \(diff)")
                    if set == "core" && company == "Large"{
                        model.CoreDiff.append(diff)
                        print("mycorediff:- \(model.CoreDiff)")
                        let coreteams = i["c_name"].stringValue
                        print("core large:- \(coreteams)")
                        let coreteamsID = i["c_id"].stringValue
                        print("mycores:- \(coreteamsID)")
                        allrounderTeam.Company_ID.append(coreteamsID)
                        allrounderTeam.Company_Name_Batsman_Core.append(coreteams)// 4
                        print("core teams :- \(allrounderTeam.Company_Name_Batsman_Core.prefix(10))")
                        let coreDetails = i["c_detail"].stringValue
                        allrounderTeam.Company_Details_batsman_core.append(coreDetails)
                        
                    } else if set == "Non core" && company == "Large"{
                        model.NonCoreDiff.append(diff)
                        let nonCoreTeams = i["c_name"].stringValue
                        print("noncorebatsman:- \(nonCoreTeams)")
                        allrounderTeam.Company_Name_Batsman_NonCore.append(nonCoreTeams)
                        print("Noncore teams :- \(allrounderTeam.Company_Name_Batsman_NonCore.prefix(8))")
                        let noncoredetails = i["c_detail"].stringValue
                        allrounderTeam.Company_Details_batsman_noncore.append(noncoredetails)
                        print("none:- \(model.NonCoreDiff)")
                        print("bad")
                    }
                    if set == "Non core" && company == "Mid" {
                        print("bowlers:- \(i["c_name"].stringValue)")
                        let compName = i["c_name"].stringValue
                        let compID = i["c_id"].stringValue
                        let compDetails = i["c_detail"].stringValue
                        allrounderTeam.BowlerCompID.append(compID)
                        allrounderTeam.Company_Name_Bowler.append(compName)
                        allrounderTeam.Company_Details_bowler_core.append(compDetails)
                    }
                    
                    if set == "Non core" && company == "Small" {
                        let compName = i["c_name"].stringValue
                        let compID = i["c_id"].stringValue
                        let compDetails = i["c_detail"].stringValue
                        allrounderTeam.wicketkeeperID.append(compID)
                        allrounderTeam.Company_Name_Wicket_Keeper.append(compName)
                        allrounderTeam.Company_Details_wicketkeepar_core.append(compDetails)
                    }
                }
                print("company_Count:- \(allrounderTeam.Company_Name_Batsman_Core.count)")
                
                // for batsman
                if allrounderTeam.Company_Name_Batsman_Core.count >= 10 {
                    print("allbatsman")
                    model.final_Batsman.append(contentsOf: allrounderTeam.Company_Name_Batsman_Core.prefix(10))
                    model.final_Batsman.append(contentsOf: allrounderTeam.Company_Name_Batsman_NonCore.prefix(8))
                    model.final_batsman_details.append(contentsOf: allrounderTeam.Company_Details_batsman_core.prefix(10))
                    model.final_batsman_details.append(contentsOf: allrounderTeam.Company_Details_batsman_noncore.prefix(8))
                   // model.final_batsman_details.append()
                    print("finalCount:- \(model.final_Batsman)")
                    
                } else if allrounderTeam.Company_Name_Batsman_Core.count < 10 {
                    model.final_Batsman.append(contentsOf: allrounderTeam.Company_Name_Batsman_Core)
                    model.final_Batsman.append(contentsOf: allrounderTeam.Company_Name_Batsman_NonCore)
                    model.final_batsman_details.append(contentsOf: allrounderTeam.Company_Details_batsman_core)
                    model.final_batsman_details.append(contentsOf: allrounderTeam.Company_Details_batsman_noncore)
                    print("paagal")
                }
                // for bowlers
                model.final_Bowler.append(contentsOf: allrounderTeam.Company_Name_Bowler.prefix(12))
                model.final_bowler_details.append(contentsOf: allrounderTeam.Company_Details_bowler_core.prefix(12))
                print("bowlers:- \(model.final_Bowler)")
                // for wicket_Keeper
                model.final_wicket_keeper.append(contentsOf: allrounderTeam.Company_Name_Wicket_Keeper.prefix(3))
                model.final_wicketkeepar_details.append(contentsOf: allrounderTeam.Company_Details_wicketkeepar_core.prefix(3))
                print("bowlers:- \(model.final_wicket_keeper)")
                
                self.table1.reloadData()
                self.table2.reloadData()
                self.table4.reloadData()
                break
            case .failure(let eror):
                print(eror.errorDescription)
            }
        }
        
    }
    
    @IBAction func Batsman(_ sender: Any){
        table1.isHidden = false
        table3.isHidden = true
        table4.isHidden = true
        table2.isHidden = true
        self.batsmantag = batsmen.tag
        print("batsmanTag:- \(self.batsmen.tag)")
        self.batsmen.backgroundColor = UIColor(red: 226/255, green: 40/255, blue: 140/255, alpha: 1.0)
        self.bowler.backgroundColor = .clear
        self.wicketKeeper.backgroundColor = .clear
    }
    
    @IBAction func Bowler(_ sender: Any){
        table1.isHidden = true
        table3.isHidden = true
        table4.isHidden = true
        table2.isHidden = false
        self.bowlertag = bowler.tag
        print("mybolertag:- \(self.bowlertag)")
        print("batsmanTag:- \(self.bowler.tag)")
        self.batsmen.backgroundColor = .clear
        self.bowler.backgroundColor = UIColor(red: 226/255, green: 40/255, blue: 140/255, alpha: 1.0)
        self.wicketKeeper.backgroundColor = .clear
    }
    
    func dataClear() {
          if let selectedIndexPaths = table1.indexPathsForSelectedRows {
                      for indexPath in selectedIndexPaths {
                            table1.deselectRow(at: indexPath, animated: true)
                        savedBatsmanTeams.CompanyName.removeAll()
                        savedBatsmanTeams.CompanyID.removeAll()
                        print(savedBatsmanTeams.CompanyID)
                        firstcircle.image = nil
                        secondcircle.image = nil
                        thirdcircle.image = nil
                        fourthcircle.image = nil
                        fifthcircle.image = nil
                        sixthcircle.image = nil
                         self.BatsmanNumber = 1
                         table1.allowsMultipleSelection = true
                         table1.allowsSelection = true
                         table1.reloadData()
                         table1.allowsMultipleSelectionDuringEditing = true
                      }
                 }
        if let selectedIndexPaths = table2.indexPathsForSelectedRows {
             for indexPath in selectedIndexPaths {
                   table2.deselectRow(at: indexPath, animated: true)
               savedBowlerTeams.CompanyName.removeAll()
               savedBowlerTeams.CompanyID.removeAll()
               print(savedBatsmanTeams.CompanyID)
                seventhcircle.image = nil
                eightcircle.image = nil
                ninthcircle.image = nil
                tenthcircle.image = nil
                self.BowlerNumber = 1
               table2.allowsMultipleSelection = true
               table2.allowsSelection = true
               table2.reloadData()
               table2.allowsMultipleSelectionDuringEditing = true
             }
        }
        if let selectedIndexPaths = table4.indexPathsForSelectedRows {
             for indexPath in selectedIndexPaths {
                   table4.deselectRow(at: indexPath, animated: true)
               savedWicketKeeperTeams.CompanyName.removeAll()
               savedWicketKeeperTeams.CompanyID.removeAll()
               print(savedBatsmanTeams.CompanyID)
                eleventhcircle.image = nil
                self.WicketKeeperNumber = 1
              table4.allowsMultipleSelection = true
              table4.allowsSelection = true
              table4.reloadData()
              table4.allowsMultipleSelectionDuringEditing = true
             }
        }
    }
    @IBAction func clearData(_ sender: Any) {
        let refreshAlert = UIAlertController(title: "Alert", message: "Clear Data", preferredStyle: UIAlertController.Style.alert)
                   refreshAlert.addAction(UIAlertAction(title: "Clear", style: .default, handler: { (action: UIAlertAction!) in
                 self.dataClear()
                       print("Handle Ok logic here")
                   }))
        self.present(refreshAlert, animated: true, completion: nil)
    }
    
    @IBAction func AllRounder(_ sender: Any){
        table1.isHidden = true
        table2.isHidden = true
        table4.isHidden = true
        table3.isHidden = false
        // Fetch_Data_All_Rounder()
        //        self.allroundertag = allRounder.tag
        //        print("batsmanTag:- \(self.allRounder.tag)")
        self.batsmen.backgroundColor = .clear
        self.bowler.backgroundColor = .clear
        // self.allRounder.backgroundColor = UIColor(red: 226/255, green: 40/255, blue: 140/255, alpha: 1.0)
        self.wicketKeeper.backgroundColor = .clear
    }  
    
    @IBAction func WicketKeeper(_ sender: Any){
        table4.isHidden = false
        table1.isHidden = true
        table3.isHidden = true
        table2.isHidden = true
        // Fetch_Data_Wicket_Keepar()
        self.wicketkeepartag = wicketKeeper.tag
        print("batsmanTag:- \(self.wicketKeeper.tag)")
        self.batsmen.backgroundColor = .clear
        self.bowler.backgroundColor = .clear
        //  self.allRounder.backgroundColor = .clear
        self.wicketKeeper.backgroundColor = UIColor(red: 226/255, green: 40/255, blue: 140/255, alpha: 1.0)
    }
    
    @IBAction func chooseSpecialPlayer(_ sender: Any){
        if self.sixthcircle.image != nil && tenthcircle.image != nil && eleventhcircle.image != nil {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "specialplay")
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let alert = UIAlertController(title: "Please choose 11 players to create Team", message: "", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func viewSelectedPlayer(_ sender: Any){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "moreplayers")
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ChooseTeamViewController: showStatus{
    func didTapForStatus(Title: String) {
        let showAlert = UIAlertController(title: "Status", message: nil, preferredStyle: .alert)
        let imageView = UIImageView(frame: CGRect(x: 10, y: 50, width: 250, height: 230))
        imageView.image = UIImage(named: "graph") // Your image here...
        showAlert.view.addSubview(imageView)
        let height = NSLayoutConstraint(item: showAlert.view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 320)
        let width = NSLayoutConstraint(item: showAlert.view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250)
        showAlert.view.addConstraint(height)
        showAlert.view.addConstraint(width)
        showAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            // your actions here...
        }))
        self.present(showAlert, animated: true, completion: nil)
    }
}

extension ChooseTeamViewController: showStatus2{
    func didTapForStatus2(Title: String) {
        let showAlert = UIAlertController(title: "Status", message: nil, preferredStyle: .alert)
        let imageView = UIImageView(frame: CGRect(x: 10, y: 50, width: 250, height: 230))
        imageView.image = UIImage(named: "graph") // Your image here...
        showAlert.view.addSubview(imageView)
        let height = NSLayoutConstraint(item: showAlert.view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 320)
        let width = NSLayoutConstraint(item: showAlert.view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250)
        showAlert.view.addConstraint(height)
        showAlert.view.addConstraint(width)
        showAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            // your actions here...
        }))
        self.present(showAlert, animated: true, completion: nil)
    }
}

extension ChooseTeamViewController: showStatus3{
    func didTapForStatus3(Title: String) {
        let showAlert = UIAlertController(title: "Status", message: nil, preferredStyle: .alert)
        let imageView = UIImageView(frame: CGRect(x: 10, y: 50, width: 250, height: 230))
        imageView.image = UIImage(named: "graph") // Your image here...
        showAlert.view.addSubview(imageView)
        let height = NSLayoutConstraint(item: showAlert.view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 320)
        let width = NSLayoutConstraint(item: showAlert.view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250)
        showAlert.view.addConstraint(height)
        showAlert.view.addConstraint(width)
        showAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            // your actions here...
        }))
        self.present(showAlert, animated: true, completion: nil)
        /*let alertTitle = "Watch Later"
         let message = "\(title) added to Watch Later List"
         
         let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
         alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
         present(alert, animated: true, completion: nil)
         */
    }
}

extension ChooseTeamViewController: showStatus4{
    func didTapForStatus4(Title: String) {
        let showAlert = UIAlertController(title: "Demo Alert", message: nil, preferredStyle: .alert)
        let imageView = UIImageView(frame: CGRect(x: 10, y: 50, width: 250, height: 230))
        imageView.image = UIImage(named: "graph") // Your image here...
        showAlert.view.addSubview(imageView)
        let height = NSLayoutConstraint(item: showAlert.view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 320)
        let width = NSLayoutConstraint(item: showAlert.view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250)
        showAlert.view.addConstraint(height)
        showAlert.view.addConstraint(width)
        showAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            // your actions here...
        }))
        self.present(showAlert, animated: true, completion: nil)
        /*let alertTitle = "Watch Later"
         let message = "\(title) added to Watch Later List"
         
         let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
         alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
         present(alert, animated: true, completion: nil)
         */
    }
}

extension ChooseTeamViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView.tag == 1 {
            return UITableView.automaticDimension
        } else if tableView.tag == 2 {
            return UITableView.automaticDimension
        } else if tableView.tag == 3 {
            return UITableView.automaticDimension
        } else if tableView.tag == 4 {
            return UITableView.automaticDimension
        }
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 1{
            return model.final_Batsman.count
        } else if tableView.tag == 2{
            return model.final_Bowler.count
        } else if tableView.tag == 4{
            return model.final_wicket_keeper.count
        }
        return batsmanTeam.Company_ID.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) as? ChooseTeamTableViewCell {
            print(cell.CompanyNameLbl)
            savedBatsmanTeams.CompanyName.append(cell.CompanyNameLbl.text ?? "defaults")
            savedBatsmanTeams.CompanyID.append(cell.userIds)
            print("myids:- \(savedBatsmanTeams.CompanyID)")
            print("mycompany:- \(savedBatsmanTeams.CompanyName)")
            countForBatsman()
        }
        if let cell = tableView.cellForRow(at: indexPath) as? secondTableViewCell {
            print(cell.CompanyNameLbl)
            savedBowlerTeams.CompanyName.append(cell.CompanyNameLbl.text ?? "defaults")
            savedBowlerTeams.CompanyID.append(cell.userIds)
            print("myBowlerids:- \(savedBowlerTeams.CompanyID)")
            countForBowler()
        }
        if let cell = tableView.cellForRow(at: indexPath) as? thirdTableViewCell {
            print(cell.CompanyNameLbl)
            savedAllRounderTeams.CompanyName.append(cell.CompanyNameLbl.text ?? "defaults")
        }
        if let cell = tableView.cellForRow(at: indexPath) as? fourthTableViewCell {
            print(cell.CompanyNameLbl)
            savedWicketKeeperTeams.CompanyName.append(cell.CompanyNameLbl.text ?? "defaults")
            savedWicketKeeperTeams.CompanyID.append(cell.userIds)
            print("myWicketids:- \(savedWicketKeeperTeams.CompanyID)")
            countForWicketKeeper()
        }
    }
    
    func countForBatsman() {
        print("firstnumber:- \(self.BatsmanNumber)")
        if self.BatsmanNumber == 1 {
            print("increse1:- \(self.BatsmanNumber)")
            self.BatsmanNumber += 1
            firstcircle.image = #imageLiteral(resourceName: "bate")
        } else if self.BatsmanNumber == 2 {
            self.BatsmanNumber += 1
            print("increse2:- \(self.BatsmanNumber)")
            secondcircle.image = #imageLiteral(resourceName: "bate")
        } else if self.BatsmanNumber == 3 {
            self.BatsmanNumber += 1
            print("increse3:- \(self.BatsmanNumber)")
            thirdcircle.image = #imageLiteral(resourceName: "bate")
        } else if self.BatsmanNumber == 4 {
            self.BatsmanNumber += 1
            print("increse3:- \(self.BatsmanNumber)")
            fourthcircle.image = #imageLiteral(resourceName: "bate")
        } else if self.BatsmanNumber == 5 {
            self.BatsmanNumber += 1
            print("increse3:- \(self.BatsmanNumber)")
            fifthcircle.image = #imageLiteral(resourceName: "bate")
        } else if self.BatsmanNumber == 6 {
            self.BatsmanNumber += 1
            print("increse3:- \(self.BatsmanNumber)")
            sixthcircle.image = #imageLiteral(resourceName: "bate")
        }
        
        if savedBatsmanTeams.CompanyID.count >= 6 {
            let refreshAlert = UIAlertController(title: "Alert", message: "User only select 6 Batsman", preferredStyle: UIAlertController.Style.alert)
            refreshAlert.addAction(UIAlertAction(title: "Clear", style: .default, handler: { (action: UIAlertAction!) in
                model.final_Batsman.removeAll()
                self.RemoveBatsman()
                savedBatsmanTeams.CompanyID.removeAll()
                savedBatsmanTeams.CompanyName.removeAll()
                self.Fetch_Data()
                self.firstcircle.image = nil
                self.secondcircle.image = nil
                self.thirdcircle.image = nil
                self.fourthcircle.image = nil
                self.fifthcircle.image = nil
                self.sixthcircle.image = nil
                print("Handle Ok logic here")
            }))
            
            refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
                print("Handle Cancel Logic here")
                self.table1.allowsSelection = false
            }))
            
            present(refreshAlert, animated: true, completion: nil)
            // table1.allowsSelection = false
        } else {
            table1.allowsSelection = true
        }
        //                         if sixthcircle.image != nil {
        //                             table1.allowsSelection = false
        //                         } else {
        //                             table1.allowsSelection = true
        //                         }
    }
    
    func countForBowler() {
        print("firstnumber:- \(self.BowlerNumber)")
        if self.BowlerNumber == 1 {
            print("increse1:- \(self.BowlerNumber)")
            self.BowlerNumber += 1
            seventhcircle.image = #imageLiteral(resourceName: "boll")
        } else if self.BowlerNumber == 2 {
            self.BowlerNumber += 1
            print("increse2:- \(self.BowlerNumber)")
            eightcircle.image = #imageLiteral(resourceName: "boll")
        } else if self.BowlerNumber == 3 {
            self.BowlerNumber += 1
            print("increse3:- \(self.BowlerNumber)")
            ninthcircle.image = #imageLiteral(resourceName: "boll")
        } else if self.BowlerNumber == 4 {
            self.BowlerNumber += 1
            print("increse3:- \(self.BowlerNumber)")
            tenthcircle.image = #imageLiteral(resourceName: "boll")
        }
        
        if savedBowlerTeams.CompanyID.count >= 4 {
            let refreshAlert = UIAlertController(title: "Alert", message: "User only select 4 Bowler", preferredStyle: UIAlertController.Style.alert)
            refreshAlert.addAction(UIAlertAction(title: "Clear", style: .default, handler: { (action: UIAlertAction!) in
                model.final_Bowler.removeAll()
                self.RemoveBowler()
                savedBowlerTeams.CompanyID.removeAll()
                savedBowlerTeams.CompanyName.removeAll()
                self.Fetch_Data()
                self.tenthcircle.image = nil
                self.ninthcircle.image = nil
                self.eightcircle.image = nil
                self.seventhcircle.image = nil
                
                print("Handle Ok logic here")
            }))
            
            refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
                print("Handle Cancel Logic here")
                self.table2.allowsSelection = false
            }))
            
            present(refreshAlert, animated: true, completion: nil)
            // table1.allowsSelection = false
        }
    }
    
    func countForWicketKeeper() {
        print("firstnumber:- \(self.WicketKeeperNumber)")
        if self.WicketKeeperNumber == 1 {
            print("increse1:- \(self.WicketKeeperNumber)")
            self.WicketKeeperNumber += 1
            eleventhcircle.image = #imageLiteral(resourceName: "wicket_keeper")
        }
        if savedBowlerTeams.CompanyID.count >= 1 {
            let refreshAlert = UIAlertController(title: "Alert", message: "User only select 1 Wicket-Keeper", preferredStyle: UIAlertController.Style.alert)
            refreshAlert.addAction(UIAlertAction(title: "Clear", style: .default, handler: { (action: UIAlertAction!) in
                model.final_wicket_keeper.removeAll()
                self.RemoveWicketKeeper()
                savedWicketKeeperTeams.CompanyID.removeAll()
                savedWicketKeeperTeams.CompanyName.removeAll()
                 self.Fetch_Data()
                self.eleventhcircle.image = nil
                print("Handle Ok logic here")
            }))
            
            refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
                print("Handle Cancel Logic here")
                self.table4.allowsSelection = false
            }))
            
            present(refreshAlert, animated: true, completion: nil)
            // table1.allowsSelection = false
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? ChooseTeamTableViewCell {
            RemoveBatsman()
        }
        if let cell = tableView.cellForRow(at: indexPath) as? secondTableViewCell {
            RemoveBowler()
        }
        if let cell = tableView.cellForRow(at: indexPath) as? thirdTableViewCell {
            RemoveWicketKeeper()
        }
    }
    
    func RemoveBatsman() {
        if BatsmanNumber == 2 {
            BatsmanNumber -= 1
            self.firstcircle.image = nil
            table1.allowsSelection = true
            savedBatsmanTeams.CompanyID.remove(at: 0)
            print("compnayname: - \(savedBatsmanTeams.CompanyName)")
            savedBatsmanTeams.CompanyName.remove(at: 0)
        } else if BatsmanNumber == 3 {
            BatsmanNumber -= 1
            self.secondcircle.image = nil
            table1.allowsSelection = true
            savedBatsmanTeams.CompanyID.remove(at: 1)
            print("compnayname: - \(savedBatsmanTeams.CompanyName)")
            savedBatsmanTeams.CompanyName.remove(at: 1)
        } else if BatsmanNumber == 4 {
            BatsmanNumber -= 1
            self.thirdcircle.image = nil
            table1.allowsSelection = true
            savedBatsmanTeams.CompanyID.remove(at: 2)
            print("compnayname: - \(savedBatsmanTeams.CompanyName)")
            savedBatsmanTeams.CompanyName.remove(at: 2)
        }  else if BatsmanNumber == 5 {
            BatsmanNumber -= 1
            self.fourthcircle.image = nil
            table1.allowsSelection = true
            savedBatsmanTeams.CompanyID.remove(at: 3)
            print("compnayname: - \(savedBatsmanTeams.CompanyName)")
            savedBatsmanTeams.CompanyName.remove(at: 3)
        } else if BatsmanNumber == 6 {
            BatsmanNumber -= 1
            self.fifthcircle.image = nil
            table1.allowsSelection = true
            savedBatsmanTeams.CompanyID.remove(at: 4)
            print("compnayname: - \(savedBatsmanTeams.CompanyName)")
            savedBatsmanTeams.CompanyName.remove(at: 4)
        } else if BatsmanNumber == 7 {
            BatsmanNumber -= 1
            self.sixthcircle.image = nil
            table1.allowsSelection = true
            savedBatsmanTeams.CompanyID.remove(at: 5)
            print("compnayname: - \(savedBatsmanTeams.CompanyName)")
            savedBatsmanTeams.CompanyName.remove(at: 5)
            
        } else {
            savedBatsmanTeams.CompanyID.removeAll()
            savedBatsmanTeams.CompanyName.removeAll()
            table1.allowsSelection = true
        }
    }
    
    func RemoveBowler() {
        if BowlerNumber == 2 {
            BowlerNumber -= 1
            self.seventhcircle.image = nil
            table2.allowsSelection = true
            savedBowlerTeams.CompanyID.remove(at: 0)
            savedBowlerTeams.CompanyName.remove(at: 0)
        } else if BowlerNumber == 3 {
            BowlerNumber -= 1
            self.eightcircle.image = nil
            table2.allowsSelection = true
            savedBowlerTeams.CompanyID.remove(at: 1)
            savedBowlerTeams.CompanyName.remove(at: 1)
        } else if BowlerNumber == 4 {
            BowlerNumber -= 1
            self.ninthcircle.image = nil
            table2.allowsSelection = true
            savedBowlerTeams.CompanyID.remove(at: 2)
            savedBowlerTeams.CompanyName.remove(at: 2)
        }  else if BowlerNumber == 5 {
            BowlerNumber -= 1
            self.tenthcircle.image = nil
            table2.allowsSelection = true
            savedBowlerTeams.CompanyID.remove(at: 3)
            savedBowlerTeams.CompanyName.remove(at: 3)
        }
    }
    
    func RemoveWicketKeeper() {
        if WicketKeeperNumber == 2 {
            WicketKeeperNumber -= 1
            self.eleventhcircle.image = nil
            table4.allowsSelection = true
            savedWicketKeeperTeams.CompanyID.remove(at: 0)
            savedWicketKeeperTeams.CompanyName.remove(at: 0)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 1 {
            let cell = table1.dequeueReusableCell(withIdentifier: "choose") as! ChooseTeamTableViewCell
            cell.delegate = self as showStatus
            cell.conView.layer.cornerRadius = 5.0
            cell.conView.layer.borderColor = UIColor.gray.cgColor
            cell.conView.layer.borderWidth = 0.5
            cell.CompanyNameLbl.text = model.final_Batsman[indexPath.row]
            cell.userIds = allrounderTeam.Company_ID[indexPath.row]
            cell.CompanyDetailLbl.text = model.final_batsman_details[indexPath.row]
            // cell.CompanyDetailLbl.text = batsmanTeam.Company_Details[indexPath.row]
            return cell
        } else if tableView.tag == 2 {
            let cell = table2.dequeueReusableCell(withIdentifier: "choose2") as! secondTableViewCell
            //              cell.delegate = self as showStatus2
            cell.delegate = self as showStatus2
            cell.conView.layer.cornerRadius = 5.0
            cell.conView.layer.borderColor = UIColor.gray.cgColor
            cell.conView.layer.borderWidth = 0.5
            cell.CompanyNameLbl.text = model.final_Bowler[indexPath.row]
            cell.userIds = allrounderTeam.BowlerCompID[indexPath.row]
            cell.CompanyDetailLbl.text = model.final_bowler_details[indexPath.row]
            //cell.CompanyNameLbl.text = bowlerTeam.Company_Name[indexPath.row]
            // cell.CompanyDetailLbl.text = bowlerTeam.Company_Details[indexPath.row]
            return cell
        } else  if tableView.tag == 3 {
            let cell = table3.dequeueReusableCell(withIdentifier: "choose3") as! thirdTableViewCell
            cell.delegate = self as showStatus3
            cell.conView.layer.cornerRadius = 5.0
            cell.conView.layer.borderColor = UIColor.gray.cgColor
            cell.conView.layer.borderWidth = 0.5
            // cell.CompanyNameLbl.text = allrounderTeam.Company_Name[indexPath.row]
            //  cell.CompanyDetailLbl.text = allrounderTeam.Company_Details[indexPath.row]
            return cell
        } else  if tableView.tag == 4 {
            let cell = table4.dequeueReusableCell(withIdentifier: "choose4") as! fourthTableViewCell
            cell.delegate = self as showStatus4
            cell.conView.layer.cornerRadius = 5.0
            cell.conView.layer.borderColor = UIColor.gray.cgColor
            cell.conView.layer.borderWidth = 0.5
            cell.CompanyNameLbl.text = model.final_wicket_keeper[indexPath.row]
            cell.CompanyDetailLbl.text = model.final_wicketkeepar_details[indexPath.row]
            cell.userIds = allrounderTeam.wicketkeeperID[indexPath.row]
            //               cell.CompanyNameLbl.text = wicketkeeparTeam.Company_Name[indexPath.row]
            //               cell.CompanyDetailLbl.text = wicketkeeparTeam.Company_Details[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
}
