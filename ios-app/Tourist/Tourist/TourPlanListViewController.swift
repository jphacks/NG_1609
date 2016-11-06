//
//  TourPlanListViewController.swift
//  Tourist
//
//  Created by Tomoya Hayakawa on 2016/11/05.
//  Copyright © 2016年 NG_1609. All rights reserved.
//

import UIKit
import RealmSwift


final class TourPlanListViewController: UITableViewController {

        fileprivate var tourPlan: TourPlan!
        var planId: Int = 0

        override func viewDidLoad() {
            super.viewDidLoad()

            tableView.register(withNibClass: TourPlanCell.self)

            guard let realm = try? Realm() else { fatalError() }
            tourPlan = realm.object(ofType: TourPlan.self, forPrimaryKey: planId)

        }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10 // tourPlan.items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: TourPlanCell.self, indexPath: indexPath)
        switch indexPath.row {
        case 0:  cell.setLine(type: .top)
        case 9:  cell.setLine(type: .last)
        default: cell.setLine(type: .center)
        }
//        cell.updateCell(title: tourPlan.items[indexPath.row].title)
        cell.setWeather(startWhether: .sun, endWeather: .cloud, degree: Double(arc4random() % 20))

        return cell
    }


    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

}
