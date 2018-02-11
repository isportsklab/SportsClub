//
//  SignupViewController.swift
//  Sports Club
//
//  Created by BIKOYPOGI on 10/2/18.
//  Copyright © 2018 UsteSports. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignupViewController: UIViewController {
    

    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var cancelLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard() 
        // Do any additional setup after loading the view, typically from a nib.
        userPassword.isSecureTextEntry = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(SignupViewController.tapFunction))
        cancelLabel.isUserInteractionEnabled = true
        cancelLabel.addGestureRecognizer(tap)

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func signupAction(_ sender: Any) {
        if userEmail.text == "" {
            self.showAlert(title: "Error", message: "Enter email and password")
        } else {
            Auth.auth().createUser(withEmail: userEmail.text!, password: userPassword.text!) { (user, error) in
                if error == nil {
                    self.cancelLabel.text = "Back to login..."
                    self.showAlert(title: "Success", message: "You have successfully signed up")
                } else {
                    self.showAlert(title: "Error", message: (error?.localizedDescription)!)
                }
            }
        }
    }
    
    @objc func tapFunction(sender:UITapGestureRecognizer) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Login")
        self.present(vc!, animated: true, completion: nil)
    }
    
}


