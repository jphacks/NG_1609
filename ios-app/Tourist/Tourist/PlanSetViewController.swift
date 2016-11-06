//
//  PlanSetViewController.swift
//  Tourist
//
//  Created by Tomoya Hayakawa on 2016/11/06.
//  Copyright © 2016年 NG_1609. All rights reserved.
//

import UIKit
import APIKit
import RealmSwift


final class PlanSetViewController: UIViewController {

    @IBOutlet fileprivate weak var collectionView: UICollectionView!

    fileprivate var locations = [LocationsResponse]()
    fileprivate let tourItems = List<TourPlanItem>()
    var regionId: Int = 0


    override func viewDidLoad() {
        super.viewDidLoad()

        let backBarItem = UIBarButtonItem(image: #imageLiteral(resourceName: "back"), style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarItem

        collectionView?.register(withNibClass: LocationItemCell.self)
    }

    private func clac(locations: [LocationsResponse]) {

    }

}


// MARK: - :UICollectionViewDataSource, Deletate

extension PlanSetViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 1 {
            return locations.count
        } else if section == 3 {
            return locations.isEmpty ? 0 : 1
        }
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            return collectionView.dequeueReusableCell(withReuseIdentifier: "StartCell", for: indexPath)
        } else if indexPath.section == 2 {
            return collectionView.dequeueReusableCell(withReuseIdentifier: "PlusCell", for: indexPath)
        } else if indexPath.section == 3 {
            return collectionView.dequeueReusableCell(withReuseIdentifier: "DecideCell", for: indexPath)
        }

        let cell = collectionView.dequeueReusableCell(withClass: LocationItemCell.self, indexPath: indexPath)
        let location = locations[indexPath.row]
        cell.updateCell(spot: location)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
        } else if indexPath.section == 2 {
            let vc = LocationListViewController.instantiate()
            vc.delegate = self
            vc.regionId = regionId
            if !locations.isEmpty {
                let location = locations.last!
                vc.latitude = Double(location.latitude)
                vc.longtutude = Double(location.longtitude)
            }
            navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.section == 3 {
            let realm = try! Realm()
            let plan = TourPlan()
            plan.planId = realm.objects(TourPlan.self).count
            plan.title = realm.object(ofType: Region.self, forPrimaryKey: regionId)?.name ?? ""
            plan.items.append(objectsIn: tourItems)
        } else {
            let location = locations[indexPath.row]
            print(location)
        }
    }

}


// MARK: - :UICollectionViewDelegateFlowLayout

extension PlanSetViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 || indexPath.section == 2 {
            return CGSize(width: view.frame.width - 12.0 * 2.0, height: 100.0)
        }
        return CGSize(width: view.frame.width - 12.0 * 2.0, height: 180.0)
    }

}


// MARK: - :LocationBackHander

extension PlanSetViewController: LocationBackHander {

    func didBackHander(spot: LocationsResponse) {
        locations.append(spot)
        collectionView.reloadData()
    }

}
