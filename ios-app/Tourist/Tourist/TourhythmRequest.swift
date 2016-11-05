//
//  Location.swift
//  Tourist
//
//  Created by Tomoya Hayakawa on 2016/11/05.
//  Copyright © 2016年 NG_1609. All rights reserved.
//

import Foundation
import APIKit
import Himotoki


protocol TourhythmRequest: Request {
}

extension TourhythmRequest {
    var baseURL: URL {
        return URL(string: "http://ng1609vm4275.cloudapp.net")!
    }
}


struct GetRegionsRequest: TourhythmRequest {

    typealias Response = [Region]

    var method: HTTPMethod {
        return .get
    }

    var path: String {
        return "/api/regions"
    }

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> [Region] {
        return try decodeArray(object)
    }

}


struct GetLocationsRequest: TourhythmRequest {

    typealias Response = [TourSpot]

    var method: HTTPMethod {
        return .get
    }

    var path: String {
        return "/api/locations"
    }

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> [TourSpot] {
        return try decodeArray(object)
    }

}


struct GetRegionLocationsRequest: TourhythmRequest {

    typealias Response = [TourSpot]

    var method: HTTPMethod {
        return .get
    }

    var path: String {
        return "/api/regionLocations"
    }

    var queryParameters: [String : Any]? {
        return ["region_id" : regionId]
    }

    let regionId: Int

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> [TourSpot] {
        return try decodeArray(object)
    }

}
