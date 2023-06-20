//
//  ResetPasswordViewController.swift
//  studentForm
//
//  Created by Preeti Kesarwani on 9/28/22.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import Firebase



class ResetPasswordViewController: UIViewController {
    
    
    @IBOutlet var emailIdText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        
        let auth = Auth.auth()
        auth.sendPasswordReset(withEmail: emailIdText.text!) { (error) in
            
            if let e = error {
                let alert = UIAlertController(title: "Error", message: "Please enter your Vaild Email Id", preferredStyle: .alert)
                let action = UIAlertAction(title: "Restart", style: .default) { UIAlertAction in
                    self.emailIdText.text = ""
                    
                }
                alert.addAction(action)
                self.present(alert, animated: true)
            }else {
                let alert = UIAlertController(title: "", message: "A password send in the email", preferredStyle: .alert)
                let action = UIAlertAction(title: "Go To log In Page", style: .default) { alertAction in
                    self.performSegue(withIdentifier: "GoToLoginPage", sender: self)
                }
                alert.addAction(action)
                self.present(alert, animated: true)
                
            }
            
            
            
        }
        
    }
    
    
}
