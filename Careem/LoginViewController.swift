//
//  LoginViewController.swift
//  Careem
//
//  Created by Rabiya  Khalid on 29/04/2017.
//  Copyright © 2017 Rabiya  Khalid. All rights reserved.
//
import MapKit
import CoreLocation
import UIKit
import GooglePlaces
import GoogleMaps
import Alamofire
import SwiftyJSON

enum Location1 {
    case startLocation
    case destinationLocation
}

class LoginViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {
    /**
     * Called when a place has been selected from the available autocomplete predictions.
     * @param viewController The |GMSAutocompleteViewController| that generated the event.
     * @param place The |GMSPlace| that was returned.
     */
    
    @IBOutlet weak var DestinationBtn: RoundedButton!
    
    var locationManager = CLLocationManager()
    var locationSelected = Location1.startLocation
    
    var locationStart = CLLocation()
    var locationEnd = CLLocation()
    var bookingdetails = "http://qa-interface.careem-engineering.com/v1/products"
    var bookingUpdate = "http://qa-interface.careem-engineering.com/v1/bookings/{booking_id}"

    var BookingURL = "http://qa-interface.careem-engineering.com/v1/bookings"
    let bookingDetails: [String: Any] = ["product_id": "product1",
                                         "pickup_details": ["latitude": 24.8673 , "longitude": 67.0248] ,
                                         "dropoff_details": ["latitude": 24.8673 , "longitude": 67.0248],
                                         "pickup_time": 20 ,
                                         "customer_details" : ["uuid" : "1234" , "name": "Saad" , "email": "saad.ullah95@hotmail.com", "phone_number":"+923442686009"]
    ]
    let bookingDetailsNew: [String: Any] =  ["product_id":228,"pickup_details":["latitude":24.8673,"longitude":67.0248,"nickname":"kk"],"dropoff_details":["latitude":24.8673,"longitude":67.0248,"nickname":"SS"],"driver_notes":"no note","booking_type":"NOW","promo_code":"","customer_details":["uuid":"1434","name":"John","email":"jjhon@hotmail.com","phone_number":"+923331234567"],"surge_confirmation_id":""]
    //let bookingFinal: [String: Any] = ["pickup_details": ["latitude":               24.8673 , "longitude": 67.0248]
    
    let headers: HTTPHeaders = [
        "Authorization": "crl54u6cj8f3a7hkc304359lhg",
        "Content-Type": "application/json"
    ]

    var bookingID: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(
            bookingdetails,
            parameters: ["latitude": 24.8673 , "longitude": 67.0248],
            headers: ["Authorization": "crl54u6cj8f3a7hkc304359lhg"]
            
            )
            .responseJSON { response in
                
                //print("Hello11 : \(response)")
                /*switch(response.result) {
                case .success(_):*/
                if(response.result != nil){
                    if response.result.value != nil{
                        
                        
                        let value = JSON(response.result.value!)
                        print("Data From API: ",value)
                        let products = value["products"].arrayObject
                        
                        let p = products![0]
                        print("This is new data :- \(p)")
                        
                        let carType = CarType(id: 1234, data: JSON(p)  )
                        
                        print("productValue: \(carType.min_time_to_book)")
                        
                        let pDetails = JSON(carType.priceDetail)
                        let priceDetails = PriceDetail(id: 12345, data: JSON(pDetails))
                        print("Pdetails: \(priceDetails.currency_code)")
                    }
                    
                    else{
                //case .failure(_):
                    print("Hello2", response.result.error)
                   // break
                    }
                }

        }
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startMonitoringSignificantLocationChanges()

       
       
    }
    
    @IBAction func openStartLocation(_ sender: Any) {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        present(autocompleteController, animated: true, completion: nil)
    }
    
    
    @IBAction func RideNow(_ sender: Any) {
        Alamofire.request(BookingURL,
                          method: .post,
                          parameters: bookingDetailsNew,
                          encoding: JSONEncoding.default, headers: [
                "Authorization": "crl54u6cj8f3a7hkc304359lhg",
                "Content-Type":"application/json"
            ]
            ).responseJSON {
                response in
                print(NSString(data: (response.request?.httpBody)!,encoding: String.Encoding.utf8.rawValue))
                switch response.result {
                case .success:
                    print("response:",response)
                    
                    break
                case .failure(let error):
                    
                    print("Error: ", error)
                }
        }
        self.performSegue(withIdentifier: "rider", sender: self)

    }
    
    
    
}




extension LoginViewController: GMSAutocompleteViewControllerDelegate {
    
    // Handle the user's selection.
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        print("Place name: \(place.name)")
            DestinationBtn.setTitle(place.name, for:.normal)
        print("Place address: \(place.formattedAddress)")
        print("Place attributions: \(place.attributions)")
        dismiss(animated: true, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    // User canceled the operation.
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    
    
    
    
    
}
