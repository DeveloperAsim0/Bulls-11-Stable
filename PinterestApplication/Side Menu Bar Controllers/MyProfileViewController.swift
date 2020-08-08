//
//  MyProfileViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 14/05/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit
import SDWebImage
import SwiftKeychainWrapper
import Alamofire
import SwiftyJSON

class MyProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var secondView   : UIView!
    @IBOutlet weak var thirdView    : UIView!
    @IBOutlet weak var shareBtn     : UIButton!
    @IBOutlet weak var bullspointvalue: UILabel!
    @IBOutlet weak var User_name    : UILabel!
    @IBOutlet weak var profilepic   : UIImageView!
    @IBOutlet weak var bullscoinValue: UILabel!
    @IBOutlet weak var phoneNumber   : UILabel!
    @IBOutlet weak var quizContests  : UILabel!
    @IBOutlet weak var quizWins      : UILabel!
    
    let Profile_URL = "http://projectstatus.co.in/Bulls11/api/authentication/user/"
    let Api_Key = "BULLS11@2020"
    let update_url = "https://projectstatus.co.in/Bulls11/api/authentication/user/"
    let cornerRadius: CGFloat = 3.0
    
    fileprivate func CustomizeView() {
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        secondView.layer.shadowColor    = UIColor.lightGray.cgColor
        secondView.layer.shadowOffset   = CGSize(width: 0, height: 1.0)
        secondView.layer.shadowOpacity  = 0.5
        secondView.layer.shadowRadius   = 1.0
       // secondView.layer.cornerRadius = cornerRadius
        secondView.layer.masksToBounds  = false
        shareBtn.layer.cornerRadius     = cornerRadius
        shareBtn.layer.masksToBounds    = true
    }
    
    
    
    func Fetch_Profile() {
        let header:HTTPHeaders = [
            "X-API-KEY": "\(self.Api_Key)"
        ]
        print("userid::-\(KeychainWrapper.standard.string(forKey: "userID")!)")
        print("url::-\(self.Profile_URL + KeychainWrapper.standard.string(forKey: "userID")!)")
        AF.request(self.Profile_URL + KeychainWrapper.standard.string(forKey: "userID")!, method: .get, parameters: nil,encoding: JSONEncoding.default, headers: header).authenticate(username: "admin", password: "1234").responseJSON { response in
                   switch response.result {
                   case .success:
                    print(response.result)
                    let result = try? JSON(data: response.data!)
                    print("myResult:- \(result!.dictionaryValue)")
                    let finalResult = result!.dictionaryValue
                    print("firstname:- \(finalResult["first_name"]!.stringValue)")
                    let fullname = finalResult["first_name"]!.stringValue + finalResult["last_name"]!.stringValue
                    self.User_name.text = fullname
                    let profilepic = finalResult["profile_pic"]?.stringValue
                    self.profilepic.sd_setImage(with: URL(string: profilepic!), placeholderImage: UIImage(named: "user icon"))
                    let bullspoints = finalResult["bull_points"]?.stringValue
                    self.bullspointvalue.text = bullspoints
                    let bullscoins = finalResult["bulls_coin"]?.stringValue
                    self.bullscoinValue.text = bullscoins
                    let phoneNo = finalResult["phone"]?.stringValue
                    self.phoneNumber.text = phoneNo
                    let quiz = finalResult["quiz"]?.stringValue
                    self.quizContests.text = quiz
                    break
                   case .failure:
                    print(response.error.debugDescription)
            }
        }
    }
    
    func Update_Profile() {
            let imgData = profilepic.image!.jpegData(compressionQuality: 0.2)!
            let header:HTTPHeaders = [
                "X-API-KEY": "\(self.Api_Key)"
            ]

            let parameters = [
                "id": KeychainWrapper.standard.string(forKey: "userID")
                ]
            
            AF.upload(multipartFormData: { (multipartFormData) in
                multipartFormData.append(imgData, withName: "profile_pic", fileName: "file.jpg", mimeType: "image/jpg")
                for (key, value) in parameters {
                    multipartFormData.append(value!.data(using: String.Encoding.utf8)!, withName: key)
                    }
            }, to:update_url, method: .post, headers: header).authenticate(username: "admin", password: "1234").responseJSON { (response) in
                switch response.result {
                case .success:
                    print(response.result)
                    let myresult = try? JSON(data: response.data!)
                case .failure(let err):
                    print(err.errorDescription)
                
            }
        }
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        Fetch_Profile()
        self.profilepic.layer.cornerRadius = self.profilepic.frame.size.width/2
//        self.profilepic.sd_setImage(with: URL(string: Login_Model.profile_pic), placeholderImage: UIImage(named: "user icon"))
//        self.User_name.text = KeychainWrapper.standard.string(forKey: "userID")
         CustomizeView()
        self.navigationController?.navigationBar.topItem?.title = ""
        title = "My Profile"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 41/255, blue: 122/255, alpha: 1)

        // Do any additional setup after loading the view.
    }
    
    func captureScreenshot(){
              let layer = UIApplication.shared.keyWindow!.layer
              let scale = UIScreen.main.scale
              // Creates UIImage of same size as view
              UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale);
              layer.render(in: UIGraphicsGetCurrentContext()!)
              let screenshot = UIGraphicsGetImageFromCurrentImageContext()
              UIGraphicsEndImageContext()
              // THIS IS TO SAVE SCREENSHOT TO PHOTOS
              UIImageWriteToSavedPhotosAlbum(screenshot!, nil, nil, nil)
    }
    
    @IBAction func updateProfile(_ sender: Any) {
        Update_Profile()
    }
    
    @IBAction func takeScreenshot(_ sender: Any){
        captureScreenshot()
    }
    
    @IBAction func setProfile(_ sender: Any) {
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.openCamera()
        }))

        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.openGallery()
        }))

        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))

        self.present(alert, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
          guard let pickerImage = info[UIImagePickerController.InfoKey.editedImage,default: UIImagePickerController.InfoKey.editedImage] as? UIImage else {return}
          profilepic.image = pickerImage
          profilepic.contentMode = .scaleToFill
          self.dismiss(animated: true, completion: nil)
      }
      
      func openGallery()
      {
          if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
              let imagePicker = UIImagePickerController()
              imagePicker.delegate = self
              imagePicker.allowsEditing = true
              imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
              self.present(imagePicker, animated: true, completion: nil)
          }
          else
          {
              let alert  = UIAlertController(title: "Warning", message: "You don't have permission to access gallery.", preferredStyle: .alert)
              alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
              self.present(alert, animated: true, completion: nil)
          }
      }

      func openCamera()
      {
          if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
              let imagePicker = UIImagePickerController()
              imagePicker.delegate = self
              imagePicker.sourceType = UIImagePickerController.SourceType.camera
              imagePicker.allowsEditing = false
              self.present(imagePicker, animated: true, completion: nil)
          }
          else
          {
              let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
              alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
              self.present(alert, animated: true, completion: nil)
          }
      }
    
    
    
}
// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
    return input.rawValue
}
