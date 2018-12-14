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
    
    @IBOutlet var rateTxf: [UIButton]!
    @IBOutlet weak var editBtn: UIButton!
    
    var editTextFieldToggle: Bool = false
    
    var pointStr = ""
    
    
    
    var getMyLists = [MyList]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        print(getMyLists)
        
        self.reviewTxf.delegate = self
        reviewTxf.layer.borderColor = UIColor.gray.withAlphaComponent(0.1).cgColor
        reviewTxf.layer.borderWidth = 1.0
        
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
            
            pointStr = MyLists.point!
            
            let point: Int? = Int(pointStr)
            let points = point! - 1
            for button in rateTxf
            {
                if button.tag <= points
                {
                    // selected
                    button.setTitle("★", for: .normal)
                    
                    // print(tag)
                }else
                {
                    // not selected
                    button.setTitle("☆", for: .normal)
                }
            }
            
            
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
    
    
    // show and hide keyboard when tap textview
    @objc func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y -= 150
    }
    @objc func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y += 150
    }
    
    
    
    // edit button editable when clicked
    @IBAction func editBtn(_ sender: Any) {
        editTextFieldToggle = !editTextFieldToggle //switches button ON/OFF
        
        if editTextFieldToggle == true {
            textFieldActive()
            
        } else {
            textFieldDeactive()
            save()
            
        }
    }
    // active editable function
    func textFieldActive(){
        //Turn things ON
        nameTxf.isUserInteractionEnabled = true
        reviewTxf.isEditable = true
        
        let alertController = UIAlertController(title: "Are you sure to Activate Editable?", message: "", preferredStyle: .alert)
        
        // Create OK button
        let OKAction = UIAlertAction(title: "OK", style: .default)
        { (action:UIAlertAction!) in
            
            // Code in this block will trigger when OK button tapped.
            self.editBtn.setTitle("Save", for: .normal);
            
        }
        alertController.addAction(OKAction)
        
        // Create Cancel button
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction!) in
            self.textFieldDeactive();
        }
        alertController.addAction(cancelAction)
        
        // Present Dialog message
        self.present(alertController, animated: true, completion:nil)
        
    }
    
    func textFieldDeactive()
    { //Add anything else
        //Turn things OFF
        nameTxf.isUserInteractionEnabled = false
        reviewTxf.isEditable = false
        editBtn.setTitle("Edit", for: .normal)
    }
    
    
    func save(){
        if let name = nameTxf.text, name != ""
        {
            let app = UIApplication.shared.delegate as! AppDelegate
            let context = app.persistentContainer.viewContext
            let entity = NSEntityDescription.entity( forEntityName: "MyList", in: context)!
            let myList = MyList(entity: entity, insertInto: context)
            
            //--------------------------------save to db
            myList.name = name
            myList.type = typeTxf.text
            myList.date = dateTxf.text
            myList.review = reviewTxf.text
            myList.point = pointStr
            myList.setProductImage(img: imgView.image!)
            
            context.insert(myList)
            
            
            
            //-------------------------------- if can save otherwise print Error
            do
            {
                try context.save()
            }
            catch let error as NSError
            {
                print(error.debugDescription)
                print("Error")
            }
        }
        navigationController?.popViewController(animated: true)
    }
    
    // hide keyboard when touch outside textview
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
}
