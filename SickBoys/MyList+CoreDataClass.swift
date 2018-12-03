//
//  MyList+CoreDataClass.swift
//  SickBoys
//
//  Created by wrj.s on 2018-11-23.
//  Copyright © 2018 wrj.s. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit

@objc(MyList)
public class MyList: NSManagedObject {
    
    func setProductImage(img: UIImage)
    {
        let data = img.pngData()
        self.image = data as NSData?
    }
    
    func getProductImage() -> UIImage
    {
        let img = UIImage(data: self.image! as Data)!
        return img
    }

}
