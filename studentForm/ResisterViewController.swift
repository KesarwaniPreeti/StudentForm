//
//  SignUpAccountViewController.swift
//  studentForm
//
//  Created by Preeti Kesarwani on 9/26/22.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth



class ResisterViewController: UIViewController {
    
    
    @IBOutlet var emailTextField: UITextField!
    
    
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        
        if   let email = emailTextField.text ,
             let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                
                
                if email != "" && password != "" {
                    self.performSegue(withIdentifier: "goToForm", sender: self)
                }  else if
                    email == "" || password == "" {
                    let alert = UIAlertController(title: "Resigtration Form", message: "Please Complete your Resigtration Account", preferredStyle: .alert)
                    let action = UIAlertAction(title: "Restart", style: .default) { alertAction in
                        self.emailTextField.text = ""
                        self.passwordTextField.text = ""
                    }
                    alert.addAction(action)
                    self.present(alert, animated: true)
                    
                }

                
                }
                
            }
        
        }
            
    
            }
        
        
    

    
    
   
