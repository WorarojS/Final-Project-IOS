//
//  MyListViewController.swift
//  SickBoys
//
//  Created by wrj.s on 2018-10-31.
//  Copyright © 2018 wrj.s. All rights reserved.
//

import UIKit

class MyListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuButton: UIBarButtonItem!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        sideMenu()
        DataManager.instance.loadMyList()
        
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
    
    //display tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return DataManager.instance.myMyLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let myList = DataManager.instance.myMyLists[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MyListTableViewCell") as? MyListTableViewCell
        {
            cell.setData(myList: myList)
            return cell
        }else
        {
            let cell = MyListTableViewCell()
            cell.setData(myList: myList)
            return cell
        }
    }
    
    // set hight of each cell
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//       // return CGFloat((arc4random() % UInt32(500)) + 100 )
//
//        let cellHeight = tableView.frame.width + 90
//        return cellHeight
//    }
}

