//
//  UpdateVC.swift
//  InstaClone
//
//  Created by Nurşah on 29.11.2021.
//

import UIKit

class UpdateVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    @IBOutlet weak var uploadBtn: UIButton!
    @IBOutlet weak var aciklama: UITextField!
    @IBOutlet weak var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        // Do any additional setup after loading the view.
        img.isUserInteractionEnabled = true
        let imgTap = UITapGestureRecognizer(target: self, action: #selector(addImg))
        img.addGestureRecognizer(imgTap)
    }
    @objc func addImg(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker,animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        img.image = info[.originalImage] as? UIImage
        uploadBtn.isEnabled = true
        self.dismiss(animated: true, completion: nil)
    }
    @objc func hideKeyboard(){
        view.endEditing(true)
    }

    @IBAction func upload(_ sender: Any) {
        
    }
    
}
