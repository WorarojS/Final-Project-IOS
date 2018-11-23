//
//  MyListTableViewCell.swift
//  SickBoys
//
//  Created by wrj.s on 2018-11-19.
//  Copyright © 2018 wrj.s. All rights reserved.
//

import UIKit

class MyListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var myListImg: UIImageView!
    @IBOutlet weak var typeLbl: UITextField!
//    @IBOutlet weak var dateLbl: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    // get data and display to ui
    func setData(myList: MyList) {
        myListImg.image = UIImage(named: "logo")
        nameLbl.text = myList.detail
        typeLbl.text = myList.type
//        dateLbl.text = myList.date
        
        // change bg and txtclr
        if myList.type == "Sativa"
        {
            typeLbl.backgroundColor = UIColor.red
            typeLbl.textColor = UIColor.white
        }
        else if myList.type == "Hybrid"
        {
            typeLbl.backgroundColor = UIColor.blue
            typeLbl.textColor = UIColor.white
        }
        else if myList.type == "Indica"
        {
            typeLbl.backgroundColor = UIColor.green
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
