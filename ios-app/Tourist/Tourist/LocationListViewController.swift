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


final class LocationListViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!

    fileprivate var locations: Results<TourSpot>!
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

//        guard let region = realm.object(ofType: TourSpot.self, forPrimaryKey: regionId) else { return }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
    }

    deinit {
        notification?.stop()
    }

}


// MARK: - :UICollectionViewDataSource, Deletate

extension LocationListViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 { return 1 }
        return locations.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            return collectionView.dequeueReusableCell(withReuseIdentifier: "RegionTitleCell", for: indexPath)
        }

        let cell = collectionView.dequeueReusableCell(withClass: RegionItemCell.self, indexPath: indexPath)
        let location = locations[indexPath.row]
        cell.setupCell(name: location.name, imageUrl: location.imageUrl)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard indexPath.section != 0 else { return }
        let location = locations[indexPath.row]
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        print(kind, indexPath)

        if kind == UICollectionElementKindSectionHeader,
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "RegionLocationHeader", for: indexPath) as? RegionLocationHeaderView {
            view.setRegion(regionId: regionId)
            return view
        }

        return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "LocationFooter", for: indexPath)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: view.frame.width, height: 200)
        }
        return CGSize(width: 0, height: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: 0, height: 0)
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
