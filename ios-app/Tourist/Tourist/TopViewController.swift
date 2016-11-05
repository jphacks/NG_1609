//
//  TopViewController.swift
//  Tourist
//
//  Created by Tomoya Hayakawa on 2016/11/04.
//  Copyright © 2016年 NG_1609. All rights reserved.
//

import UIKit


final class TopViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.register(withNibClass: TouristSpotCell.self)
    }


    // MARK: - UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withClass: TouristSpotCell.self, indexPath: indexPath)
        return cell
    }

}


// MARK: - :UICollectionViewDelegateFlowLayout

extension TopViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let space = CGFloat(12.0)
        let width = (view.frame.width - space * 3.0) / 2.0
        let height = TouristSpotCell.viewHeight(withWidth: width)
        return CGSize(width: width, height: height)
    }

}
