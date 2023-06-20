//
//  StudentDetailsViewController.swift
//  studentForm
//
//  Created by Preeti Kesarwani on 10/1/22.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import Firebase



class StudentDetailsViewController: UIViewController {
    
    

    @IBOutlet var StudentLabel: UILabel!
    
    @IBOutlet var parentLabel: UILabel!
    
    
    @IBOutlet var dobLabel: UILabel!
    
    
    @IBOutlet var phoneLable: UILabel!
    
    @IBOutlet var addressLabel: UILabel!
    
    @IBOutlet var mailLabel: UILabel!
    
    
    var studentName : String?
    var parentName : String?
    
    var dob : String?
    var phoneNo : String?
    var add : String?
    var emailId : String?
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        StudentLabel.text = studentName
        parentLabel.text = parentName
        dobLabel.text = dob
        phoneLable.text = phoneNo
        addressLabel.text = add
        mailLabel.text = emailId
        
        navigationItem.hidesBackButton = true
    }
    

    
    @IBAction func LogOut(_ sender: UIBarButtonItem) {
        
        
        let firebaseAuth = Auth.auth()
    do {
      try firebaseAuth.signOut()
        navigationController?.popViewController(animated: true)
       // performSegue(withIdentifier: "goToDirect", sender: self)
    } catch let signOutError as NSError {
      print("Error signing out: %@", signOutError)
    }
    }
    
    
    @IBAction func downloadButtonPressed(_ sender: UIButton) {
        
        
    }
    
    
    
    
}
