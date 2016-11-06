//
//  MapViewController.swift
//  Tourist
//
//  Created by Tomoki Nishinaka on 2016/11/06.
//  Copyright © 2016年 NG_1609. All rights reserved.
//

import UIKit
import GoogleMaps
import RealmSwift


final class MapViewController: UIViewController {

    private var googleMap : GMSMapView!

    //初期位置
    private let init_latitude: CLLocationDegrees = 36.5780574
    private let init_longitude: CLLocationDegrees = 136.6486596

    private var spots: Results<TourSpot>!
    private var plan: TourPlan!
    var planId: Int

    override func viewDidLoad() {
        super.viewDidLoad()

        let realm = try! Realm()
        plan = realm.object(ofType: TourPlan.self, forPrimaryKey: planId)
        spots = realm.objects(TourSpot.self)

        let camera = GMSCameraPosition.camera(withLatitude: init_latitude,longitude: init_longitude, zoom: 13)
        googleMap = GMSMapView(frame: CGRect(x:0, y:0, width:self.view.bounds.width, height:self.view.bounds.height))
        googleMap.camera = camera

        makeLine()
        makeSpot()

        self.view.addSubview(googleMap)
        // Do any additional setup after loading the view.
    }

    func makeLine() {
        for line in plan.lines {
            let path = GMSMutablePath()
            path.add(CLLocationCoordinate2DMake(Double(line.startLatitude)!, Double(line.startLongtitude)!))
            path.add(CLLocationCoordinate2DMake(Double(line.endLatitude)!, Double(line.endLongtitude)!))
            let rectangle = GMSPolyline(path: path)
            rectangle .strokeWidth = 2.0
            //rectangle.strokeColor = randomColor()
            rectangle.map = googleMap
        }
    }

    func makeSpot() {
        for spot in spots {
            let position = CLLocationCoordinate2DMake(Double(spot.latitude)!, Double(spot.longtitude)!)
            let marker = GMSMarker(position: position)
            marker.title = //場所の名前
                marker.snippet = //場所の種類orジャンル
                marker.infoWindowAnchor = CGPoint(x: 0.5, y: 0.5)
            marker.icon = UIImage(named: "") // 場所の画像
            marker.map = mapView
        }
    }

    func randomColor() -> UIColor {

        let total: Int = Int (arc4random() % 99)

        srand48(total * 200)
        let r = CGFloat(drand48())

        srand48(total)
        let g = CGFloat(drand48())

        srand48(total / 200)
        let b = CGFloat(drand48())

        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
