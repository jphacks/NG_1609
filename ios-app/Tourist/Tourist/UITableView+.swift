//
//  UITableView+.swift
//  Tourist
//
//  Created by Tomoya Hayakawa on 2016/11/05.
//  Copyright © 2016年 NG_1609. All rights reserved.
//

import UIKit

extension UITableView {

    func register<T: UITableViewCell>(cellClass: T.Type) {
        let className = cellClass.className
        let nib = UINib(nibName: className, bundle: nil)
        register(nib, forCellReuseIdentifier: className)
    }

    func register<T: UITableViewCell>(cellClasses: [T.Type]) {
        cellClasses.forEach { register(cellClass: $0) }
    }

    func dequeueReusableCell<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: type.className, for: indexPath) as! T
    }

}
