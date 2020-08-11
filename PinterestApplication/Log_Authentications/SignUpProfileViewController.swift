//
//  SignUpProfileViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 16/07/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftKeychainWrapper

class SignUpProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var activictyView: UIActivityIndicatorView!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var imageViewRef: UIImageView!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var profileBtn: UIButton!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var lastView: UIView!
    
    let picker = UIImagePickerController()
    let Registration_URL = "https://projectstatus.co.in/Bulls11/api/authentication/registration"
    let Api_Key = "BULLS11@2020"
    var emailString = String()
    var passwordString = String()
    var phoneNumber = String()
    var refferal = "nil"
    
    fileprivate func CustomizeTextField() {
      firstName.attributedPlaceholder = NSAttributedString(string: "  First-Name.", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
      lastName.attributedPlaceholder = NSAttributedString(string: "  Last-Name.", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
              }
    
    fileprivate func CustomizeRegisterBtn() {
        saveBtn.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        saveBtn.layer.shadowOffset = CGSize(width: 0, height: 3)
        saveBtn.layer.shadowOpacity = 1.0
        saveBtn.layer.shadowRadius = 10.0
        saveBtn.layer.masksToBounds = false
        
        imageViewRef.layer.borderWidth = 0.55
        imageViewRef.layer.masksToBounds = false
        imageViewRef.layer.borderColor = UIColor.white.cgColor
        imageViewRef.layer.cornerRadius = imageViewRef.frame.size.width / 2
        imageViewRef.clipsToBounds = true
    }
    
    fileprivate func CustomNavBar(){
     self.navigationController?.navigationBar.tintColor = UIColor.white
        title = "Profile"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 212/255, green: 71/255, blue: 140/255, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CustomizeTextField()
        CustomNavBar()
        CustomizeRegisterBtn()
        // Do any additional setup after loading the view.
    }
    
    func Fetch_Data() {
            self.activictyView.isHidden = false
            self.activictyView.startAnimating()
    //        let image = UIImage.init(named: "1.png")
            let imgData = imageViewRef.image!.jpegData(compressionQuality: 0.2)!
            let header:HTTPHeaders = [
                "X-API-KEY": "\(self.Api_Key)"
            ]

            let parameters = [
                "first_name": firstName.text!,
                "last_name": lastName.text!,
                "email": emailString,
                "password": passwordString,
                "phone": phoneNumber,
                "referal": refferal
                ]
            
            AF.upload(multipartFormData: { (multipartFormData) in
                multipartFormData.append(imgData, withName: "profile_pic", fileName: "file.jpg", mimeType: "image/jpg")
                for (key, value) in parameters {
                    multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
                    }
            }, to:Registration_URL, method: .post, headers: header).authenticate(username: "admin", password: "1234").responseJSON { (response) in
                switch response.result {
                case .success:
                    print(response.result)
                    let myresult = try? JSON(data: response.data!)
                    print("my:- \(String(describing: myresult?["status"]))")
                    if myresult?["status"] == false  {
                        let alert = UIAlertController(title: "Alert", message: "\(myresult!["message"])", preferredStyle: .alert)
                        self.present(alert, animated: true, completion: nil)

                        // change to desired number of seconds (in this case 5 seconds)
                        let when = DispatchTime.now() + 2
                        DispatchQueue.main.asyncAfter(deadline: when){
                          // your code with delay
                          alert.dismiss(animated: true, completion: nil)
                        }
                    } else if myresult?["status"] == true{
                       // UserDefaults.standard.set(true, forKey: "UserHasSubmittedPassword")
                        let Result = myresult!["data"].dictionaryValue
                        print("myresult:- \(Result["id"]?.stringValue)")
                        let userID = Result["id"]!.stringValue
                        let isSaved: Bool = KeychainWrapper.standard.set(userID, forKey: "userID")
                        print("myuser:- \(KeychainWrapper.standard.string(forKey: "userID"))")
                        let emailID = Result["email"]!.stringValue
                        KeychainWrapper.standard.set(emailID, forKey: "email")
                        let referralCode = Result["referal_code"]!.stringValue
                        let isRefferal: Bool = KeychainWrapper.standard.set(referralCode, forKey: "refferalCode")
                        let phone = Result["phone"]!.stringValue
                        KeychainWrapper.standard.set(phone, forKey: "phone")
                        let alert = UIAlertController(title: "Successfully Registered", message: "", preferredStyle: UIAlertController.Style.alert)
                                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action in
                                            
                                            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                            let vc = storyboard.instantiateViewController(withIdentifier: "otpSegue")
                                            self.navigationController?.pushViewController(vc, animated: true)
//
                                        }))
                                        self.present(alert, animated: true, completion: nil)
                                        self.activictyView.stopAnimating()
                                        self.activictyView.isHidden = true
                    }
    //
                case .failure(let err):
                    print(err.errorDescription)
                }
            }
        }
    
    @IBAction func saveDetails(_ sender: Any) {
        if firstName.text == "" && lastName.text == "" {
            firstView.shake()
            lastView.shake()
        } else {
            Fetch_Data()
            print("textField has some text")
        }
    }

    @IBAction func open(_ sender: Any) {
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
        imageViewRef.image = pickerImage
        imageViewRef.contentMode = .scaleToFill
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
