//
//  NewsTableViewCell.swift
//  SickBoys
//
//  Created by wrj.s on 2018-12-11.
//  Copyright © 2018 wrj.s. All rights reserved.
//

import UIKit
import Firebase

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var ImgView: UIImageView!
    @IBOutlet weak var Header: UITextView!
 
    @IBOutlet weak var Ref: UITextView!
     @IBOutlet weak var Credit: UITextView!
 
    
    var news: News! {
        didSet {
            self.updateUI()
        }
    }
    

    
    func updateUI() {
        // caption
        

        self.Header.text = news.header
        self.Header.sizeToFit()
        print(news.header)
        self.Ref.text = news.reference
        self.Credit.text = news.credit
//        print(news.reference)
        // download cell photo
        
        // 1. import firebase
        if let imageDownloadURL = news.imageDownloadURL{
            
            let imageStorageRef = Storage.storage().reference(forURL: imageDownloadURL)
            imageStorageRef.getData(maxSize: 2 * 1024 * 1024) { [weak
                self] (data, error) in
                
                if let error = error {
                    print("****** ERROR DOWNLOADING IMAGE: \(error) ************")
                }else{
                    if let imageData = data{
                        DispatchQueue.main.async {
                            let image = UIImage(data: imageData)
                            self?.ImgView.image = image
                        }
                        
                    }
                }
            }
        }
        
    }

}
