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

class ProfileViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var editProfileLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var numFollowers: UILabel!
    @IBOutlet weak var numFollowing: UILabel!
    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var numWinLoss: UILabel!
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    let jordanImages: [UIImage] = [
        UIImage(imageLiteralResourceName: "Jordan1.jpg"),
        UIImage(imageLiteralResourceName: "Jordan2.jpg"),
        UIImage(imageLiteralResourceName: "Jordan3.jpg"),
        UIImage(imageLiteralResourceName: "Jordan4.jpg"),
        UIImage(imageLiteralResourceName: "Jordan5.jpg"),
        UIImage(imageLiteralResourceName: "Jordan6.jpg"),
        UIImage(imageLiteralResourceName: "Jordan7.jpg"),
        UIImage(imageLiteralResourceName: "Jordan8.jpg"),
        UIImage(imageLiteralResourceName: "Jordan9.jpg"),
        UIImage(imageLiteralResourceName: "Jordan10.jpg")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if Auth.auth().currentUser != nil {
            let user = Auth.auth().currentUser
            fullnameLabel.text = "Michael Jordan"
            numFollowers.text = "100,000"
            numFollowing.text = "20"
            numWinLoss.text = "13-0"
        } else {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "Login")
            self.present(vc!, animated: true, completion: nil)
        }
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ProfileViewController.tapFunction))
        editProfileLabel.isUserInteractionEnabled = true
        editProfileLabel.addGestureRecognizer(tap)

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func tapFunction(sender:UITapGestureRecognizer) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Profile")
        self.present(vc!, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reuseCell", for: indexPath)
        
        cell.contentView.addSubview(UIImageView(image: jordanImages[indexPath.row]))
        
        cell.backgroundColor = UIColor.black
        
        return cell
    }
    
}


