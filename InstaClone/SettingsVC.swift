//
//  SettingsVC.swift
//  InstaClone
//
//  Created by Nurşah on 29.11.2021.
//

import UIKit
import Firebase


class SettingsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func LogOut(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "toMain", sender: nil)

        } catch  {
            print("Hata!")
        }
     
            }
    
    
  

}
