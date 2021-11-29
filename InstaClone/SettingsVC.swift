//
//  SettingsVC.swift
//  InstaClone
//
//  Created by Nurşah on 29.11.2021.
//

import UIKit



class SettingsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func LogOut(_ sender: Any) {
        performSegue(withIdentifier: "toMain", sender: nil)
    }
    
    
  

}
