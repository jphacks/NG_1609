//
//  RegionListViewController.swift
//  Tourist
//
//  Created by Tomoya Hayakawa on 2016/11/05.
//  Copyright © 2016年 NG_1609. All rights reserved.
//

import UIKit


final class RegionListViewController: UICollectionViewController {

    let regions = [
        ("Tokyo", #imageLiteral(resourceName: "tokyo")),
        ("Kyoto", #imageLiteral(resourceName: "kyoto"))
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.register(withNibClass: RegionItemCell.self)
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
        cell.setupCell(name: region.0, image: region.1)
        return cell
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
