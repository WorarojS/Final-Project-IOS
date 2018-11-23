//
//  AddNewListViewController.swift
//  SickBoys
//
//  Created by wrj.s on 2018-11-09.
//  Copyright © 2018 wrj.s. All rights reserved.
//

import UIKit


class AddNewListViewController: UIViewController, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var reviewTxt: UITextView!
    @IBOutlet weak var ImgView: UIImageView!
    var imagePicker: UIImagePickerController!
    let type = ["Sativa","Hybrid","Indica"]
    var selectedType: String?
    @IBOutlet weak var typeTxt: UITextField!
//    @IBOutlet weak var dateTxt: UITextField!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
         //Review Textview
        self.reviewTxt.delegate = self
        //Boarder for Textview
        reviewTxt!.layer.borderWidth = 1
        reviewTxt!.layer.borderColor = UIColor.gray.cgColor
        
        // select Image
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        //Boarder for imgView
        ImgView.layer.borderWidth = 1.5
        ImgView.layer.borderColor = UIColor.gray.cgColor
        ImgView.clipsToBounds = true
        
        createTypePicker()
        createToolbar()
        
    }
    
//    @IBAction func dateBtn(_ button: UIButton) {
//        convertDateFormatter()
//        button.isHidden = true
//
//    }
//
//    func convertDateFormatter(){
//        let date = Date()
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd-MM-yyyy" // change format as per needs
//        let result = formatter.string(from: date)
//        return dateTxt.text = result
//    }
    
    
    //--------------------------------

    // Button function
    //select photo button
    @IBAction func selectPhotoBtn(_ sender: Any)
    {
        present(imagePicker, animated: true, completion: nil)
        (sender as AnyObject).setTitle("", for: [])
    }
    
    // cancel button action
    @IBAction func cancelBtn(_ sender: Any)
    {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    // save button action
    @IBAction func saveBtn(_ sender: Any)
    {
        if let strDetail = reviewTxt.text ,
            let img = ImgView.image,
            let types = typeTxt.text
//            let dates = dateTxt.text
        {
            let imgName = DataManager.instance.saveImageToFile(image: img)
            let myList = MyList(
                detail: strDetail,
                imgName: imgName,
                type: types
                /*date: dates*/)
            DataManager.instance.addMyList(myList: myList)
            // close VC after save
            navigationController?.popViewController(animated: true)
            dismiss(animated: true, completion: nil)
            // print save after succesful save
            print("save sucesfully")
        }
    }

    //--------------------------------

    // select image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            ImgView.image = image
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    // end edit when tap outside the Review Textview
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }

//--------------------------------
    
    // picker function
    func createTypePicker()
    {
        let typePick = UIPickerView()
        typePick.delegate = self
        typeTxt.inputView = typePick
    // color of picker
        typePick.backgroundColor = .white
    }
    
    // make done button on tool bar
    func createToolbar()
    {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(AddNewListViewController.dismissKeyboard))
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        typeTxt.inputAccessoryView = toolBar
    }
    // function of done button
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
    
    
    
}

    // extention for pickerView
extension AddNewListViewController: UIPickerViewDelegate, UIPickerViewDataSource
{
    // we have 1 picker view
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    // how many rows we want in pickerview
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return type.count
    }
    // title on row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return type[row]
    }
    // which row get selected
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        selectedType = type[row]
        typeTxt.text = selectedType
    }
}
