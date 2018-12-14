//
//  HelpViewController.swift
//  SickBoys
//
//  Created by wrj.s on 2018-12-14.
//  Copyright © 2018 wrj.s. All rights reserved.
//

import UIKit
import Firebase

class HelpViewController: UIViewController, UITextViewDelegate,UITextFieldDelegate {

    @IBOutlet weak var email: UITextField!

    @IBOutlet weak var feedback: UITextView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.email.delegate = self
        self.feedback.delegate = self
        
        
        
        email.layer.borderColor = UIColor.gray.withAlphaComponent(1).cgColor
        email.layer.borderWidth = 1.0
    
        feedback.layer.borderColor = UIColor.gray.withAlphaComponent(1).cgColor
        feedback.layer.borderWidth = 1.0
        
        
       
        
        

        // Do any additional setup after loading the view.
    }
    
    func textViewDidBeginEditing(_ feedback: UITextView)
    {
        feedback.text = ""
        
    }
   
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
    func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y -= 150
    }
    func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y += 150
    }
    

    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
        dismiss(animated: true, completion: nil)
    }
    @IBAction func save(_ sender: Any) {
        let fedb = [email.text, feedback.text ]
         Database.database().reference().child("feedback").childByAutoId().setValue(fedb)
            
            let alertController = UIAlertController(title: "Thanks you for feedback", message: "", preferredStyle: .alert)
            
            // Create OK button
            let OKAction = UIAlertAction(title: "OK", style: .default)
            { (action:UIAlertAction!) in
                self.navigationController?.popViewController(animated: true)
                
                self.dismiss(animated: true, completion: nil)
            }
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion:nil)
        
    }
}
