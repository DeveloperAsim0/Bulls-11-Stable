//
//  WevViewLeagalityViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 17/06/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit
import WebKit

class WevViewLeagalityViewController: UIViewController, WKNavigationDelegate {

    var webview: WKWebView!
    var my = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = "Back"
       webview = WKWebView()
        webview.navigationDelegate = self
        view = webview
        let url = URL(string: my)!
        webview.load(URLRequest(url: url))
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






