//
//  Location.swift
//  Tourist
//
//  Created by Tomoya Hayakawa on 2016/11/05.
//  Copyright © 2016年 NG_1609. All rights reserved.
//

import Foundation
import APIKit



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
        return
    }

}
