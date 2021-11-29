//
//  ViewController.swift
//  InstaClone
//
//  Created by Nurşah on 29.11.2021.
//

import UIKit
import Firebase
import SwiftUI

class ViewController: UIViewController {

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var eMail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func SignIn(_ sender: Any) {
        performSegue(withIdentifier: "toFeedVC", sender: nil)
    }
    @IBAction func SignUp(_ sender: Any) {
        if eMail.text != "" && password.text != "" {
            Auth.auth().createUser(withEmail: eMail.text!, password: password.text!) { authdata, error in
                if error != nil{
                    self.Alert(title: "Hata!", message: error!.localizedDescription)
                }
                else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }
        else{
            Alert(title: "Hata!", message: "Kullanıcı adı veya şifrenizi eksik girdiniz.")
        }
        
    }
    func Alert(title: String,message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
}

