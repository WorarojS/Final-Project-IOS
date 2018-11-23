////
////  MyList.swift
////  SickBoys
////
////  Created by wrj.s on 2018-11-19.
////  Copyright © 2018 wrj.s. All rights reserved.
////
//
//import Foundation
//
//class MyList: NSObject, NSCoding {
//    private var _name: String!
//    private var _imgName: String!
//    private var _type: String!
//    private var _date: String!
//    private var _review: String!
//
//    var name: String
//    {
//        return _name
//    }
//
//    var imgName: String
//    {
//        return _imgName
//    }
//
//    var type: String
//    {
//        return _type
//    }
//
//    var date: String
//    {
//        return _date
//    }
//
//    var review: String
//    {
//        return _review
//    }
//
//
//
//    init(name: String, imgName: String, type: String, date:String, review:String) {
//        self._name = name
//        self._imgName = imgName
//        self._type = type
//        self._date = date
//        self._review = review
//
//    }
//
//    override init() {
//
//    }
//    required convenience init?(coder aDecoder: NSCoder) {
//        self.init()
//        self._name = aDecoder.decodeObject(forKey: "name") as? String
//        self._imgName = aDecoder.decodeObject(forKey: "imageName") as? String
//        self._type = aDecoder.decodeObject(forKey: "type") as? String
//        self._date = aDecoder.decodeObject(forKey: "date") as? String
//        self._review = aDecoder.decodeObject(forKey: "review") as? String
//
//    }
//
//    func encode(with aCoder: NSCoder) {
//        aCoder.encode(self._name, forKey: "name")
//        aCoder.encode(self._imgName, forKey: "imageName")
//        aCoder.encode(self._type, forKey: "type")
//        aCoder.encode(self._date, forKey: "date")
//        aCoder.encode(self._review, forKey: "review")
//
//    }
//
//}
