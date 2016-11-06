//
//  LocationsResponse.swift
//  Tourist
//
//  Created by Tomoya Hayakawa on 2016/11/06.
//  Copyright © 2016年 NG_1609. All rights reserved.
//

import Foundation
import Himotoki


struct LocationsResponse {

    var spotId      : Int    = 0
    var regionId    : Int    = 0
    var name        : String = ""
    var address     : String = ""
    var detail      : String = ""
    var imageUrl    : String = ""
    var requiredTime: Double = 0.0
    var latitude    : String = ""
    var longtitude  : String = ""
    var bearing     : Int    = 0

    static func parse(ofSpot spot: TourSpot) -> LocationsResponse {
        var location = LocationsResponse()
        location.spotId = spot.spotId
        location.regionId = spot.regionId
        location.name = spot.name
        location.address = spot.address
        location.detail = spot.detailDescription
        location.imageUrl = spot.imageUrl
        location.requiredTime = spot.requiredTime
        location.latitude = spot.latitude
        location.longtitude = spot.longtitude
        location.bearing = -1
        return location
    }

}


// MARK: - :Decodable

extension LocationsResponse: Decodable {

    static func decode(_ e: Extractor) throws -> LocationsResponse {
        return try LocationsResponse(
            spotId      : e <| "id",
            regionId    : e <| "region_id",
            name        : e <| "name",
            address     : e <| "address",
            detail      : e <| "description",
            imageUrl    : e <| "imageUrl",
            requiredTime: e <| "requiredTime",
            latitude    : e <| "latitude",
            longtitude  : e <| "longitude",
            bearing     : e <| "bearing"
            )
    }

}
