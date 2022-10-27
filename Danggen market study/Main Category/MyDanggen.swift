//
//  MyDanggen.swift
//  Danggen market study
//
//  Created by Yonghun Roh on 2022/09/15.
//

import UIKit
import Firebase

class MyDanggenViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logOutPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "GoToHome", sender: self)
        
        let firebaseAuth = Auth.auth()
    do {
      try firebaseAuth.signOut()
    } catch let signOutError as NSError {
      print("Error signing out: %@", signOutError)
    }
    }
    
    
  
    
}
