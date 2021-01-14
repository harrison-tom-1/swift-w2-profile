//
//  LoginViewController.swift
//  KaKaoProfile
//
//  Created by 이준형 on 2021/01/14.
//  Copyright © 2021 이준형. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var kakaoLogo: UIImageView!
    @IBOutlet var inputIdField: UITextField!
    @IBOutlet var inputPwdField: UITextField!
    
    private var ID : String = "harrison"
    private var PWD : String = "0000"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initProfile()
    }
    
    func initProfile () {
        self.kakaoLogo.image = UIImage(named: "Images/KakaoImage")
    }

    @IBAction func pushLoginBtn(_ sender: Any) {
        if ID == inputIdField.text && PWD == inputPwdField.text
        {
            guard let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "MainVC") else { return }
            self.navigationController?.pushViewController(mainVC, animated: true)
        }
        else {
            showToast(vc: self, msg: "다시 입력하세요.", sec: 1.0)
        }
    }
}

