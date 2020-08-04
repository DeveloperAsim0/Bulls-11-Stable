//
//  contestVC.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 10/06/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftKeychainWrapper

class contestVC: UIViewController {
    
    @IBOutlet weak var collectionv: UICollectionView!
    @IBOutlet weak var nextbtn: UIButton!
    @IBOutlet weak var value: UILabel!
    
    var pay = String()
    var numb  = String()
    var mysavedTag = Int()
    var counter = 0
    var timer = Timer()
     var one = 1
    
    var right_Answer = String()
    var Quiz_URL = "http://projectstatus.co.in/Bulls11/api/authentication/quiz"
    let Api_Key = "BULLS11@2020"
    var resultURL = String()
    var resulturl2 = ""
    var quesNumber = ["1", "2", "3", "4", "5", "6"]
    var WhichResult = String()
    var amount = "0"
    override func viewDidLoad() {
        super.viewDidLoad()
        Fetch_Data()
        print("numb:-\(numb)")
        if numb == "win" {
        startTimer()
        } else {
            print("alright")
        }
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
     print("recount:- \(counter)")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
       
    }
    
    @objc func timerAction() {
           counter += 1
       }
    
    func Fetch_Data() {
        let header:HTTPHeaders = [
            "X-API-KEY": "\(self.Api_Key)"
        ]
        
        AF.request(self.Quiz_URL, method: .get, parameters: nil,encoding: JSONEncoding.default, headers: header).authenticate(username: "admin", password: "1234").responseJSON { response in
            switch response.result {
            case .success:
                print(response.result)
                let myresult = try? JSON(data: response.data!)
                print(myresult!["data"])
                let resultArray = myresult!["data"]
                model.id.removeAll()
                model.firstoption.removeAll()
                model.secondoption.removeAll()
                model.ques.removeAll()
                model.thirdoption.removeAll()
                model.fourthoption.removeAll()
                model.rightans.removeAll()
                model.choose_Answer.removeAll()
                for i in resultArray.arrayValue {
                    print("y i value:- \(i)")
                    let right = i["right_ans"].stringValue
                    model.rightans.append(right)
                    let id = i["quiz_id"].stringValue
                    model.id.append(id)
                    let AOption = i["A"].stringValue
                    model.firstoption.append(AOption)
                    let BOption = i["B"].stringValue
                    model.secondoption.append(BOption)
                    let myQuestion = i["question"].stringValue
                    model.ques.append(myQuestion)
                    let COption = i["C"].stringValue
                    model.thirdoption.append(COption)
                    let DOption = i["D"].stringValue
                    model.fourthoption.append(DOption)
                    
                }
                self.collectionv.reloadData()
                break
            case .failure(let eror):
                print(eror.errorDescription)
            }
        }
    }
    
    func getResult() {
        let header:HTTPHeaders = [
            "X-API-KEY": "\(self.Api_Key)"
        ]
        
        let parameter = [
            "user_id": KeychainWrapper.standard.string(forKey: "userID"),
            "result": WhichResult
        ]
        print(parameter)
        AF.request(self.resultURL, method: .post, parameters: parameter,encoding: JSONEncoding.default, headers: header).authenticate(username: "admin", password: "1234").responseJSON { response in
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
    
    func getResult2() {
        var userid = KeychainWrapper.standard.string(forKey: "userID")
        let header:HTTPHeaders = [
            "X-API-KEY": "\(self.Api_Key)"
        ]
        
        let parameter = [
            "user_id": userid ,
            "result": WhichResult,
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
    
    /**
        Scroll to Next Cell
        */
      @objc func scrollToNextCell(){

          //get Collection View Instance
          //get cell size
        
        let cellSize = CGSize(width: self.view.frame.width, height: self.view.frame.height);

          //get current content Offset of the Collection view
          let contentOffset = collectionv.contentOffset;
self.nextbtn.tag += 1
        print("tag:- \(self.nextbtn.tag)")
          //scroll to next cell
        collectionv.scrollRectToVisible(CGRect(x: contentOffset.x + cellSize.width, y: contentOffset.y, width: cellSize.width, height: cellSize.height), animated: true);
        
      }
    
    func startTimer() {
        Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(scrollToNextCell), userInfo: nil, repeats: true);
        self.nextbtn.tag += 1
    }
    
    @IBAction func next(_ sender: Any) {
            self.nextbtn.tag += 1
              one += 1
              model.value = one
        self.value.text = "\(model.value)/\(model.id.count)"
              print("mytag:- \(self.nextbtn.tag)")
             // print("mytag:- \(model.chooseoption)")
              print("mychoose:- \(model.choose_Answer)")
              print("right:- \(model.rightans)")
              let visibleItems: NSArray = self.collectionv.indexPathsForVisibleItems as NSArray
                        let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
                        let nextItem: IndexPath = IndexPath(item: currentItem.item + 1, section: 0)
                     if nextItem.row < model.id.count {
                            self.collectionv.scrollToItem(at: nextItem, at: .left, animated: true)
                        }
        print("mycound:- \(model.id.count)")
        if self.nextbtn.tag == model.id.count {
            print("no more")
            print("right:- \(model.rightans)")
            print("choose:- \(model.choose_Answer)")
//            let names1 = ["John", "Paul", "Ringo"]
//            let names2 = ["Ringo", "Paul", "George"]
            let difference = model.choose_Answer.difference(from: model.rightans)
            print("difference:- \(difference)")
                  if model.choose_Answer == model.rightans {
                     print("winner")
                     self.WhichResult = "pass"
                      print("re:- \(self.WhichResult)")
                     let storyboard = UIStoryboard(name: "Main", bundle: nil)
                     let vc = storyboard.instantiateViewController(withIdentifier: "congratulation")
                     vc.modalPresentationStyle = .fullScreen
                     self.present(vc, animated: true, completion: nil)
                  } else {
                    self.WhichResult = "fail"
                     print("re:- \(self.WhichResult)")
                     print("buhhhhhhh")
                     let storyboard = UIStoryboard(name: "Main", bundle: nil)
                     let vc = storyboard.instantiateViewController(withIdentifier: "betterluck")
                     vc.modalPresentationStyle = .fullScreen
                     self.present(vc, animated: true, completion: nil)
                  }
                  getResult2()
                  getResult()
                  let dateFormatter : DateFormatter = DateFormatter()
                  dateFormatter.dateFormat = "yyyy-MM-dd"
                  let date = Date()
                  let dateString = dateFormatter.string(from: date)
                  let interval = date.timeIntervalSince1970
                  let isTimeSaved: Bool = KeychainWrapper.standard.set(dateString, forKey: "DateSaved")
                  print("mydate:- \(dateString)")
                  print("mytime:-\(interval)")
              } else {
            if model.choose_Answer == model.rightans {
               print("winner")
               self.WhichResult = "pass"
                print("re:- \(self.WhichResult)")
               let storyboard = UIStoryboard(name: "Main", bundle: nil)
               let vc = storyboard.instantiateViewController(withIdentifier: "congratulation")
               vc.modalPresentationStyle = .fullScreen
               self.present(vc, animated: true, completion: nil)
            } else {
              self.WhichResult = "fail"
               print("re:- \(self.WhichResult)")
               print("buhhhhhhh")
               let storyboard = UIStoryboard(name: "Main", bundle: nil)
               let vc = storyboard.instantiateViewController(withIdentifier: "betterluck")
               vc.modalPresentationStyle = .fullScreen
               self.present(vc, animated: true, completion: nil)
            }
            getResult2()
            getResult()
                  print("enjoy")
            
              }
      }
  }

extension contestVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 250.0)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.id.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionv.dequeueReusableCell(withReuseIdentifier: "collcell", for: indexPath) as! CollectionViewCell
        cell.first.text = model.firstoption[indexPath.row]
        cell.second.text = model.secondoption[indexPath.row]
        cell.third.text = model.thirdoption[indexPath.row]
        cell.fourth.text = model.fourthoption[indexPath.row]
        cell.questiion.text = model.ques[indexPath.row]
        cell.number.text = self.quesNumber[indexPath.row]
        return cell
    }
}

extension Array where Element: Hashable {
    func difference(from other: [Element]) -> [Element] {
        let thisSet = Set(self)
        let otherSet = Set(other)
        return Array(thisSet.symmetricDifference(otherSet))
    }
}

/*
 self.nextbtn.tag += 1
       var one = 1
       one += 1
       model.value = one
       self.value.text = "\(model.value)/3"
       print("mytag:- \(self.nextbtn.tag)")
       // print("mytag:- \(model.chooseoption)")
       print("mychoose:- \(model.choose_Answer)")
       print("right:- \(model.rightans)")
       let visibleItems: NSArray = self.collectionv.indexPathsForVisibleItems as NSArray
       let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
       let nextItem: IndexPath = IndexPath(item: currentItem.item + 1, section: 0)
       if nextItem.row < model.id.count {
           self.collectionv.scrollToItem(at: nextItem, at: .left, animated: true)
       }
       if self.nextbtn.tag == 4 {
           print("no more")
           timer.invalidate()
           print("count:- \(counter)")
           if model.choose_Answer == model.rightans {
               print("winner")
               self.WhichResult = "pass"
               print("re:- \(self.WhichResult)")
               let storyboard = UIStoryboard(name: "Main", bundle: nil)
               let vc = storyboard.instantiateViewController(withIdentifier: "congratulation")
               vc.modalPresentationStyle = .fullScreen
               self.present(vc, animated: true, completion: nil)
           } else {
               self.WhichResult = "fail"
               print("re:- \(self.WhichResult)")
               print("buhhhhhhh")
               let storyboard = UIStoryboard(name: "Main", bundle: nil)
               let vc = storyboard.instantiateViewController(withIdentifier: "betterluck")
               vc.modalPresentationStyle = .fullScreen
               self.present(vc, animated: true, completion: nil)
           }
           getResult()
           let dateFormatter : DateFormatter = DateFormatter()
           dateFormatter.dateFormat = "yyyy-MM-dd"
           let date = Date()
           let dateString = dateFormatter.string(from: date)
           let interval = date.timeIntervalSince1970
           let isTimeSaved: Bool = KeychainWrapper.standard.set(dateString, forKey: "DateSaved")
           print("mydate:- \(dateString)")
           print("mytime:-\(interval)")
       } else {
           print("enjoy")
           if model.choose_Answer == model.rightans {
               print("winner")
               self.WhichResult = "pass"
               print("re:- \(self.WhichResult)")
               let storyboard = UIStoryboard(name: "Main", bundle: nil)
               let vc = storyboard.instantiateViewController(withIdentifier: "congratulation")
               vc.modalPresentationStyle = .fullScreen
               self.present(vc, animated: true, completion: nil)
           } else {
               self.WhichResult = "fail"
               print("re:- \(self.WhichResult)")
               print("buhhhhhhh")
               let storyboard = UIStoryboard(name: "Main", bundle: nil)
               let vc = storyboard.instantiateViewController(withIdentifier: "betterluck")
               vc.modalPresentationStyle = .fullScreen
               self.present(vc, animated: true, completion: nil)
           }
           getResult()
       }
       //        if model.choose_Answer == model.rightans {
       //            print("win")
       //            let storyboard = UIStoryboard(name: "Main", bundle: nil)
       //            let vc = storyboard.instantiateViewController(withIdentifier: "congratulation")
       //            vc.modalPresentationStyle = .fullScreen
       //            self.navigationController?.pushViewController(vc, animated: true)
       //        } else {
       //            print("loose")
       //
       //        }
   }
 */
