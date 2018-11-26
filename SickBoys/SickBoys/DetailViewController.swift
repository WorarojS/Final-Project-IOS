//
//  DetailViewController.swift
//  SickBoys
//
//  Created by wrj.s on 2018-11-22.
//  Copyright © 2018 wrj.s. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameTxf: UITextField!
    @IBOutlet weak var typeTxf: UITextField!
    @IBOutlet weak var dateTxf: UITextField!
    @IBOutlet weak var reviewTxf: UITextView!
    
   
    
    var getMyLists = [MyList]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.reviewTxf.delegate = self
        typeTxf.layer.borderColor = UIColor.gray.withAlphaComponent(0.1).cgColor
        typeTxf.layer.borderWidth = 1.0
        
        //The rounded corner part, where you specify your view's corner radius:
        typeTxf.layer.cornerRadius = 5
        
//        refreshCoreData()
        
        for MyLists in getMyLists {
     print(MyLists.name!,MyLists.type!,MyLists.date!,MyLists.review!)
            
            nameTxf.text = MyLists.name
            imgView.image = MyLists.getProductImage()
            typeTxf.text = MyLists.type
            dateTxf.text = MyLists.date
            reviewTxf.text = MyLists.review
            
            if MyLists.type == "Sativa"
            {
                typeTxf.backgroundColor = UIColor.red
                typeTxf.textColor = UIColor.white
            }
            else if MyLists.type == "Hybrid"
            {
                typeTxf.backgroundColor = UIColor.blue
                typeTxf.textColor = UIColor.white
            }
            else if MyLists.type == "Indica"
            {
                typeTxf.backgroundColor = UIColor.green
            }
        }
        
       
    }
}
