//
//  uitipopagoViewController.swift
//  Acelera
//
//  Created by Jose mauricio Lopez Pliego on 16/08/16.
//  Copyright © 2016 mac. All rights reserved.
//

import UIKit

class uitipopagoViewController: UIViewController ,buttonPressDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func metodoPago(sender: UIButton) {
      tabBarController?.selectedIndex = 1
                
    }
    
    func buttonPressed() {
        //secondButton.alpha = 0
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
