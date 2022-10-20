//
//  SignUp.swift
//  Danggen market study
//
//  Created by Yonghun Roh on 2022/10/19.
//


import UIKit
import Firebase

class SignUpViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func sighUpBTN(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let e = error {
                print(e.localizedDescription)
            } else {
                self.performSegue(withIdentifier: "goMain2", sender: self)
            }
        }
    }
        
    
    
    
    }
}
