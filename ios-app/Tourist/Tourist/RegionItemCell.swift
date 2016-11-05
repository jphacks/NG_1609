//
//  RegionItemCell.swift
//  Tourist
//
//  Created by Tomoya Hayakawa on 2016/11/05.
//  Copyright © 2016年 NG_1609. All rights reserved.
//

import UIKit

class RegionItemCell: UICollectionViewCell, NibReusableCell {

    @IBOutlet private weak var backgroundImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!


    func setupCell(name: String, image: UIImage) {
        nameLabel.text = name
        backgroundImageView.image = image
    }

}
