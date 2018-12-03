//
//  MyList+CoreDataProperties.swift
//  SickBoys
//
//  Created by wrj.s on 2018-11-30.
//  Copyright © 2018 wrj.s. All rights reserved.
//
//

import Foundation
import CoreData


extension MyList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyList> {
        return NSFetchRequest<MyList>(entityName: "MyList")
    }

    @NSManaged public var date: String?
    @NSManaged public var image: NSData?
    @NSManaged public var name: String?
    @NSManaged public var review: String?
    @NSManaged public var type: String?
    @NSManaged public var point: String?

}
