//
//  News.swift
//  SickBoys
//
//  Created by wrj.s on 2018-12-11.
//  Copyright © 2018 wrj.s. All rights reserved.
//

import Foundation
import Firebase
import SwiftyJSON

class News
{

    var imageDownloadURL: String?
    private var image: UIImage!
    var header: String!
    var reference: String!
    var credit: String!
    var webUrl: String!
    
    
    init(image: UIImage, header: String, reference: String, credit: String, webUrl: String) {
        self.image = image
        self.header = header
        self.reference = reference
        self.credit = credit
        self.webUrl = webUrl


    }
    
    init(snapshot: DataSnapshot) {
        let json = JSON(snapshot.value!)
        self.imageDownloadURL = json["url"].stringValue
        self.header = json["header"].stringValue
        self.reference = json["reference"].stringValue
        self.credit = json["credit"].stringValue
        self.webUrl = json["webUrl"].stringValue
        

    }
    
    
    
}
