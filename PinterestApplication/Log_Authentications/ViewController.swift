//
//  ViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 11/24/17.
//  Copyright © 2017 Gary Tokman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    
    fileprivate func CustomizeRegisterBtn() {
        registerBtn.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.40).cgColor
        registerBtn.layer.shadowOffset = CGSize(width: 0, height: 3)
        registerBtn.layer.shadowOpacity = 1.0
        registerBtn.layer.shadowRadius = 10.0
        registerBtn.layer.masksToBounds = false
    }
    
    fileprivate func CustomizeLoginBtn() {
        loginBtn.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.40).cgColor
        loginBtn.layer.shadowOffset = CGSize(width: 0, height: 3)
        loginBtn.layer.shadowOpacity = 1.0
        loginBtn.layer.shadowRadius = 10.0
        loginBtn.layer.masksToBounds = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        CustomizeLoginBtn()
        CustomizeRegisterBtn()
        // Do any additional setup after loading the view, typically from a nib.
      
    }
    // MARK: Outlets
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    @IBAction func LoginSegue(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "loginSegue")
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func SignUpSegue(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "signupSegue")
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}

// MARK: - Flow layout delegate

