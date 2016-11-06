//
//  MapLine.swift
//  Tourist
//
//  Created by Tomoki Nishinaka on 2016/11/06.
//  Copyright © 2016年 NG_1609. All rights reserved.
//

import Foundation
import RealmSwift


final class MapLine: Object {

    dynamic var startLatitude   : String = ""
    dynamic var startLongtitude : String = ""
    dynamic var endLatitude     : String = ""
    dynamic var endLongtitude   : String = ""

}
