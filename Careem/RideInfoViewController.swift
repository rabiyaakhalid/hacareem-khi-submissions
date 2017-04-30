//
//  RideInfoViewController.swift
//  Careem
//
//  Created by Rabiya  Khalid on 29/04/2017.
//  Copyright © 2017 Rabiya  Khalid. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import Alamofire
import SwiftyJSON

enum Location{
    case startLocation
    case endLocation
}

class RideInfoViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {
    var locationStart = CLLocation()
    var locationEnd = CLLocation()
    var locationManager = CLLocationManager()
    var locationSelected = Location.startLocation
    
      //  @IBOutlet weak var mapView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hi")
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startMonitoringSignificantLocationChanges()
        
                // Do any additional setup after loading the view.
        
    }
    
    func drawPath(startLocation: CLLocation, endLocation: CLLocation){
        let origin = "\(startLocation.coordinate.latitude), \(startLocation.coordinate.longitude)"
        let destination = "\(endLocation.coordinate.latitude), \(endLocation.coordinate.longitude)"
        let url = "https://maps.googleapis.com/maps/api/directions/json?origin=\(origin)&destination=\(destination)&mode=driving"
        Alamofire.request(url).responseJSON { response in
            print(response.request as Any)
            print(response.response as Any)
            print(response.data as Any)
            print(response.result as Any)
            
            let json = JSON(data: response.data!)
            let routes = json["routes"].arrayValue

            for route in routes
            {
                let routeOverviewPolyline = route["overview_polyline"].dictionary
                let points = routeOverviewPolyline?["points"]?.stringValue
                let path = GMSPath.init(fromEncodedPath: points!)
                let polyline = GMSPolyline.init(path: path)
                polyline.strokeWidth = 3
                polyline.strokeColor = UIColor.green
                //polyline.map = self.GoogleMaps
                
                
                
                
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelSegue(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
