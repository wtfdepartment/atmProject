//
//  ViewController.swift
//  BankGit
//
//  Created by Александра on 12.01.23.
//

import UIKit
import GoogleMaps
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: GMSMapView!
    var markers = [GMSMarker]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BelarusBankProvider().bankAdress { atm in
            print(atm)
            atm.forEach { item in
                self.drawMarker(to: CLLocationCoordinate2D(
                    latitude: Double(item.lat!)!,
                    longitude: Double(item.lon!)!)
                )
            }
        }
        
        let locationManger = CLLocationManager()
        locationManger.requestAlwaysAuthorization()
        
        mapView.delegate = self

    }
    
    func drawMarker(to location: CLLocationCoordinate2D) {
        
        let marker = GMSMarker(position: location)
        marker.map  = mapView
        markers.append(marker)
    }


}

extension ViewController: GMSMapViewDelegate {

    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        
        return true
    }
}


//private func drawMarkers(_ atms: [ATMModel]) {
//        atms.forEach { atm in
//            guard let latitude = Double(atm.latitude),
//                  let longitude = Double (atm.longitude)
//            else { return }
//
//            let marker = GMSMarker(position: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
//            marker.title = "Банкомат #\(atm.id)"
//            marker.snippet = "Адрес: \(atm.addressType) \(atm.address), \(atm.house)\nВалюты: \(atm.currency)\nCash-In: \(atm.isCashIn)\nВремя работы: \(atm.workTime)"
//            marker.icon = GMSMarker.markerImage(with: .green)
//            marker.map = mapView
//            markers.append(marker)
//        }

//private func drawMarker() {
//        atmArr.enumerated().forEach { index, atm in
//                let marker =
//                GMSMarker(position: CLLocationCoordinate2D(
//                    latitude: Double(atm.latitude) ?? 0.0,
//                    longitude: Double(atm.longitude) ?? 0.0))
//                marker.userData = atm
//
//            if atm.atmError == "да" {
//                marker.icon = GMSMarker.markerImage(with: UIColor.red)
//            } else {
//                marker.icon = GMSMarker.markerImage(with: UIColor.green)
//            }
//                marker.map = mapView
//                markers.append(marker)
//            }
//
//    }
