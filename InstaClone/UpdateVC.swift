//
//  UpdateVC.swift
//  InstaClone
//
//  Created by Nurşah on 29.11.2021.
//

import UIKit
import Firebase
import FirebaseStorage

class UpdateVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    @IBOutlet weak var uploadBtn: UIButton!
    @IBOutlet weak var aciklama: UITextField!
    @IBOutlet weak var img: UIImageView!
    let storage = Storage.storage()
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
    func Alert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okBtn = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okBtn)
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func upload(_ sender: Any) {
        
        let storageRef = storage.reference()
        let folderRef = storageRef.child("media")
        let folderDescrpRef = storageRef.child("description")
        
        if let data = img.image?.jpegData(compressionQuality: 0.5) {
            let uuid = UUID().uuidString
            let imgRef = folderRef.child("\(uuid).jpeg")
            imgRef.putData(data, metadata: nil) { metadata, error in
                if error != nil {
                    self.Alert(title: "Error", message: error!.localizedDescription)
                }
                else {
                    imgRef.downloadURL { url, error in
                        if error == nil {
                            let imgUrl = url?.absoluteString
                            // DATABASE (FIRESTORE)
                            
                            
                            let firestoreDb = Firestore.firestore()
                            var firestoreRef : DocumentReference? = nil
                            let firestorePost = ["imgUrl": imgUrl,"postedBy" : Auth.auth().currentUser!.email!, "postComment" : self.aciklama.text!,"date" : FieldValue.serverTimestamp(), "likes" : 0] as [String : Any]
                            firestoreRef = firestoreDb.collection("Posts").addDocument(data: firestorePost, completion: { error in
                                if error != nil {
                                    self.Alert(title: "Error", message: error!.localizedDescription)
                                }
                                else {
                                    self.img.image = UIImage(systemName: "square.and.arrow.up.fill")
                                    self.aciklama.text = ""
                                    self.tabBarController?.selectedIndex = 0
                                }
                            })
                        }
                    }
                }
            }
        }
        

    }
    
}
