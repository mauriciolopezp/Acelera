//
//  TexiOrderViewController.swift
//  Acelera
//
//  Created by mac on 5/4/16.
//  Copyright © 2016 mac. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation










class TexiOrderViewController: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate {
    
     @IBOutlet weak var btnmenu: UIBarButtonItem!
     @IBOutlet weak var btnsearch1: UIButton!
     @IBOutlet weak var btnsearch2: UIButton!
     @IBOutlet weak var mapView: MKMapView!
     let locationManager = CLLocationManager()
    var buttonPressDelegateObj: buttonPressDelegate?
    
    @IBOutlet weak var Estado: UIButton!
    
    
    @IBOutlet weak var lblEstoyEn: UILabel!
    
    @IBOutlet weak var lblQuieroir: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            btnmenu.target = self.revealViewController()
            btnmenu.action = Selector("revealToggle:")
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
     
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        let location = locations.last! as CLLocation
        
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        self.mapView.setRegion(region, animated: true)
        //pasamos las coordenadas a una ubicacion
        reverseGeocoding(location.coordinate.latitude, longitude: location.coordinate.longitude)
        
        // marcamos la localizacion.
        let coordinate = locations[0].coordinate
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "\(coordinate.latitude) - \(coordinate.longitude)"
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "hh:mm"
        annotation.subtitle = dateFormatter.stringFromDate(NSDate())
        
        self.mapView.
        
            }
    
    
    
    
    
    func reverseGeocoding(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let location = CLLocation(latitude: latitude, longitude: longitude)
        CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
            if error != nil {
                print(error)
                return
            }
            else if placemarks?.count > 0 {
                let area = placemarks![0].name
                print(area!)
                self.lblEstoyEn.text="Estoy en:"+area!
                
            }
        })
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
