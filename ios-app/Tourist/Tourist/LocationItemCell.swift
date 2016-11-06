//
//  LocationItemCell.swift
//  Tourist
//
//  Created by Tomoya Hayakawa on 2016/11/06.
//  Copyright © 2016年 NG_1609. All rights reserved.
//

import UIKit
import RealmSwift


final class LocationItemCell: UICollectionViewCell, NibReusableCell {

    @IBOutlet private weak var backView: UIView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var positionLabel: UILabel!
    @IBOutlet private weak var distanceLabel: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()

        // shadow
        backView.clipsToBounds = false
        backView.layer.masksToBounds = false
        backView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        backView.layer.shadowOpacity = 0.2
        backView.layer.shadowColor = UIColor.black.cgColor
        backView.layer.shadowRadius = 4.0
    }

    func updateCell(spotId: Int) {
        let realm = try! Realm()
        guard let spot = realm.object(ofType: TourSpot.self, forPrimaryKey: spotId) else { return }
        imageView.kf.setImage(with: URL(string: spot.imageUrl))
        titleLabel.text = spot.name
        positionLabel.text = "Kyoto, hogehoge"
        distanceLabel.text = " 0.5 km"
    }

}
