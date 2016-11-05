//
//  TourPlan.swift
//  Tourist
//
//  Created by Tomoya Hayakawa on 2016/11/05.
//  Copyright © 2016年 NG_1609. All rights reserved.
//

import Foundation
import RealmSwift


final class TourPlan: Object {

    dynamic var planId      : Int    = 0
    dynamic var createdAt   : Date   = Date()
    dynamic var title       : String = ""
    dynamic var date        : String = ""
    dynamic var startTime   : String = ""
    dynamic var endTime     : String = ""
    let items = List<TourPlanItem>()


    override static func primaryKey() -> String? {
        return "planId"
    }

}
