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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameLabel.text = "Harrison"
        self.descriptionLabel.text = "안녕하세요."
        self.profileImage.image = UIImage(named : "image1.jpeg")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? EditViewController {
            destination.nameText = self.nameLabel.text
            destination.descriptionText = self.descriptionLabel.text
            destination.profile = self.profileImage.image
            destination.delegate = self
        }
    }
}

extension ViewController: SendDataDelegate{
    func sendData(name: String, description: String, image: UIImage) {
        self.nameLabel.text = name
        self.descriptionLabel.text = description
        self.profileImage.image = image
    }
}

