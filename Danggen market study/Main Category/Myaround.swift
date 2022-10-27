//
//  Myaround.swift
//  Danggen market study
//
//  Created by Yonghun Roh on 2022/09/15.
//

import UIKit
import CoreLocation
import MapKit

class MyaroundViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet var myMap: MKMapView!
//    @IBOutlet var lblLocationInfo1: UILabel!
//    @IBOutlet var lblLocationInfo2: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        myMap.showsUserLocation = true
    }
    
//    func goLocation(latitudeValue: CLLocationDegrees,
//                    longitudeValue : CLLocationDegrees, delta span :Double) {
//        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
//        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
//        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
//        myMap.setRegion(pRegion, animated: true)
//
//    }
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//    let pLocation = locations.last
//    goLocation(latitudeValue: (pLocation?.coordinate.latitude)!,
//               longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
//        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
//            (placemarks, error) -> Void in
//            let pm = placemarks!.first
//            let country = pm!.country
//            var address:String = country!
//            if pm!.locality != nil {
//                address += ""
//                address += pm!.thoroughfare!
//            }
//            self.lblLocationInfo1.text = "현재 위치"
//            self.lblLocationInfo2.text = address
//        })
//
//        locationManager.stopUpdatingLocation()
//
//    }
}
