//
//  Region.swift
//  Tourist
//
//  Created by Tomoya Hayakawa on 2016/11/05.
//  Copyright © 2016年 NG_1609. All rights reserved.
//

import Foundation
import RealmSwift
import Himotoki


final class Region: Object {

    dynamic var regionId   : Int    = 0
    dynamic var name       : String = ""
    dynamic var imageUrl   : String = ""
    dynamic var createdAt  : String = ""
    dynamic var updatedAt  : String = ""


    convenience init(regionId: Int, name: String, imageUrl: String) {
        self.init()

        self.regionId = regionId
        self.name = name
        self.imageUrl = imageUrl
    }

}


// MARK: - :Decodable

extension Region: Decodable {

    static func decode(_ e: Extractor) throws -> Region {
        return try Region(regionId  : e <| "id",
                          name      : e <| "name",
                          imageUrl  : e <| "imageUrl"
        )
    }

}
