//
//  RegionListViewController.swift
//  Tourist
//
//  Created by Tomoya Hayakawa on 2016/11/05.
//  Copyright © 2016年 NG_1609. All rights reserved.
//

import UIKit
import APIKit
import RealmSwift


final class RegionListViewController: UICollectionViewController {

    private var regions: Results<Region>!
    private var notification: NotificationToken?

    override func viewDidLoad() {
        super.viewDidLoad()

        let backBarItem = UIBarButtonItem(image: #imageLiteral(resourceName: "back"), style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarItem
        collectionView?.register(withNibClass: RegionItemCell.self)

        guard let realm = try? Realm() else { fatalError() }
        regions = realm.objects(Region.self)
        notification = regions.addNotificationBlock { [weak self] _ in
            self?.collectionView?.reloadData()
        }

        if regions.isEmpty {
            Session.send(GetRegionsRequest()) { result in
                switch result {
                case .success(let regions):
                    do {
                        let realm = try Realm()
                        try realm.write {
                            realm.add(regions)
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
        return regions.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            return collectionView.dequeueReusableCell(withReuseIdentifier: "RegionTitleCell", for: indexPath)
        }

        let cell = collectionView.dequeueReusableCell(withClass: RegionItemCell.self, indexPath: indexPath)
        let region = regions[indexPath.row]
        cell.setupCell(name: region.name, imageUrl: region.imageUrl)
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard indexPath.section != 0 else { return }
        let region = regions[indexPath.row]
        let vc = LocationListViewController.instantiate()
        vc.regionId = region.regionId
        navigationController?.pushViewController(vc, animated: true)
    }

    deinit {
        notification?.stop()
    }

}


// MARK: - :UICollectionViewDelegateFlowLayout

extension RegionListViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: view.frame.width - 12.0 * 2.0, height: 100.0)
        }
        return CGSize(width: view.frame.width - 12.0 * 2.0, height: 150.0)
    }

}
