//
//  uiSolicitarViaje.swift
//  Acelera
//
//  Created by Jose mauricio Lopez Pliego on 16/08/16.
//  Copyright © 2016 mac. All rights reserved.
//

import UIKit

class uiSolicitarViaje: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func btnPedirAhoraClick(sender: UIButton) {
        
        tabBarController?.selectedIndex = 3
    }
    
    
    @IBAction func btnCotizarClick(sender: AnyObject) {
        
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
