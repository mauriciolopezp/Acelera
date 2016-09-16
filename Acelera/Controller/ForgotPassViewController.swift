//
//  ForgotPassViewController.swift
//  Acelera
//
//  Created by Test on 08/06/16.
//  Copyright © 2016 mac. All rights reserved.
//

import UIKit

class ForgotPassViewController: UIViewController {
    @IBOutlet weak var btnBack: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func clikcBAck(sender: AnyObject)
    {
        
        //autocompleteTextfield.removeFromSuperview()
        
        
        if let navController = self.navigationController {
            navController.popViewControllerAnimated(true)
        }
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
