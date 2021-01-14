//
//  MainViewController.swift
//  KaKaoProfile
//
//  Created by 이준형 on 2021/01/14.
//  Copyright © 2021 이준형. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class MainViewController: UIViewController {
    @IBOutlet var webView: WKWebView!
    
    let url = URL(string: "https://m.daum.net")

    override func viewDidLoad() {
        super.viewDidLoad()
        showToast(vc: self, msg: "로그인되었습니다.", sec: 1.0)
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.title = "뉴스"
        let request = URLRequest(url: url!)
        self.webView.load(request)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
