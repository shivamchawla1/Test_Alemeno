//
//  ViewController.swift
//  Test_Alemeno
//
//  Created by Shivam Chawla on 09/10/23.
//

import UIKit


class LoginViewController: UIViewController {

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var userName: UITextField!
    var complexAuthProfileManager : ComplexAuthProfileManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      
    }

    @IBAction func loginActn(_ sender: Any) {
        let status = complexAuthProfileManager?.loginWithUsername(username: userName.text!, password: password.text!) ?? false
        
        if status {
            let vc = storyboard?.instantiateViewController(identifier: "ProfileViewController") as! ProfileViewController
            vc.complexAuthProfileManager = complexAuthProfileManager
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            let alertController = UIAlertController(title: "Alert", message: "UserName or Password Doesn't Match", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default)
            { action in
                print("You've pressed OK Button")
            }
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func registerActn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "RegisterViewController") as! RegisterViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

