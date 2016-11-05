//
//  Region.swift
//  Tourist
//
//  Created by Tomoya Hayakawa on 2016/11/05.
//  Copyright © 2016年 NG_1609. All rights reserved.
//

import Foundation
import RealmSwift


final class Region: Object {

    dynamic var regionId    : Int = 0
    dynamic var name        : String = ""
    dynamic var imageUrl    : String = ""


    convenience init(regionId: Int, name: String, imageUrl: String) {
        self.init()

        self.regionId = regionId
        self.name = name
        self.imageUrl = imageUrl
    }

    func saveDefaultValue() {
        let regions = [
            Region(regionId: 0, name: "Tokyo", imageUrl: ""),
            Region(regionId: 1, name: "Kyoto", imageUrl: ""),
            Region(regionId: 2, name: "Okinawa", imageUrl: ""),
        ]

        do {
            let realm = try Realm()
            realm.add(regions)
        } catch {
            // TODO: Error
            print(error)
        }
    }

}
