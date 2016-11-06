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
import Result


protocol LocationBackHander: class {
    func didBackHander(spot: LocationsResponse)
}


final class LocationListViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!

    fileprivate var locations = [LocationsResponse]()

    weak var delegate: LocationBackHander?
    var regionId: Int = 0
    var latitude: Double?
    var longtutude: Double?


    override func viewDidLoad() {
        super.viewDidLoad()

        let backBarItem = UIBarButtonItem(image: #imageLiteral(resourceName: "back"), style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarItem

        collectionView?.register(withNibClass: LocationItemCell.self)

        if let lat = latitude, let lng = longtutude {
            let request = GetNearbyLocationsRequest(latitude: lat, longthtude: lng)
            Session.send(request) { [weak self] result in
                switch result {
                case .success(let locations):
                    self?.locations.append(contentsOf: locations)
                    self?.collectionView.reloadData()

                case .failure(let error):
                    print(error)
                }
            }
        } else {
            let request = GetRegionLocationsRequest(regionId: regionId)
            Session.send(request, handler: handleResponse)
        }
    }

    private func handleResponse(result: Result<[TourSpot], SessionTaskError>) -> Void {
        switch result {
        case .success(let locations):
            self.locations = locations.map { LocationsResponse.parse(ofSpot: $0) }
            collectionView.reloadData()

        case .failure(let error):
            print(error)
        }
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

        let cell = collectionView.dequeueReusableCell(withClass: LocationItemCell.self, indexPath: indexPath)
        let location = locations[indexPath.row]
        cell.updateCell(spot: location)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard indexPath.section != 0 else { return }
        let location = locations[indexPath.row]
        print(location)
        delegate?.didBackHander(spot: location)
        _ = navigationController?.popViewController(animated: true)
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
        return CGSize(width: view.frame.width - 12.0 * 2.0, height: 180.0)
    }

}
