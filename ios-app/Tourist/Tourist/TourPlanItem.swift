//
//  TourPlanItem.swift
//  Tourist
//
//  Created by Tomoya Hayakawa on 2016/11/05.
//  Copyright © 2016年 NG_1609. All rights reserved.
//

import Foundation
import RealmSwift


final class TourPlanItem: Object {

    dynamic var itemId          : String = ""
    dynamic var createdAt       : Date   = Date()
    dynamic var updatedAt       : Date   = Date()
    dynamic var title           : String = ""
    dynamic var startTime       : String = ""
    dynamic var endTime         : String = ""
    dynamic var startWeatherId  : String?
    dynamic var endWeatherId    : String?
    let degree = RealmOptional<Double>()

    var startWeather: Weather? {
        set { startWeatherId = newValue?.rawValue }
        get {
            guard let id = startWeatherId else { return nil }
            return Weather(rawValue: id)
        }
    }

    var endWeather: Weather? {
        set { endWeatherId = newValue?.rawValue }
        get {
            guard let id = endWeatherId else { return nil }
            return Weather(rawValue: id)
        }
    }


    override static func primaryKey() -> String? {
        return "itemId"
    }

    override static func ignoredProperties() -> [String] {
        return ["startWeather", "endWeather"]
    }

}
