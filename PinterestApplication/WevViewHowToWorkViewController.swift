//
//  WevViewHowToWorkViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 17/06/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit
import WebKit
import AVFoundation

class WevViewHowToWorkViewController: UIViewController, WKNavigationDelegate {
    
    var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webview = WKWebView()
        webview.navigationDelegate = self
        view = webview
        let url = URL(string: "")!
        //webview.load(URLRequest(url: "https://tryb4ubuy.in/ML5/mobile_live_ML5_testing.php?enterprise_id=C_52"))
        webview.allowsBackForwardNavigationGestures = true
        // Do any additional setup after loading the view.
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
