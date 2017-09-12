//
//  MapViewController.swift
//  ARapp
//
//  Created by Bill on 9/7/17.
//  Copyright © 2017 Bill Pham. All rights reserved.
//

import Foundation
import MapKit
import UIKit

class MapViewController: UIViewController, CLLocationManagerDelegate {
    var locationManager : CLLocationManager = CLLocationManager()
    var map : MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadView() {
        self.map = MKMapView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        
        self.view = self.map
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("received permission authorization")
        
        switch(status) {
        case .notDetermined:
            print("not determined")
            break;
        case .authorizedWhenInUse:
            print("when in use")
            locationManager.requestLocation()
            break;
        case .denied:
            print("denied")
            break;
        default:
            break;
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("received locations")
        
        for l in locations {
            let region = MKCoordinateRegion(center: l.coordinate, span: MKCoordinateSpan(latitudeDelta: CLLocationDegrees(0.0075), longitudeDelta: CLLocationDegrees(0.0075)))
            self.map.setRegion(region, animated: true)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("failed! error: " + error.localizedDescription)
    }
    
    func zoomToCurrentLocation() {
        
    }
}
