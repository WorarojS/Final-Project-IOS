//
//  DataManager.swift
//  SickBoys
//
//  Created by wrj.s on 2018-11-21.
//  Copyright © 2018 wrj.s. All rights reserved.
//

import Foundation
import UIKit

class DataManager{
    
    static let instance = DataManager()
    let MYLIST_KEY = "MyList"
    private var _myMyLists = [MyList]()
    
    var myMyLists: [MyList]{
        return _myMyLists
    }
    
    
    func loadMyList()
    {
        if let myListData = UserDefaults.standard.object(forKey: MYLIST_KEY) as? NSData
        {
            if let myListArray = NSKeyedUnarchiver.unarchiveObject(with: myListData as Data) as? [MyList]
            {
                _myMyLists = myListArray
            }
        }
    }
    
    
    func saveMyLists(){
        let myListData = NSKeyedArchiver.archivedData(withRootObject: _myMyLists)
        UserDefaults.standard.set(myListData, forKey: MYLIST_KEY)
        UserDefaults.standard.synchronize()
    }
    
    
    func saveImageToFile(image: UIImage) -> String
    {
        let imgName = "image.png"
        if let imgData = image.pngData()
            
        {
            do{
            let fullPath = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent (imgName)
                let result = try imgData.write(to: fullPath, options: .atomic)
            }catch{
                print(error)
            }
        }
        return imgName
    }
    
    
    func getDocumentDirectory() -> NSString
    {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentDirectory = paths[0]
        return documentDirectory as NSString
    }
    
    func addMyList(myList: MyList)
    {
        _myMyLists.append(myList)
        saveMyLists()
        loadMyList()
    }
}
