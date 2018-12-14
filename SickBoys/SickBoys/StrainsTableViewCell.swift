//
//  StrainsTableViewCell.swift
//  SickBoys
//
//  Created by wrj.s on 2018-12-13.
//  Copyright © 2018 wrj.s. All rights reserved.
//

import UIKit
import Firebase

class StrainsTableViewCell: UITableViewCell {

    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var res: UITextField!
    @IBOutlet weak var des: UILabel!
    
    var straind: Strains! {
        didSet{
            self.updateUI()
        }
    }
  
 
     func updateUI() {
      self.name.text = straind.name
//        self.id.text = String(straind.id)
        self.res.text = straind.race
        self.des.text = straind.des
        self.res.sizeToFit()
        
        
        if straind.race == "sativa"
        {
            res.backgroundColor = UIColor.red
            res.textColor = UIColor.white
        }
        else if straind.race == "hybrid"
        {
            res.backgroundColor = UIColor.blue
            res.textColor = UIColor.white
        }
        else if straind.race == "indica"
        {
            res.backgroundColor = UIColor.green
        }
      
    }
    
   

}
