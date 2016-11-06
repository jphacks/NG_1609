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
    dynamic var address             : String = ""
    dynamic var detailDescription   : String = ""
    dynamic var imageUrl            : String = ""
    dynamic var requiredTime        : Double = 0.0
    dynamic var requiredTimeSeconds : Int    = 0
    dynamic var latitude            : String = ""
    dynamic var longtitude          : String = ""


    convenience init(spotId: Int, regionId: Int, name: String, address: String, latitude: String, longtitude: String, description: String, imageUrl: String, requiredTime: Double) {
        self.init()

        self.spotId = spotId
        self.regionId = regionId
        self.name = name
        self.address = address
        self.latitude = latitude
        self.longtitude = longtitude
        self.detailDescription = description
        self.imageUrl = imageUrl
        self.requiredTime = requiredTime
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
            regionId    : e <| "region_id",
            name        : e <| "name",
            address     : e <| "address",
            latitude    : e <| "latitude",
            longtitude  : e <| "longitude",
            description : e <| "description",
            imageUrl    : e <| "imageUrl",
            requiredTime: e <| "requiredTime"
            )
    }

}
