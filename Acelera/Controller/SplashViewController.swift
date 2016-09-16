//
//  SplashViewController.swift
//  Acelera
//
//  Created by Test on 03/06/16.
//  Copyright © 2016 mac. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    @IBOutlet weak var btnlogin: UIButton!
    @IBOutlet weak var btnsignin: UIButton!
    
    var timer = NSTimer()
    let delay = 0.5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnlogin.layer.cornerRadius = 5;
        btnsignin.layer.cornerRadius = 5;
        
        timer.invalidate()
        
        // start the timer
        timer = NSTimer.scheduledTimerWithTimeInterval(delay, target: self, selector: #selector(delayedAction), userInfo: nil, repeats: false)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
       
    
       // [NSThread sleepForTimeInterval,,:5];
       
        
         super.viewWillAppear(animated) // No need for semicolon
        
    }
    
    func delayedAction() {
        
        //verificamos si ya esta guardado el usuario y passsword
        let pref = NSUserDefaults.standardUserDefaults()
        if let email=pref.stringForKey("email")
        {
           if let password=pref.stringForKey("password")
            {
            //intentamos  hacer el login
                
                
                
                if ARSLineProgress.shown { return }
                
                ARSLineProgress.showWithPresentCompetionBlock { () -> Void in
                    print("Showed with completion block")
                }
                
                if email != "" && password != "" {
                    
                    // Login with the Firebase's authUser method
                    
                    DataService.dataService.BASE_REF.authUser(email, password: password, withCompletionBlock: { error, authData in
                        
                        if error != nil {
                            print(error)
                            
                            ARSLineProgress.hide()
                            
                            self.btnlogin.hidden = false
                            self.btnsignin.hidden = false
                    
                        } else {
                            
                            ARSLineProgress.hide()
                            
                            // Be sure the correct uid is stored.
                            
                            NSUserDefaults.standardUserDefaults().setValue(authData.uid, forKey: "uid")
                            
                            
                            let secondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("SWRevealViewController") as! SWRevealViewController
                            
                            self.navigationController!.pushViewController(secondViewController, animated: true)
                            
                            
                        }
                    })
                    
                }
                
                
                
            }
                
                
                
                
                
                
            
        }
        else
        {
        print("action has started")
        btnlogin.hidden = false
        btnsignin.hidden = false
        }
    }
    @IBAction func ShowLoader(sender: UIButton)
    {
        if ARSLineProgress.shown { return }
        
       ARSLineProgress.showWithPresentCompetionBlock { () -> Void in
           print("Showed with completion block")
       }
     
        

    }
    
    @IBAction func HideLoader(sender: UIButton)
    {
        ARSLineProgress.hide()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
