//
//  ViewController.swift
//  Sports Club
//
//  Created by BIKOYPOGI on 10/2/18.
//  Copyright © 2018 UsteSports. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!

    @IBOutlet weak var signupLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let notMember = NSMutableAttributedString(string: "Not a member yet? ")
        let signupAtt = [ NSAttributedStringKey.foregroundColor: UIColor.blue ]
        let signUp = NSMutableAttributedString(string: "Sign up", attributes: signupAtt)
        notMember.append(signUp)
        signupLabel.attributedText = notMember

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

