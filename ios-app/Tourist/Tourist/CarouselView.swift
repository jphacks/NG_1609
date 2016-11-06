//
//  CarouselView.swift
//  Tourist
//
//  Created by Tomoki Nishinaka on 2016/11/06.
//  Copyright © 2016年 NG_1609. All rights reserved.
//

import UIKit
import Kingfisher

@IBDesignable
class CarouselView: TGLParallaxCarouselItem {

    @IBOutlet private weak var backgroundImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!

    // MARK: - init
    convenience init(frame: CGRect, name: String, url: String) {
        self.init(frame: frame)
        print(name)
        print(url)
        nameLabel.text = name
        backgroundImageView.kf.setImage(with: URL(string: url))
    }

}
