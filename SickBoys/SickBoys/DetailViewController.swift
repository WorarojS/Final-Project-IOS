//
//  DetailViewController.swift
//  SickBoys
//
//  Created by wrj.s on 2018-11-22.
//  Copyright © 2018 wrj.s. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController /*, UITextViewDelegate*/ {
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var nameTxf: UITextField!
    
    @IBOutlet weak var typeTxf: UITextField!
    
    @IBOutlet weak var dateTxf: UITextField!
    @IBOutlet weak var reviewTxf: UITextView!
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.reviewTxf.delegate = self
//        reviewTxf!.layer.borderWidth = 1
//        reviewTxf!.layer.borderColor = UIColor.gray.cgColor

    }
    
    // get data and display to ui
    func setData(myList: MyList) {
        imgView.image = UIImage(named: "logo")
        nameTxf.text = myList.name
        typeTxf.text = myList.type
        dateTxf.text = myList.date
        reviewTxf.text = myList.review
        
        // change bg and txtclr
        if myList.type == "Sativa"
        {
            typeTxf.backgroundColor = UIColor.red
            typeTxf.textColor = UIColor.white
        }
        else if myList.type == "Hybrid"
        {
            typeTxf.backgroundColor = UIColor.blue
            typeTxf.textColor = UIColor.white
        }
        else if myList.type == "Indica"
        {
            typeTxf.backgroundColor = UIColor.green
        }
    }
}

