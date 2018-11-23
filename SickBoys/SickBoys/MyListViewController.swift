//
//  MyListViewController.swift
//  SickBoys
//
//  Created by wrj.s on 2018-10-31.
//  Copyright © 2018 wrj.s. All rights reserved.
//

import UIKit
import CoreData

class MyListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var MyLists = [MyList]()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        sideMenu()
        
        refreshCoreData()
        tableView.reloadData()

        
    }
    
    //-------------------------------- refresh to see update cell after save
    func refreshCoreData()
    {
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MyList")
        
        do
        {
            let results = try context.fetch(fetchRequest)
            self.MyLists = results as! [MyList]
        }
        catch let error as NSError
        {
            print(error.debugDescription)
        }
    }
    
    //display tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return MyLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MyListTableViewCell") as? MyListTableViewCell
        {
            let myList = MyLists[indexPath.row]
            cell.setValue(myList: myList)
            return cell
        }
        else
        {
            return MyListTableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let DvC = Storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        DvC.getMyLists = [MyLists[indexPath.row]]
        self.navigationController?.pushViewController(DvC, animated: true)
        
    }
    
    
   

    
   
    // slide menu bat on left side
    func sideMenu()
    {
        if revealViewController() != nil
        {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController()?.rearViewRevealWidth = 275
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    

}

