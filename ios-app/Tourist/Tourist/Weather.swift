//
//  Weather.swift
//  Tourist
//
//  Created by Tomoya Hayakawa on 2016/11/05.
//  Copyright © 2016年 NG_1609. All rights reserved.
//

import UIKit


enum Weather: String {
    case sun, cloud, rain

    var image: UIImage {
        switch self {
        case .sun:   return #imageLiteral(resourceName: "sun")
        case .cloud: return #imageLiteral(resourceName: "cloud")
        case .rain:  return #imageLiteral(resourceName: "rain")
        }
    }
}
