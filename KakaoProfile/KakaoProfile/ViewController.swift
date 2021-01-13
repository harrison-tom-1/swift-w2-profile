//
//  ViewController.swift
//  KaKaoProfile
//
//  Created by 이준형 on 2021/01/11.
//  Copyright © 2021 이준형. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBAction func editButton(_ sender: Any) {
        self.nameLabel.textColor = UIColor.blue
        self.nameLabel.backgroundColor = UIColor.yellow
        self.nameLabel.alpha = 0.5
        self.descriptionLabel.text = "크루미션"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameLabel.text = "Harrison"
        self.descriptionLabel.text = "이준형"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? LoginViewController {
            destination.nameText = self.nameLabel.text
            destination.descriptionText = self.descriptionLabel.text
        }
    }
}

