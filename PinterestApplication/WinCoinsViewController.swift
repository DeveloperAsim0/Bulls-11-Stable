//
//  WinCoinsViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 07/08/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage
import SwiftKeychainWrapper

class WinCoinsViewController: UIViewController {
    @IBOutlet weak var collectionV: UICollectionView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var value: UILabel!

    var timer = Timer()
    var quesNumber = ["1", "2", "3", "4", "5", "6"]
    var Quiz_Url = "https://projectstatus.co.in/Bulls11/api/authentication/quick-quiz"
    var Quiz_Result = "https://projectstatus.co.in/Bulls11/api/authentication/quick-quiz-result"
    var Api_Key = "BULLS11@2020"
    var amount = String()
    var counter = 0
    var whichResult = ""
    var one = 1
    
    @objc func scrollToNextCell(){

              //get Collection View Instance
              //get cell size
            
            let cellSize = CGSize(width: self.view.frame.width, height: self.view.frame.height);

              //get current content Offset of the Collection view
              let contentOffset = collectionV.contentOffset;
                self.nextBtn.tag += 1
            print("tag:- \(self.nextBtn.tag)")
              //scroll to next cell
            collectionV.scrollRectToVisible(CGRect(x: contentOffset.x + cellSize.width, y: contentOffset.y, width: cellSize.width, height: cellSize.height), animated: true);
            
          }
        
        func startTimer() {
            print("count:- \(model.winQuiz_id.count)")
            if model.winQuiz_id.count == 6 {
                print("alright")
            } else {
                 Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(scrollToNextCell), userInfo: nil, repeats: true);
            }
           
            self.nextBtn.tag += 1
        }
    
    
    func Fetch_Data() {
        let header:HTTPHeaders = [
            "X-API-KEY": "\(self.Api_Key)"
        ]
        
        AF.request(self.Quiz_Url, method: .get, parameters: nil,encoding: JSONEncoding.default, headers: header).authenticate(username: "admin", password: "1234").responseJSON { response in
            switch response.result {
            case .success:
                print(response.result)
                let myresult = try? JSON(data: response.data!)
                print(myresult!["data"])
                let resultArray = myresult!["data"]
                model.winQuiz_id.removeAll()
                model.wnQuiz_firstOption.removeAll()
                model.winQuiz_secondOption.removeAll()
                model.winQuiz_thirdOption.removeAll()
                model.winQuiz_fourthOption.removeAll()
                model.winQuizRightAns.removeAll()
                model.winQuizChooseAns.removeAll()
                model.winQuizQues.removeAll()
                for i in resultArray.arrayValue {
                    print("y i value:- \(i)")
                    let right = i["right_ans"].stringValue
                    model.winQuizRightAns.append(right)
                    let id = i["quiz_id"].stringValue
                    model.winQuiz_id.append(id)
                    let AOption = i["A"].stringValue
                    model.wnQuiz_firstOption.append(AOption)
                    let BOption = i["B"].stringValue
                    model.winQuiz_secondOption.append(BOption)
                    let myQuestion = i["question"].stringValue
                    model.winQuizQues.append(myQuestion)
                    let COption = i["C"].stringValue
                    model.winQuiz_thirdOption.append(COption)
                    let DOption = i["D"].stringValue
                    model.winQuiz_fourthOption.append(DOption)
                }
                self.collectionV.reloadData()
                break
            case .failure(let eror):
                print(eror.errorDescription)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Fetch_Data()
        self.navigationController?.navigationBar.topItem?.title = ""
        print("well:- \(model.winQuiz_id.count)")
        
        self.value.text = "1/5"
        Timer.scheduledTimer(timeInterval: 7.0, target: self, selector: #selector(self.scrollAutomatically), userInfo: nil, repeats: true)
//        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
//        startTimer()
        // Do any additional setup after loading the view.
    }
    
    @objc func scrollAutomatically(_ timer1: Timer) {
        
        if let coll  = collectionV {
            for cell in coll.visibleCells {
                let indexPath: IndexPath? = coll.indexPath(for: cell)
                if ((indexPath?.row)!  < model.winQuiz_id.count - 1){
                    print("call")
                    self.nextBtn.tag += 1
                    one += 1
                    let indexPath1: IndexPath?
                    indexPath1 = IndexPath.init(row: (indexPath?.row)! + 1, section: (indexPath?.section)!)
                    coll.scrollToItem(at: indexPath1!, at: .right, animated: true)
                    self.value.text = "\(one)/\(model.winQuiz_id.count)"
                }
                else{
                    
//                    print("notcall")
//                    let indexPath1: IndexPath?
//                    indexPath1 = IndexPath.init(row: 0, section: (indexPath?.section)!)
//                    coll.scrollToItem(at: indexPath1!, at: .left, animated: true)
                }
                
            }
        }
        
    }
    
    @objc func timerAction() {
            counter += 1
        }

    func Send_Details(){
        var userid = KeychainWrapper.standard.string(forKey: "userID")
               let header:HTTPHeaders = [
                   "X-API-KEY": "\(self.Api_Key)"
               ]
               
               let parameter = [
                   "user_id": userid ,
                   "result": whichResult,
                   "amount": amount
               ]
               
               print("pararms= \(parameter)")
               AF.request("https://projectstatus.co.in/Bulls11/api/authentication/quick-quiz-result", method: .post, parameters: parameter,encoding: JSONEncoding.default, headers: header).authenticate(username: "admin", password: "1234").responseJSON { response in
                   switch response.result {
                   case .success:
                       print(response.result)
                       let result = try? JSON(data: response.data!)
                       print("myresult:- \(String(describing: result!["data"]))")
                   case .failure:
                       print(response.error?.errorDescription)
                   }
               }
    }
    
    @IBAction func next(_ sender: Any){
        self.nextBtn.tag += 1
        one += 1
        self.value.text = "\(one)/\(model.winQuiz_id.count)"
        let visibleItems: NSArray = self.collectionV.indexPathsForVisibleItems as NSArray
                               let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
                               let nextItem: IndexPath = IndexPath(item: currentItem.item + 1, section: 0)
                            if nextItem.row < model.winQuiz_id.count {
                                   self.collectionV.scrollToItem(at: nextItem, at: .left, animated: true)
                               }
        print("cou:- \(nextBtn.tag)")
        print("mod:- \(model.winQuiz_id.count)")
        let create = nextBtn.tag - 1
        if create == model.winQuiz_id.count{
        Send_Details()
            print("choose:- \(model.choose_Answer)")
            print("right:- \(model.winQuizRightAns)")
        if model.choose_Answer == model.winQuizRightAns {
           print("winner")
           self.whichResult = "pass"
            print("re:- \(self.whichResult)")
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
           let vc = storyboard.instantiateViewController(withIdentifier: "congratulation")
           vc.modalPresentationStyle = .fullScreen
           self.present(vc, animated: true, completion: nil)
        } else {
          self.whichResult = "fail"
           print("re:- \(self.whichResult)")
           print("buhhhhhhh")
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
           let vc = storyboard.instantiateViewController(withIdentifier: "betterluck")
           vc.modalPresentationStyle = .fullScreen
           self.present(vc, animated: true, completion: nil)
        }
    }
    }
}

extension WinCoinsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: view.frame.width, height: 250.0)
        }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.winQuiz_id.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionV.dequeueReusableCell(withReuseIdentifier: "collcell", for: indexPath) as! CollectionViewCell
            cell.first.text = model.wnQuiz_firstOption[indexPath.row]
            cell.second.text = model.winQuiz_secondOption[indexPath.row]
            cell.third.text = model.winQuiz_thirdOption[indexPath.row]
            cell.fourth.text = model.winQuiz_fourthOption[indexPath.row]
            cell.questiion.text = model.winQuizQues[indexPath.row]
            cell.number.text = self.quesNumber[indexPath.row]
            return cell
        }
    }

    extension Array where Element: Hashable {
        func difference1(from other: [Element]) -> [Element] {
            let thisSet = Set(self)
            let otherSet = Set(other)
            return Array(thisSet.symmetricDifference(otherSet))
        }
    }
