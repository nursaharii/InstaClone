//
//  ViewController.swift
//  InstaClone
//
//  Created by Nurşah on 29.11.2021.
//

import UIKit

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
    }
    
}

