//
//  MyList.swift
//  SickBoys
//
//  Created by wrj.s on 2018-11-19.
//  Copyright © 2018 wrj.s. All rights reserved.
//

import Foundation

class MyList: NSObject, NSCoding {
    private var _detail: String!
    private var _imgName: String!
    private var _type: String!
//    private var _date: String!
    
    var detail: String
    {
        return _detail
    }
    
    var imgName: String
    {
        return _imgName
    }
    
    var type: String
    {
        return _type
    }
    
//    var date: String
//    {
//        return _date
//    }
    
    init(detail: String, imgName: String, type: String /*date: String*/) {
        self._detail = detail
        self._imgName = imgName
        self._type = type
//        self._date = date

    }
    
    override init() {
        
    }
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self._detail = aDecoder.decodeObject(forKey: "detail") as? String
        self._imgName = aDecoder.decodeObject(forKey: "imageName") as? String
        self._type = aDecoder.decodeObject(forKey: "type") as? String
//        self._date = aDecoder.decodeObject(forKey: "date") as? String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self._detail, forKey: "detail")
        aCoder.encode(self._imgName, forKey: "imageName")
        aCoder.encode(self._type, forKey: "type")
//        aCoder.encode(self._date, forKey: "date")
    }
    
}
