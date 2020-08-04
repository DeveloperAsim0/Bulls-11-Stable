//
//  SelectCaptainViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 18/05/20.
//  Copyright © 2020 Mihir Vyas. All rights reserved.
//

import UIKit

class SelectCaptainViewController: UIViewController{

    var savedBatsmanIDS      = [String]()
    var savedBowlerIDS       = [String]()
    var savedWicketKeeperIDS = [String]()
    
    @IBOutlet weak var tabel1       : UITableView!
    @IBOutlet weak var table2       : UITableView!
    @IBOutlet weak var table4       : UITableView!
    
    @IBOutlet weak var captainbtn   : UIButton!
    @IBOutlet weak var starbtn      : UIButton!
    
    @IBOutlet weak var selectview   : UIView!
    @IBOutlet weak var createview   : UIView!
    @IBOutlet weak var joinview     : UIView!
    
    
    fileprivate func CustomizeViews2(){
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
        
        joinview.backgroundColor        = .clear
        joinview.layer.cornerRadius     = joinview.frame.size.width/2
        joinview.layer.borderColor      = UIColor.white.cgColor
        joinview.layer.borderWidth      = 1.5
        joinview.clipsToBounds          = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CustomizeViews2()
    }
    
    @IBAction func next(_ sender: Any) {
//        self.savedBatsmanIDS.append(contentsOf: savedBatsmanTeams.CompanyID)
//        print("savedBatsmanIDS:- \(self.savedBatsmanIDS)")
//        self.savedBowlerIDS.append(contentsOf: savedBowlerTeams.CompanyID)
//        print("savedBowlerIDS:- \(self.savedBowlerIDS)")
//        self.savedWicketKeeperIDS.append(contentsOf: savedWicketKeeperTeams.CompanyID)
//        print("savedwicketIDS:- \(self.savedWicketKeeperIDS)")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "letsplay")
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension SelectCaptainViewController: UITableViewDataSource, UITableViewDelegate, CellSubclassDelegate, CellSubclassDelegate2, CellSubclassDelegate3,CellSubclass, CellSubclass2, CellSubclass3  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         if tableView.tag == 1{
               return savedBatsmanTeams.CompanyName.count
               } else if tableView.tag == 2{
               return savedBowlerTeams.CompanyName.count
               }else if tableView.tag == 4{
               return savedWicketKeeperTeams.CompanyName.count
               }
               return savedBatsmanTeams.CompanyName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          if tableView.tag == 1 {
                let cell = tabel1.dequeueReusableCell(withIdentifier: "batsman") as! SavedBatsmanTableViewCell
            cell.batsmanSaved.text = savedBatsmanTeams.CompanyName[indexPath.row]
            cell.finalBatsmanID = savedBatsmanTeams.CompanyID[indexPath.row]
            self.savedBatsmanIDS.append(cell.finalBatsmanID)
            cell.delegate = self
            cell.starDelegate = self
                return cell
                } else if tableView.tag == 2 {
                       let cell = table2.dequeueReusableCell(withIdentifier: "bowler") as! SavedBowlerTableViewCell
            cell.bowlerSaved.text = savedBowlerTeams.CompanyName[indexPath.row]
            cell.finalBowlerID = savedBowlerTeams.CompanyID[indexPath.row]
            self.savedBowlerIDS.append(cell.finalBowlerID)
            cell.delegate = self
            cell.starDelegate = self
                       return cell
                } else  if tableView.tag == 4 {
                       let cell = table4.dequeueReusableCell(withIdentifier: "wicketkeepar") as! SavedWicketkeeperTableViewCell
            cell.wicketKeeperSaved.text = savedWicketKeeperTeams.CompanyName[indexPath.row]
            cell.finalwicketID = savedBowlerTeams.CompanyID[indexPath.row]
            self.savedWicketKeeperIDS.append(cell.finalwicketID)
            cell.delegate = self
            cell.starDelegate = self
                       return cell
                }
                return UITableViewCell()
    }
    
    func buttonTapped(cell: SavedBatsmanTableViewCell) {
        guard let indexPath = tabel1.indexPath(for: cell) else {
                // Note, this shouldn't happen - how did the user tap on a button that wasn't on screen?
                return
            }

            //  Do whatever you need to do with the indexPath

        print("Button tapped on row \(indexPath.row)")
        if indexPath.row == 0 {
            print("mybts:-\(self.savedBatsmanIDS[0])")
            semiFinalBatsmanModel.Captains.append(contentsOf:self.savedBatsmanIDS[0])
            DisableCaptainButton()
        } else if indexPath.row == 1 {
            print("mybts:-\(self.savedBatsmanIDS[1])")
            semiFinalBatsmanModel.Captains.append(contentsOf:self.savedBatsmanIDS[1])
            DisableCaptainButton()
        }else if indexPath.row == 2 {
            print("mybts:-\(self.savedBatsmanIDS[2])")
            semiFinalBatsmanModel.Captains.append(contentsOf:self.savedBatsmanIDS[2])
            DisableCaptainButton()
        }else if indexPath.row == 3 {
            print("mybts:-\(self.savedBatsmanIDS[3])")
            semiFinalBatsmanModel.Captains.append(contentsOf:self.savedBatsmanIDS[3])
            DisableCaptainButton()
        }else if indexPath.row == 4 {
            print("mybts:-\(self.savedBatsmanIDS[4])")
            semiFinalBatsmanModel.Captains.append(contentsOf:self.savedBatsmanIDS[4])
            DisableCaptainButton()
        }else if indexPath.row == 5 {
            print("mybts:-\(self.savedBatsmanIDS[5])")
            semiFinalBatsmanModel.Captains.append(contentsOf:self.savedBatsmanIDS[5])
            DisableCaptainButton()
        }
        }
    
    func DisableCaptainButton() {
        let cell = tabel1.dequeueReusableCell(withIdentifier: "batsman") as! SavedBatsmanTableViewCell
        cell.captionButton.isSelected = false
    }
    
    func buttonTapped2(cell: SavedBowlerTableViewCell) {
    guard let indexPath = table2.indexPath(for: cell) else {
            // Note, this shouldn't happen - how did the user tap on a button that wasn't on screen?
            return
        }
        //  Do whatever you need to do with the indexPath

    print("Button tapped on row \(indexPath.row)")
    if indexPath.row == 0 {
        print("mybts1:-\(self.savedBowlerIDS[0])")
        semiFinalBatsmanModel.Captains.append(contentsOf:self.savedBowlerIDS[0])
        print("updated:- \(semiFinalBowlerModel.Captains)")
    } else if indexPath.row == 1 {
        print("mybts1:-\(self.savedBowlerIDS[1])")
               semiFinalBatsmanModel.Captains.append(contentsOf:self.savedBowlerIDS[1])
    }else if indexPath.row == 2 {
        print("mybts1:-\(self.savedBowlerIDS[2])")
               semiFinalBatsmanModel.Captains.append(contentsOf:self.savedBowlerIDS[2])
    }else if indexPath.row == 3 {
         print("mybts1:-\(self.savedBowlerIDS[3])")
               semiFinalBatsmanModel.Captains.append(contentsOf:self.savedBowlerIDS[3])
    }
    }
    
    func buttonTapped3(cell: SavedWicketkeeperTableViewCell) {
        guard let indexPath = table4.indexPath(for: cell) else {
            // Note, this shouldn't happen - how did the user tap on a button that wasn't on screen?
            return
        }

        //  Do whatever you need to do with the indexPath

    print("Button tapped on row \(indexPath.row)")
    if indexPath.row == 0 {
        print("mywickete:-\(self.savedWicketKeeperIDS[0])")
        semiFinalBatsmanModel.Captains.append(contentsOf:self.savedWicketKeeperIDS[0])
    }
    }
    
    func starplayer(cell: SavedBatsmanTableViewCell) {
         guard let indexPath = tabel1.indexPath(for: cell) else {
                       // Note, this shouldn't happen - how did the user tap on a button that wasn't on screen?
                       return
                   }
               print("Button tapped on row \(indexPath.row)")
               if indexPath.row == 0 {
                   print("mybts:-\(self.savedBatsmanIDS[0])")
                   semiFinalBatsmanModel.starplayer.append(self.savedBatsmanIDS[0])
               } else if indexPath.row == 1 {
                   print("mybts:-\(self.savedBatsmanIDS[1])")
                   semiFinalBatsmanModel.starplayer.append(self.savedBatsmanIDS[1])
               }else if indexPath.row == 2 {
                   print("mybts:-\(self.savedBatsmanIDS[2])")
                   semiFinalBatsmanModel.starplayer.append(self.savedBatsmanIDS[2])
               }else if indexPath.row == 3 {
                   print("mybts:-\(self.savedBatsmanIDS[3])")
                   semiFinalBatsmanModel.starplayer.append(self.savedBatsmanIDS[3])
               }else if indexPath.row == 4 {
                   print("mybts:-\(self.savedBatsmanIDS[4])")
                   semiFinalBatsmanModel.starplayer.append(self.savedBatsmanIDS[4])
               }else if indexPath.row == 5 {
                   print("mybts:-\(self.savedBatsmanIDS[5])")
                   semiFinalBatsmanModel.starplayer.append(self.savedBatsmanIDS[5])
               }
    }
    
    func starplayer2(cell: SavedBowlerTableViewCell) {
         guard let indexPath = table2.indexPath(for: cell) else {
                   // Note, this shouldn't happen - how did the user tap on a button that wasn't on screen?
                   return
               }
               //  Do whatever you need to do with the indexPath

           print("Button tapped on row \(indexPath.row)")
           if indexPath.row == 0 {
               print("mybts1:-\(self.savedBowlerIDS[0])")
               semiFinalBowlerModel.starplayer.append(self.savedBowlerIDS[0])
               print("updated:- \(semiFinalBowlerModel.Captains)")
           } else if indexPath.row == 1 {
               print("mybts1:-\(self.savedBowlerIDS[1])")
                      semiFinalBowlerModel.starplayer.append(self.savedBowlerIDS[1])
           }else if indexPath.row == 2 {
               print("mybts1:-\(self.savedBowlerIDS[2])")
                      semiFinalBowlerModel.starplayer.append(self.savedBowlerIDS[2])
           }else if indexPath.row == 3 {
                print("mybts1:-\(self.savedBowlerIDS[3])")
                      semiFinalBowlerModel.starplayer.append(self.savedBowlerIDS[3])
           }
    }
    
    func starplayer3(cell: SavedWicketkeeperTableViewCell) {
         guard let indexPath = table4.indexPath(for: cell) else {
                   // Note, this shouldn't happen - how did the user tap on a button that wasn't on screen?
                   return
               }
               //  Do whatever you need to do with the indexPath

           print("Button tapped on row \(indexPath.row)")
           if indexPath.row == 0 {
               print("mywickete:-\(self.savedWicketKeeperIDS[0])")
               semiFinalWicketModel.starplayer.append(self.savedWicketKeeperIDS[0])
           }
    }
    
    }
