//
//  StudentResigtrationFormViewController.swift
//  studentForm
//
//  Created by Preeti Kesarwani on 9/26/22.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import Firebase

class StudentResigtrationFormViewController: UIViewController {
    
    let db = Firestore.firestore()
    
   
    
    
    
    @IBOutlet var Name: UITextField!
    
    
    @IBOutlet var ParentName: UITextField!
    
    
    @IBOutlet var Dob: UITextField!
    
    @IBOutlet var Address: UITextField!
    
    @IBOutlet var cellNo : UITextField!
    
    @IBOutlet var emailId: UITextField!
    
    var studentDetails = [StudentDetails]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        loadDetails()
        print(db)
    }
    
    
    
    func loadDetails(){
        
        // studentDetails = []
        
        db.collection("Studentdetail").getDocuments() { [self] (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                
                for document in querySnapshot!.documents {
                    let data = document.data()
                    print(document.data())
                    if let sender = data[K.sender] as? String,
                       let name = data[K.name] as? String,
                       let parent  = data[K.parent] as? String,
                       let dob = data[K.dob] as? String ,
                       let  address = data[K.address] as? String ,
                       let  phoneNo = data[K.phoneNo] as? String,
                       let  EmailId = data[K.emailId] as? String {
                        let newStudentDetails = StudentDetails(name: name, parentName: parent, dob: dob, Address: address, PhoneNo: phoneNo, EmailId:  EmailId , sender: sender)
                        self.studentDetails.append(newStudentDetails)
                
                        
                        
                    }
                }
            }
            
        }
    
    }
    
    @IBAction func submit(_ sender: UIButton) {
        
        
        if Name.text == "" || ParentName.text == "" || Dob.text == "" ||
            Address.text == "" || cellNo.text == "" || emailId.text == "" {
            let alert = UIAlertController(title: "Error", message: "Please Fill the all Information", preferredStyle: .alert)
            let action = UIAlertAction(title: "Restart", style: .default, handler: nil)
            let cancle = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(action)
            alert.addAction(cancle)
            present(alert, animated: true)
        } else {
            
            if var studentName = Name.text, let parentName = ParentName.text, let dob = Dob.text, let address = Address.text, let phoneNo = cellNo.text, let mailId = emailId.text, var sender = Auth.auth().currentUser?.email {
                let alert = UIAlertController(title: "SuccessFully ", message: "Your Application has saved successfully", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default) { alertAction in
                    self.performSegue(withIdentifier: "submit", sender: self)
                    
        
                }

                
                alert.addAction(action)
                self.present(alert, animated: true)
                
                // Add a new document with a generated ID
                var ref: DocumentReference? = nil
                ref = db.collection("Studentdetail").addDocument(data: [
                    K.name : studentName,
                    K.parent : parentName,
                    K.phoneNo : phoneNo,
                    K.emailId : mailId,
                    K.sender : sender,
                    K.address : address,
                    K.dob : dob
                    
                    
                ]) { err in
                    if let err = err {
                        print("Error adding document: \(err)")
                    } else {
                        print("Document added with ID: \(ref!.documentID)")
                    }
                }
                
            }
            
            
            
        }
        
}
        
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        

        
        if segue.identifier == "submit" {
            var destinationVC = segue.destination as? StudentDetailsViewController
            destinationVC?.phoneNo = cellNo.text
            destinationVC?.studentName = Name.text
            destinationVC?.emailId = emailId.text
            destinationVC?.parentName = ParentName.text
            destinationVC?.dob = Dob.text
            destinationVC?.add = Address.text
            
        
        }
        
    }

    
    
    @IBAction func clear(_ sender: Any) {
        details()
    }
    
    func details(){
        Name.text = ""
        ParentName.text = ""
        Dob.text = ""
        Address.text = ""
        cellNo.text = ""
        emailId.text = ""
    }
    
}




///sender = Auth.auth().currentUser?.email


