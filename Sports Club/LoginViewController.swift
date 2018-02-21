//
//  LoginViewController.swift
//  Sports Club
//
//  Created by BIKOYPOGI on 10/2/18.
//  Copyright © 2018 UsteSports. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {


    @IBOutlet weak var signupLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard() 
        // Do any additional setup after loading the view, typically from a nib.
        userPassword.isSecureTextEntry = true
        if Auth.auth().currentUser != nil {
            signupLabel.attributedText = NSMutableAttributedString(string: "")
        } else {
        let notMember = NSMutableAttributedString(string: "Not a member yet? ")
        let signupAtt = [ NSAttributedStringKey.foregroundColor: UIColor.blue ]
        let signUp = NSMutableAttributedString(string: "Sign up", attributes: signupAtt)
        notMember.append(signUp)
        signupLabel.attributedText = notMember
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.tapFunction))
        signupLabel.isUserInteractionEnabled = true
        signupLabel.addGestureRecognizer(tap)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginAction(_ sender: Any) {
        if userEmail.text == "" {
            self.showAlert(title: "Error", message: "Enter email and password")
        } else {
            Auth.auth().signIn(withEmail: self.userEmail.text!, password: self.userPassword.text!) { (user, error) in
                if error == nil {
                    print("You have successfully logged in")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Profile")
                    self.present(vc!, animated: true, completion: nil)
                } else {
                    self.showAlert(title: "Error", message: (error?.localizedDescription)!)
                }
            }
        }
    }
    
    @objc func tapFunction(sender:UITapGestureRecognizer) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Signup")
        self.present(vc!, animated: true, completion: nil)
    }

}

extension UIViewController
{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

