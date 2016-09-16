//
//  AboutViewController.swift
//  Acelera
//
//  Created by Test on 08/06/16.
//  Copyright © 2016 mac. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
     @IBOutlet weak var btnmenu: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        if self.revealViewController() != nil {
            btnmenu.target = self.revealViewController()
            btnmenu.action = Selector("revealToggle:")
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
