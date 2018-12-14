//
//  AboutViewController.swift
//  SickBoys
//
//  Created by wrj.s on 2018-10-31.
//  Copyright © 2018 wrj.s. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        sideMenu()
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
