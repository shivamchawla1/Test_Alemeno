//
//  ProfileViewController.swift
//  Test_Alemeno
//
//  Created by Shivam Chawla on 09/10/23.
//

import UIKit

class ProfileViewController: UIViewController {
   
    @IBOutlet weak var userName: UITextField!
    var complexAuthProfileManager : ComplexAuthProfileManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.userName.text = complexAuthProfileManager?.username

        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeUserNameActn(_ sender: Any) {
        complexAuthProfileManager?.updateProfileInformation(newUsername: userName.text!)
        let alertController = UIAlertController(title: "Success", message: "UserName Changed", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default)
        { action in
            print("You've pressed OK Button")
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func logoutActn(_ sender: Any) {
        complexAuthProfileManager?.logout()
        
        let stb = UIStoryboard.init(name: "Main", bundle: nil)
        let welcomeView = stb.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        let nvc = UINavigationController(rootViewController: welcomeView)
        nvc.navigationBar.isHidden = true
        welcomeView.complexAuthProfileManager = complexAuthProfileManager
        self.view.window?.rootViewController = nvc
    }
    
}
