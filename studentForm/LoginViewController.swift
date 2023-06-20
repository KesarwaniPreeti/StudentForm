//
//  ViewController.swift
//  studentForm
//
//  Created by Preeti Kesarwani on 9/26/22.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import Firebase



class LoginViewController: UIViewController {
    
    
    @IBOutlet var emailTextField: UITextField!
    
    
    @IBOutlet var passwordTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signIn(_ sender: UIButton) {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            
        Auth.auth().signIn(withEmail: email, password: password) {( user , error) in
            
            if let e = error {
                self.handleFireAuthError(error: e)
            } else  {
                //if Auth.auth().currentUser?.uid == nil {
                   self.performSegue(withIdentifier: "LoginToForm", sender: self)
                    
               // }
                //self.performSegue(withIdentifier: "goToDirect", sender: self)
            }
                
              
        }
    
            
            
        }
        
    }
}

   

extension UIViewController{
    func handleFireAuthError(error : Error){

        if let errorCode = AuthErrorCode.Code(rawValue: error._code){
                    print(errorCode.errorMessage)
                    let alert = UIAlertController(title: "Error", message: errorCode.errorMessage, preferredStyle: .alert)

                    let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)

                    alert.addAction(okAction)

                    self.present(alert, animated: true, completion: nil)

                }
            }

        }
    

extension AuthErrorCode.Code {
    var errorMessage: String {
        switch self {
        case .emailAlreadyInUse:
            return "The email is already in use with another account"
        case .userNotFound:
            return "Account not found for the specified user. Please check and try again"
        case .userDisabled:
            return "Your account has been disabled. Please contact support."
        case .invalidEmail, .invalidSender, .invalidRecipientEmail:
            return "Please enter a valid email"
        case .networkError:
            return "Network error. Please try again."
        case .weakPassword:
            return "Your password is too weak. The password must be 6 characters long or more."
        case .wrongPassword:
            return "Your password is incorrect. Please try again or use 'Forgot password' to reset your password"
        
        default:
            return "Unknown error occurred"
        }
    }
}
    

 







