//
//  MapTestViewController.swift
//  Tourist
//
//  Created by Tomoya Hayakawa on 2016/11/03.
//  Copyright © 2016年 NG_1609. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import GooglePlacePicker


private struct Coordinate {
    static let TokyoTower = CLLocationCoordinate2DMake(35.6585805,139.7454329)
}

final class MapTestViewController: UIViewController {

    private var placesClient: GMSPlacesClient?

    private let mapView: GMSMapView = {
        GMSServices.provideAPIKey(Constants.GoogleMapAPIKey)

        let camera = GMSCameraPosition.camera(withTarget: Coordinate.TokyoTower, zoom: 16)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        mapView.settings.compassButton = true
        mapView.settings.myLocationButton = true

        let marker = GMSMarker()
        marker.position = camera.target
        marker.snippet = "Hello World"
        marker.appearAnimation = kGMSMarkerAnimationPop
        marker.map = mapView

        return mapView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

//        mapView.delegate = self
        view = mapView
    }

    private func addPlacePicker() {
        let center = CLLocationCoordinate2DMake(51.5108396, -0.0922251)
        let northEast = CLLocationCoordinate2DMake(center.latitude + 0.001, center.longitude + 0.001)
        let southWest = CLLocationCoordinate2DMake(center.latitude - 0.001, center.longitude - 0.001)
        let viewport = GMSCoordinateBounds(coordinate: northEast, coordinate: southWest)
        let config = GMSPlacePickerConfig(viewport: viewport)
        let placePicker = GMSPlacePicker(config: config)

        placePicker.pickPlace(callback: { place, error in
            if let error = error {
                print("Pick Place error: \(error.localizedDescription)")
                return
            }

            if let place = place {
                print("Place name \(place.name)")
                print("Place address \(place.formattedAddress)")
                print("Place attributions \(place.attributions)")
            } else {
                print("No place selected")
            }
        })
    }

}


// MARK: - :GMSMapViewDelegate

extension MapTestViewController: GMSMapViewDelegate {

    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        marker
        return true
    }
}
