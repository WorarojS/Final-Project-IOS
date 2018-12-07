//
//  AddNewListViewController.swift
//  SickBoys
//
//  Created by wrj.s on 2018-11-09.
//  Copyright © 2018 wrj.s. All rights reserved.
//

import UIKit
import CoreData


class AddNewListViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate,
UINavigationControllerDelegate, UITextViewDelegate {

    @IBOutlet var starBtn: [UIButton]!
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var ImgView: UIImageView!
    @IBOutlet weak var dateTxt: UITextField!
    @IBOutlet weak var typeTxt: UITextField!
    @IBOutlet weak var reviewTxt: UITextView!
    @IBOutlet weak var pointTxt: UITextView!
    
    @IBOutlet weak var SelectPictureBtn: UIButton!
    

    var imagePicker: UIImagePickerController!
    let type = ["Sativa","Hybrid","Indica"]
    var selectedType: String?
    var defaultImg: UIImage?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
      
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(createTypePicker), name: UIResponder.keyboardWillShowNotification, object: nil)
        

        
         //--------------------------------Review Textview
        self.nameTxt.delegate = self
        self.reviewTxt.delegate = self
        pointTxt.isHidden = true
        

        reviewTxt.layer.borderColor = UIColor.gray.withAlphaComponent(0.1).cgColor
        reviewTxt.layer.borderWidth = 1.0
        
        //The rounded corner part, where you specify your view's corner radius:
        reviewTxt.layer.cornerRadius = 5
      
        
        //--------------------------------select Image
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        //--------------------------------Boarder for imgView
        ImgView.layer.borderWidth = 1.5
        ImgView.layer.borderColor = UIColor.gray.cgColor
        ImgView.clipsToBounds = true
        
        createTypePicker()
        
        //-------------------------------- auto generate date
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: date)
        //-------------------------------- auto set date on TextField
        dateTxt.text = result
        reviewTxt.delegate = self
    }
    
    // show and hide keyboard when tap textview
    @objc func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y -= 150
    }
    @objc func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y += 150
    }
    
    
    
    
    
    //--------------------------------Button function
    //--------------------------------select photo button
    @IBAction func selectPhotoBtn(_ sender: Any)
    {
        present(imagePicker, animated: true, completion: nil)
        (sender as AnyObject).setTitle("", for: [])
    }
    

    //--------------------------------select image
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            ImgView.image = image
        }
        imagePicker.dismiss(animated: true, completion: nil)
        SelectPictureBtn.setTitle("", for: .normal)
    }
    
    //--------------------------------end edit when tap outside the Review Textview
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }


    
    //--------------------------------picker function
    @objc func createTypePicker()
    {
        let typePick = UIPickerView()
        typePick.delegate = self
        typeTxt.inputView = typePick
    //--------------------------------color of picker
        typePick.backgroundColor = .white
    }
    
    //--------------------------------make done button on tool bar
   
    
    //--------------------------------set reviewTxt to empty when clicked
    func textViewDidBeginEditing(_ textView: UITextView)
    {
        reviewTxt.text = ""
    }
    
    
    
    func displayMyAlertMessage(userMessage:String){
        
        let myAlert = UIAlertController(title: "Ops!", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
    
    
    
    //--------------------------------save function to db
    @IBAction func saveBtnClicked(_ sender: Any)
    {
        let name = nameTxt.text
        let star = pointTxt.text
        let review = reviewTxt.text
        let type = typeTxt.text
        let pic = ImgView.image
        
        // check if its empty
        if (reviewTxt.text == "Review"),(type!.isEmpty),(star!.isEmpty),(pic == nil)
        {
            nameTxt.text = "-"
            reviewTxt.text = "-"
            typeTxt.text = "-"
            pointTxt.text = "1"
            let yourImage: UIImage = UIImage(named: "logo")!
            ImgView.image = yourImage
            return
        }
        else if (name!.isEmpty)
        {
            nameTxt.text = "-"
            return
        }
        else if (review?.isEmpty)!
        {
            reviewTxt.text = "-"
            return
        }
        else if (type!.isEmpty)
        {
            typeTxt.text = "-"
            return
        }
        else if (star!.isEmpty)
        {
            pointTxt.text = "1"
            return
        }
        else if (pic == nil)
        {
            let yourImage: UIImage = UIImage(named: "logo")!
            ImgView.image = yourImage
            return
        }
        else
            // if not empty the run
        {
            let app = UIApplication.shared.delegate as! AppDelegate
            let context = app.persistentContainer.viewContext
            let entity = NSEntityDescription.entity( forEntityName: "MyList", in: context)!
            let myList = MyList(entity: entity, insertInto: context)

            //--------------------------------save to db
            myList.name = nameTxt.text
            myList.type = typeTxt.text
            myList.date = dateTxt.text
            myList.review = reviewTxt.text
            myList.point = pointTxt.text
            myList.setProductImage(img: ImgView.image!)
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
    
    
    
    // star button
    @IBAction func starBtnTapped(_ sender: UIButton) {
        // rating point
        let tag = sender.tag
        
      
        
       // make star color when taped
        for button in starBtn
        {
            if button.tag <= tag
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
        if tag == 0 {
            return pointTxt.text = "1"
        }
        else if tag == 1
        {
            return pointTxt.text = "2"
        }
        else if tag == 2
        {
            return pointTxt.text = "3"
        }
        else if tag == 3
        {
            return pointTxt.text = "4"
        }
        else
        {
            return pointTxt.text = "5"
        }
    }
    
}


    //--------------------------------extention for pickerView
extension AddNewListViewController: UIPickerViewDelegate, UIPickerViewDataSource
{
    //--------------------------------we have 1 picker view
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    //--------------------------------how many rows we want in pickerview
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return type.count
    }
    //--------------------------------title on row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return type[row]
    }
    //--------------------------------which row get selected
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        selectedType = type[row]
        typeTxt.text = selectedType
    }
}

