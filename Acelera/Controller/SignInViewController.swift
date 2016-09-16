//
//  SignInViewController.swift
//  Acelera
//
//  Created by mac on 5/4/16.
//  Copyright © 2016 mac. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController,UITextFieldDelegate,UIGestureRecognizerDelegate {
    
    
     @IBOutlet var fieldpassword: UITextField!
     @IBOutlet var fieldemail: UITextField!
     @IBOutlet weak var btnLogin: UIButton!
     @IBOutlet weak var viewBg: UIView!
     //@IBOutlet weak var btnRegister: UIButton!
    

    override func viewDidLoad()
    {
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
        
        // implemeting tap gesture
       
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "touchHappen")
        view.addGestureRecognizer(tap)
        tap.delegate = self

        
        fieldpassword.delegate = self
        fieldemail.delegate = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view, typically from a nib.
       
      // login text field
        fieldpassword.layer.cornerRadius = 5
        fieldpassword.layer.masksToBounds = false
        UILabel.appearanceWhenContainedInInstancesOfClasses([UITextField.self]).textColor = UIColor.whiteColor()
       
        // email textfield
        fieldemail.layer.cornerRadius = 5
        fieldemail.layer.masksToBounds = false
        UILabel.appearanceWhenContainedInInstancesOfClasses([UITextField.self]).textColor = UIColor.whiteColor()
        
         btnLogin.layer.cornerRadius = 5;
       //  btnRegister.layer.cornerRadius = 5;
        
        
        // verificamos si esta guardado el login y contraseña
        
        verificaPws()
        
    }
    func verificaPws()->Void{
        
        
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
         self.viewBg.frame.origin.y = 0
        textField.resignFirstResponder()
        return true
    }
    
    func touchHappen() {
         self.viewBg.frame.origin.y = 0
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        self.view.endEditing(true)
    }
    
    @IBAction func clikcBAck(sender: AnyObject)
    {
       
        if let navController = self.navigationController {
            navController.popViewControllerAnimated(true)
        }
    }
    
    
    @IBAction func ActionLogin(sender: UIButton)
    {
        
        
        if ARSLineProgress.shown { return }
        
        ARSLineProgress.showWithPresentCompetionBlock { () -> Void in
            print("Showed with completion block")
        }
        let email = fieldemail.text
        let password = fieldpassword.text
        
        if email != "" && password != "" {
            
            // Login with the Firebase's authUser method
            
            DataService.dataService.BASE_REF.authUser(email, password: password, withCompletionBlock: { error, authData in
                
                if error != nil {
                    print(error)
                    
                     ARSLineProgress.hide()
                    self.loginErrorAlert("Acelera!", message: "Verifica Tu usuario y contraseña de favor.")
                    
                } else {
                    
                     ARSLineProgress.hide()
                    
                    // Be sure the correct uid is stored.
                    
                    NSUserDefaults.standardUserDefaults().setValue(authData.uid, forKey: "uid")
                    //guardamos el usuario y la contraseña
                    NSUserDefaults.standardUserDefaults().setValue(email, forKey: "email")
                    NSUserDefaults.standardUserDefaults().setValue(password, forKey: "password")
                    // Enter the app!
                    
                    
                    let secondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("SWRevealViewController") as! SWRevealViewController
                    
                    self.navigationController!.pushViewController(secondViewController, animated: true)
                    
                    //self.performSegueWithIdentifier("SWRevealViewController", sender: nil)
                    //performSegueWithIdentifier("nextView", sender: self)
                }
            })
            
        }
       
        if (fieldemail.text!.isEmpty)
        {
            loginErrorAlert("Acelera!", message: "Escribe un correo.")
        }
    else if (fieldpassword.text!.isEmpty)
        {
            loginErrorAlert("Acelera!", message: "Escribe tu contraseña.")
        }
        
       
    }
    
func loginErrorAlert(title: String, message: String) {
    
    // Called upon login error to let the user know login didn't work.
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
    let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
    alert.addAction(action)
    presentViewController(alert, animated: true, completion: nil)
}




    /*func keyboardWillShow(notification:NSNotification) {
        
    adjustingHeight(true, notification: notification)
    }
    
    func keyboardWillHide(notification:NSNotification) {
        
        adjustingHeight(false, notification: notification)
    }
    
    
    func adjustingHeight(show:Bool, notification:NSNotification) {
        // 1
        var userInfo = notification.userInfo!
        // 2
        let keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).CGRectValue()
        // 3
        let animationDurarion = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSTimeInterval
        // 4
        _ = (CGRectGetHeight(keyboardFrame) + 40) * (show ? 1 : -1)
        //5
        UIView.animateWithDuration(animationDurarion, animations: { () -> Void in
            //self.bottomConstraint.constant += changeInHeight
        })
        
    }*/
    
    
    func keyboardWillShow(sender: NSNotification) {
        self.viewBg.frame.origin.y -= 150
    }
    func keyboardWillHide(sender: NSNotification) {
        self.viewBg.frame.origin.y += 0
    }
    
//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        self.view.endEditing(true)
//    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
 
}
