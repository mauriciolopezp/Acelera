//
//  DataService.swift
//  Acelera
//
//  Created by mac on 5/11/16.
//  Copyright © 2016 mac. All rights reserved.
//

import Foundation
import Firebase

class DataService {
    
    static let dataService = DataService()
    
    private var _BASE_REF = Firebase(url: "\(BASE_URL)")
    private var _USER_REF = Firebase(url: "\(BASE_URL)/users")
    private var _JOKE_REF = Firebase(url: "\(BASE_URL)/jokes")
    private var _VIAJES_REF = Firebase(url: "\(BASE_URL)/viajes")
    private var _CHOFERES_REF=Firebase(url: "\(BASE_URL)/choferes")
    private var _DATOSCHOFERES_REF=Firebase(url: "\(BASE_URL)/DatosChoferes")
    private var _DATOSUNIDAD_REF=Firebase(url: "\(BASE_URL)/DatosUnidad")
    
    var BASE_REF: Firebase {
        return _BASE_REF
    }
    
    var USER_REF: Firebase {
        return _USER_REF
    }
    
    var CURRENT_USER_REF: Firebase {
        let userID = NSUserDefaults.standardUserDefaults().valueForKey("uid") as! String
        
        let currentUser = Firebase(url: "\(BASE_REF)").childByAppendingPath("users").childByAppendingPath(userID)
        
        return currentUser!
    }
    
    var JOKE_REF: Firebase {
        return _JOKE_REF
    }
    
    var CHOFERES_REF: Firebase {
        return _CHOFERES_REF
    }
    
    var VIAJES_REF: Firebase {
        return _VIAJES_REF
    }
    
    var DATOSCHOFERES_REF: Firebase {
        return _DATOSCHOFERES_REF
    }
    
    var DATOSUNIDAD_REF: Firebase {
        return _DATOSUNIDAD_REF
    }
    
    func createNewAccount(uid: String, user: Dictionary<String, String>) {
        
        // A User is born.
        
        USER_REF.childByAppendingPath(uid).setValue(user)
    }
    
    func createNewJoke(joke: Dictionary<String, AnyObject>) {
        
        // Save the Joke
        // JOKE_REF is the parent of the new Joke: "jokes".
        // childByAutoId() saves the joke and gives it its own ID.
        
        let firebaseNewJoke = JOKE_REF.childByAutoId()
        
        // setValue() saves to Firebase.
        
        firebaseNewJoke.setValue(joke)
    }
}
    
