//
//  PopularViewController.swift
//  SickBoys
//
//  Created by wrj.s on 2018-10-31.
//  Copyright © 2018 wrj.s. All rights reserved.
//

import UIKit
import Firebase

class StrainsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
      var strain = [Strains]()



   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        sideMenu()
       
        
        
        Database.database().reference().child("strain").observe(.childAdded)
        { (snapshot) in
            
            DispatchQueue.main.async {
                let newPost = Strains(snapshot: snapshot)
                self.strain.append(newPost)
                let indexPath = IndexPath(row: 0, section: 0)
                self.tableView.insertRows(at: [indexPath], with: .top)
                
            }
 
       
    }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return strain.count
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StrainsTableViewCell", for: indexPath) as! StrainsTableViewCell
        
        cell.straind = self.strain[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
//    {
//
//        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let DvC = Storyboard.instantiateViewController(withIdentifier: "StrainCollectionViewController") as! StrainCollectionViewController
//        DvC.strains = [self.strains[indexPath.row]]
////        print(strains)
//        self.present(DvC, animated: true, completion: nil)
    
        
        
//}
    
    
    
    
    
    func sideMenu()
    {
        if revealViewController() != nil{
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController()?.rearViewRevealWidth = 275
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    

 

}
