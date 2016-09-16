//
//  ConformationViewController.swift
//  Acelera
//
//  Created by mac on 5/5/16.
//  Copyright © 2016 mac. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ConformationViewController: UIViewController, MKMapViewDelegate , CLLocationManagerDelegate {
     @IBOutlet weak var btnconform: UIButton!
     //@IBOutlet weak var btnmenu: UIBarButtonItem!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
       
//        if self.revealViewController() != nil {
//            btnmenu.target = self.revealViewController()
//            btnmenu.action = Selector("revealToggle:")
//            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
////        }
        
        
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }

        
         btnconform.layer.cornerRadius = 5;
    }
    
    @IBAction func clikcBAck(sender: AnyObject)
    {
        
        
        if let navController = self.navigationController {
            navController.popViewControllerAnimated(true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        let location = locations.last! as CLLocation
        
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        self.mapView.setRegion(region, animated: true)
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
