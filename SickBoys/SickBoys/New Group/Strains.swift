//
//  Strains.swift
//  SickBoys
//
//  Created by wrj.s on 2018-12-13.
//  Copyright © 2018 wrj.s. All rights reserved.
//

import Foundation
import SwiftyJSON
import Firebase

class Strains{

    var id: Int!
    var name: String!
    var race: String!
    var des: String!


    init(id: Int, name: String, race: String, des: String ) {
        self.id = id
        self.name = name
        self.race = race
        self.des = des

}

    init(snapshot: DataSnapshot) {
        let json = JSON(snapshot.value!)
        self.id = json["id"].int
        self.name = json["name"].stringValue
        self.race = json["race"].stringValue
        self.des = json["desc"].stringValue


    }
}
