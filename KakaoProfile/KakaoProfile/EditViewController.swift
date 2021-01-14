//
//  LoginViewController.swift
//  KaKaoProfile
//
//  Created by 이준형 on 2021/01/12.
//  Copyright © 2021 이준형. All rights reserved.
//
import Foundation
import UIKit

protocol SendDataDelegate: class {
    func sendData(name: String, description: String, image: UIImage)
}

class EditViewController: UIViewController {

    var nameText : String?
    var descriptionText : String?
    var profile : UIImage?
    var delegate: SendDataDelegate?
    
    @IBOutlet weak var selectImageButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initProfile()
    }

    let imagePickerController = UIImagePickerController()
    
    private func initProfile() {
        imagePickerController.delegate = self
        
        self.selectImageButton.layer.cornerRadius = self.selectImageButton.layer.frame.size.width/2

        self.profileImage.image = self.profile
        self.nameTextField.text = self.nameText
        self.descriptionTextField.text = self.descriptionText

        self.profileImage.layer.cornerRadius = profileImage.frame.width/8
        self.profileImage.clipsToBounds = true
        self.profileImage.contentMode = .scaleAspectFill
    }
   
    @IBAction func attachedImage(_ sender: Any) {
        let alert = UIAlertController(title: "어디서 가져올까요?", message: "카메라 기능은 지금 안돼요.", preferredStyle: .actionSheet)
        let library = UIAlertAction(title: "사진앨범", style: .default) { (action) in self.openLibrary()}
        let camera = UIAlertAction(title: "카메라", style: .default) { (action) in self.openCamera() }
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)

        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(cancel)

        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func pressDoneBtn(_ sender: Any) {
        self.delegate?.sendData(name: nameTextField.text!, description: descriptionTextField.text!, image: profileImage.image!)
        self.dismiss(animated: true)
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func openLibrary(){
      imagePickerController.sourceType = .photoLibrary
      present(imagePickerController, animated: false, completion: nil)

    }

    func openCamera(){
        if(UIImagePickerController .isSourceTypeAvailable(.camera)){
            imagePickerController.sourceType = .camera
            present(imagePickerController, animated: false, completion: nil)
        }
        else{
            showToast(vc: self, msg: "카메라 동작 안됨.", sec: 0.5)
        }
    }
}

extension EditViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
          self.dismiss(animated: true, completion: nil)
      }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
             profileImage.image = image
             print(info)
        }
         dismiss(animated: true, completion: nil)
     }
}
