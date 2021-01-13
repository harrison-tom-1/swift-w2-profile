//
//  LoginViewController.swift
//  KaKaoProfile
//
//  Created by 이준형 on 2021/01/12.
//  Copyright © 2021 이준형. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var nameText : String!
    var descriptionText : String!
    @IBOutlet weak var selectImageButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#file, #line, #function, #column)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.selectImageButton.layer.cornerRadius = self.selectImageButton.layer.frame.size.width/2
        profileImage.image = UIImage(named: "image1.jpeg")
        profileImage.layer.cornerRadius = profileImage.frame.width/8
        profileImage.clipsToBounds = true

       print(#file, #line, #function, #column)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(#file, #line, #function, #column)
    }
    override func viewWillDisappear(_ animated: Bool) {
        print(#file, #line, #function, #column)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print(#file, #line, #function, #column)
    }
   
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
}
