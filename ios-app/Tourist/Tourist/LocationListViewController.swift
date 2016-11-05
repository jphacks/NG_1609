//
//  LocationListViewController.swift
//  Tourist
//
//  Created by Tomoya Hayakawa on 2016/11/06.
//  Copyright © 2016年 NG_1609. All rights reserved.
//

import UIKit
import APIKit
import RealmSwift


final class LocationListViewController: UICollectionViewController {

    private var locations: Results<TourSpot>!
    private var notification: NotificationToken?
    var regionId: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.register(withNibClass: RegionItemCell.self)

        guard let realm = try? Realm() else { fatalError() }
        locations = realm.objects(TourSpot.self).filter("regionId == %@", regionId)
        notification = locations.addNotificationBlock { [weak self] _ in
            self?.collectionView?.reloadData()
        }

        if locations.isEmpty {
            Session.send(GetRegionLocationsRequest(regionId: regionId)) { result in
                switch result {
                case .success(let locations):
                    do {
                        let realm = try Realm()
                        try realm.write {
                            realm.add(locations)
                        }
                    } catch {
                        print(error)
                    }

                case .failure(let error):
                    print(error)
                }
            }
        }
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 { return 1 }
        return locations.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            return collectionView.dequeueReusableCell(withReuseIdentifier: "RegionTitleCell", for: indexPath)
        }

        let cell = collectionView.dequeueReusableCell(withClass: RegionItemCell.self, indexPath: indexPath)
        let location = locations[indexPath.row]
        cell.setupCell(name: location.name, imageUrl: location.imageUrl)
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard indexPath.section != 0 else { return }
        let region = locations[indexPath.row]
        print(region)
    }

    deinit {
        notification?.stop()
    }

}


// MARK: - :UICollectionViewDelegateFlowLayout

extension LocationListViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: view.frame.width - 12.0 * 2.0, height: 100.0)
        }
        return CGSize(width: view.frame.width - 12.0 * 2.0, height: 150.0)
    }

}
