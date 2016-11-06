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


struct GetNearbyLocationsRequest: TourhythmRequest {

    typealias Response = [LocationsResponse]

    var method: HTTPMethod {
        return .get
    }

    var path: String {
        return "/api/nearbyLocations"
    }

    var queryParameters: [String : Any]? {
        return ["lat": latitude, "lng": longthtude]
    }

    let latitude: Double
    let longthtude: Double

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> [LocationsResponse] {
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


struct GetRoutesRequst: TourhythmRequest {

    typealias Response = String

    var method: HTTPMethod {
        return .post
    }

    var path: String {
        return "/api/getRoutes"
    }

    var bodyParameters: BodyParameters? {
        let geoList = locations.map { ["lat": $0.latitude, "lng": $0.longtitude] }
        return FormURLEncodedBodyParameters(formObject: ["geoList" : geoList])
    }

    let locations: [LocationsResponse]

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> String {
        return ""
    }

}
