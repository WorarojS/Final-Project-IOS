
//
//  NewsViewController.swift
//  SickBoys
//
//  Created by wrj.s on 2018-12-11.
//  Copyright © 2018 wrj.s. All rights reserved.
//

import UIKit
import WebKit
import Firebase

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,  WKUIDelegate, WKNavigationDelegate  {
   
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    var news = [News]()
    var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        sideMenu()
        
        Database.database().reference().child("News").observe(.childAdded)
        { (snapshot) in
            
            DispatchQueue.main.async {
                let newPost = News(snapshot: snapshot)
                self.news.insert(newPost, at: 0)
                let indexPath = IndexPath(row: 0, section: 0)
                self.tableView.insertRows(at: [indexPath], with: .top)
                
            }
        }
    }
    
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
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        cell.news = self.news[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let DvC = Storyboard.instantiateViewController(withIdentifier: "NewsDetailViewController") as! NewsDetailViewController
        DvC.webUrl = self.news[indexPath.row].webUrl
        self.present(DvC, animated: true, completion: nil)
     
        
        
    }
    


}
