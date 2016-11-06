//
//  TouristSpotCell.swift
//  Tourist
//
//  Created by Tomoya Hayakawa on 2016/11/04.
//  Copyright © 2016年 NG_1609. All rights reserved.
//

import UIKit


final class TouristSpotCell: UICollectionViewCell, NibReusableCell {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var loveButton: UIButton!
    @IBOutlet private weak var starButton: UIButton!

    private static let descriptionViewHeight = CGFloat(50.0)
    static let identifier = "TouristSpotCell"


    override func awakeFromNib() {
        super.awakeFromNib()

        setCornerRadus(radius: 5.0)
    }

//    func setupCell(withSpot spot: TouristSpot) {
//    }

    static func viewHeight(withWidth width: CGFloat) -> CGFloat {
        return width + descriptionViewHeight
    }

    private func setCornerRadus(radius: CGFloat) {
        layer.cornerRadius = radius
        clipsToBounds = true
    }

}
