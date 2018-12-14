//
//  HelpViewController.swift
//  SickBoys
//
//  Created by wrj.s on 2018-12-14.
//  Copyright © 2018 wrj.s. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var email: UITextView!
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
    

    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
        dismiss(animated: true, completion: nil)
    }
    @IBAction func save(_ sender: Any) {
    }
    
}
