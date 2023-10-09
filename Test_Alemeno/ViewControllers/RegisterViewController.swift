//
//  RegisterViewController.swift
//  Test_Alemeno
//
//  Created by Shivam Chawla on 09/10/23.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var userName: UITextField!
    
    var complexAuthProfileManager = ComplexAuthProfileManager(userId: "1", username: "shivam")
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func registerActn(_ sender: Any) {
        let status = complexAuthProfileManager.registerWithUsername(username: userName.text!, password: password.text!)
        
        if status {
            let vc = storyboard?.instantiateViewController(identifier: "ProfileViewController") as! ProfileViewController
            vc.complexAuthProfileManager = complexAuthProfileManager
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    


}
