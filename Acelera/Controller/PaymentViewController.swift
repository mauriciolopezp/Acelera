//
//  PaymentViewController.swift
//  Acelera
//
//  Created by mac on 5/4/16.
//  Copyright © 2016 mac. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class PaymentViewController: UIViewController ,MKMapViewDelegate,CLLocationManagerDelegate{
    
    @IBOutlet weak var btnBack: UIButton!
     @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }

        // Do any additional setup after loading the view.
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        let location = locations.last! as CLLocation
        
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        self.mapView.setRegion(region, animated: true)
    }
    
    // MARK: - MapView Delegate
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationReuseId = "Place"
        var anView = mapView.dequeueReusableAnnotationViewWithIdentifier(annotationReuseId)
        if anView == nil {
            anView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationReuseId)
        } else {
            anView!.annotation = annotation
        }
        anView!.image = UIImage(named: "pointer")
        anView!.backgroundColor = UIColor.clearColor()
        anView!.canShowCallout = false
        return anView
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
