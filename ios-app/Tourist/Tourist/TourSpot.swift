//
//  TourSpot.swift
//  Tourist
//
//  Created by Tomoya Hayakawa on 2016/11/05.
//  Copyright © 2016年 NG_1609. All rights reserved.
//

import Foundation
import RealmSwift
import Himotoki


final class TourSpot: Object {

    dynamic var spotId              : Int    = 0
    dynamic var regionId            : Int    = 0
    dynamic var name                : String = ""
    dynamic var detailDescription   : String = ""
    dynamic var imageUrl            : String = ""
    dynamic var kind                : String = ""
    dynamic var requiredTime        : String = ""
    dynamic var requiredTimeSeconds : Int    = 0
    dynamic var goodCount           : Int    = 0
    dynamic var badCount            : Int    = 0
    dynamic var latitude            : Double = 0.0
    dynamic var longtitude          : Double = 0.0

    convenience init(spotId: Int, latitude: Double, longtitude: Double, description: String) {
        self.init()

        self.spotId = spotId
        self.latitude = latitude
        self.longtitude = longtitude
    }

    override static func primaryKey() -> String? {
        return "spotId"
    }

}


// MARK: - :Decodable

extension TourSpot: Decodable {

    static func decode(_ e: Extractor) throws -> TourSpot {
        return try TourSpot(
            spotId      : e <| "id",
            latitude    : e <| "latitude",
            longtitude  : e <| "longitude",
            description : e <| "description"
            )
    }

}
