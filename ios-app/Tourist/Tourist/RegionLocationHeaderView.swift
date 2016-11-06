//
//  RegionLocationHeaderView.swift
//  Tourist
//
//  Created by Tomoya Hayakawa on 2016/11/06.
//  Copyright © 2016年 NG_1609. All rights reserved.
//

import UIKit
import RealmSwift


final class RegionLocationHeaderView: UICollectionReusableView {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!


    func setRegion(regionId: Int) {
        guard
            let realm = try? Realm(),
            let region = realm.object(ofType: Region.self, forPrimaryKey: regionId) else {
                return
        }

        imageView.kf.setImage(with: URL(string: region.imageUrl))
        titleLabel.text = region.name
    }

}
