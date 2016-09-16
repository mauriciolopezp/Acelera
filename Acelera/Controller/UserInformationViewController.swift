//
//  UserInformationViewController.swift
//  Acelera
//
//  Created by mac on 5/5/16.
//  Copyright © 2016 mac. All rights reserved.
//

import UIKit
import Firebase

class UserInformationViewController: UIViewController,UITextFieldDelegate,UIGestureRecognizerDelegate {
    
   
     @IBOutlet var fieldeamil: UITextField!
     @IBOutlet var fieldcarnum: UITextField!
     @IBOutlet var fieldphonenum: UITextField!
     @IBOutlet var fieldpassword: UITextField!
     @IBOutlet weak var btnsavedata: UIButton!
     @IBOutlet weak var btnBack: UIButton!
     @IBOutlet weak var viewBg: UIView!
    
    
   // let ref = Firebase(url: "https://acelera.firebaseio.com")

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
        
               
        // implemeting tap gesture
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "touchHappen")
        view.addGestureRecognizer(tap)
        tap.delegate = self

        fieldeamil.delegate = self
        fieldcarnum.delegate = self
        fieldphonenum.delegate = self
        fieldpassword.delegate = self
        
        
        // email field
        fieldeamil.layer.cornerRadius = 5
        fieldeamil.layer.masksToBounds = false
        UILabel.appearanceWhenContainedInInstancesOfClasses([UITextField.self]).textColor = UIColor.whiteColor()
        //carnumber field
        fieldcarnum.layer.cornerRadius = 5
        fieldcarnum.layer.masksToBounds = false
        UILabel.appearanceWhenContainedInInstancesOfClasses([UITextField.self]).textColor = UIColor.whiteColor()
        //phonenumber field
        fieldphonenum.layer.cornerRadius = 5
        fieldphonenum.layer.masksToBounds = false
        UILabel.appearanceWhenContainedInInstancesOfClasses([UITextField.self]).textColor = UIColor.whiteColor()
        // password field
        fieldpassword.layer.cornerRadius = 5
        fieldpassword.layer.masksToBounds = false
        UILabel.appearanceWhenContainedInInstancesOfClasses([UITextField.self]).textColor = UIColor.whiteColor()
        
        btnsavedata.layer.cornerRadius = 5;


    }
    
    
    
       
//    override func viewDidAppear(animated: Bool) {
//        super.viewDidAppear(animated)
//        self.view.userInteractionEnabled = true
//        let tapGesture = UITapGestureRecognizer(target: self, action: Selector("handleTap:"))
//        self.view.addGestureRecognizer(tapGesture)
//    }

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
    

    @IBAction func typePickerViewSelected(sender: AnyObject)
    {
    
    }
    @IBAction func clikcBAck(sender: AnyObject)
    {
        
   
    if let navController = self.navigationController {
        navController.popViewControllerAnimated(true)
    }
    }
    
    func keyboardWillShow(sender: NSNotification) {
        self.viewBg.frame.origin.y -= 50
    }
    func keyboardWillHide(sender: NSNotification) {
        self.viewBg.frame.origin.y += 0
    }
    
    
    @IBAction func ActionSavedata(sender: UIButton)
    {
        
        
                let email = fieldeamil.text
                let Carnumber = fieldcarnum.text
                let phonenumber = fieldphonenum.text
                let password = fieldpassword.text
        
        if ARSLineProgress.shown { return }
        
        ARSLineProgress.showWithPresentCompetionBlock { () -> Void in
            print("Showed with completion block")
        }
        
        if Carnumber != "" && email != "" && password != "" && phonenumber != ""{
            
            // Set Email and Password for the New User.
            
            DataService.dataService.BASE_REF.createUser(email, password: password, withValueCompletionBlock: { error, result in
                
                if error != nil {
                    
                      ARSLineProgress.hide()
                    self.signupErrorAlert("Acelera!", message: "Having some trouble creating your account. Try again.")
                    
                }
                    
                else
                    
                {
                    
                    // Create and Login the New User with authUser
                    DataService.dataService.BASE_REF.authUser(email, password: password, withCompletionBlock: {
                        err, authData in

                        
       let user = ["provider": authData.provider!, "email": email!, "Carnumber": Carnumber!,"phonenumber":phonenumber!]
                        
                           ARSLineProgress.hide()
                        DataService.dataService.createNewAccount(authData.uid, user: user)
                    })
                    
                    // Store the uid for future access - handy!
                    NSUserDefaults.standardUserDefaults().setValue(result ["uid"], forKey: "uid")
                    //guardamos el usuario y la contraseña
                    NSUserDefaults.standardUserDefaults().setValue(email, forKey: "email")
                    NSUserDefaults.standardUserDefaults().setValue(password, forKey: "password")
                    
                    
                   
                }
            })
            
        }
        
        
        
     if (fieldeamil.text!.isEmpty)
        {
            signupErrorAlert("Acelera!", message: "Escribe tu correo.")
        }
    else if (fieldcarnum.text!.isEmpty)
        {
            signupErrorAlert("Acelera!", message: "Escribe tu nombre.")
        }
    else if (fieldphonenum.text!.isEmpty)
        {
            signupErrorAlert("Acelera!", message: "Escribe tu telefono")
        }
    else if (fieldpassword.text!.isEmpty)
        {
            signupErrorAlert("Acelera!", message: "Escribe tu contraseña.")
        }


       }

    func signupErrorAlert(title: String, message: String) {
        
        // Called upon signup error to let the user know signup didn't work.
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let action = UIAlertAction(title: "Datos Guardados", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
 



 
}
