//
//  WebViewController.swift
//  NewsAPI
//
//  Created by tatsumi kentaro on 2018/08/03.
//  Copyright © 2018年 tatsumi kentaro. All rights reserved.
//

import UIKit
import WebKit
import PKHUD
class WebViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {

    @IBOutlet weak var webview: WKWebView!
    var content:Contents!
    var num: Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        num = 0
        webview.uiDelegate = self
        webview.navigationDelegate = self
        let request = NSURLRequest(url: content.url)
        HUD.show(.progress)
        webview.load(request as URLRequest)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if num == 0{
            print("読み込み完了")
            HUD.flash(.success, delay: 0)
            num = num + 1
        }
    }
}
