//
//  MyListTableViewCell.swift
//  SickBoys
//
//  Created by wrj.s on 2018-11-19.
//  Copyright © 2018 wrj.s. All rights reserved.
//

import UIKit
import CoreData

class MyListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var myListImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var typeLbl: UITextField!
    @IBOutlet weak var dateLbl: UITextField!
    @IBOutlet weak var pointLbl: UITextField!
    
    @IBOutlet var pointBtn: [UIButton]!
    
    
    var rate: String!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        pointLbl.isHidden = true
        
        
        
        
        
         //make star color when taped
       
    }
    
    
    //-------------------------------- get value from DB and set  it to UI
    func setValue(myList: MyList)
    {
        myListImg.image = myList.getProductImage()
        nameLbl.text = myList.name
        typeLbl.text = myList.type
        dateLbl.text = myList.date
        pointLbl.text = myList.point
        
        let point: Int? = Int(pointLbl.text!)
        let points = point! - 1
        
        
        for button in pointBtn
        {
            if button.tag <= points
            {
                // selected
                button.setTitle("☠︎", for: .normal)
                
                // print(tag)
            }else
            {
                // not selected
                button.setTitle(" ", for: .normal)
            }
            
            
        }
        //-------------------------------- change txtBG color
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
