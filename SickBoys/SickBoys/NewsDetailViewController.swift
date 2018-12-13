//
//  NewsDetailViewController.swift
//  SickBoys
//
//  Created by wrj.s on 2018-12-11.
//  Copyright © 2018 wrj.s. All rights reserved.
//

import UIKit
import Firebase
import WebKit

class NewsDetailViewController: UIViewController {
    

    @IBOutlet weak var webView: WKWebView!
    var webUrl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        webView.load(URLRequest(url: URL(string: webUrl!)!))

        }
}
