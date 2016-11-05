//
//  ReusableCell.swift
//  Tourist
//
//  Created by Tomoya Hayakawa on 2016/11/04.
//  Copyright © 2016年 NG_1609. All rights reserved.
//

import UIKit


protocol ReusableCell {
    static var identifier: String { get }
}

extension ReusableCell where Self: UICollectionViewCell {
    var reuseIdentifier: String? {
        return Self.identifier
    }
}

extension ReusableCell where Self: UITableViewCell {
    var reuseIdentifier: String? {
        return Self.identifier
    }
}


protocol NibReusableCell: ReusableCell {
}

extension NibReusableCell where Self: UICollectionViewCell {
    static var identifier: String {
        return Self.className
    }
}

extension NibReusableCell where Self: UITableViewCell {
    static var identifier: String {
        return Self.className
    }
}


extension UICollectionView {

    func register<T: UICollectionViewCell>(withClass cellClass: T.Type) where T: ReusableCell {
        register(cellClass, forCellWithReuseIdentifier: cellClass.identifier)
    }

    func register<T: UICollectionViewCell>(withNibClass cellClass: T.Type) where T: NibReusableCell {
        let className = cellClass.className
        register(UINib(nibName: className, bundle: nil), forCellWithReuseIdentifier: className)
    }

    func dequeueReusableCell<T: UICollectionViewCell>(withClass cellClass: T.Type, indexPath: IndexPath) -> T where T: ReusableCell {
        return dequeueReusableCell(withReuseIdentifier: cellClass.identifier, for: indexPath) as! T
    }

}

extension UITableView {

    func register<T: UITableViewCell>(withClass cellClass: T.Type) where T: ReusableCell {
        register(cellClass, forCellReuseIdentifier: cellClass.identifier)
    }

    func register<T: UITableViewCell>(withNibClass cellClass: T.Type) where T: NibReusableCell {
        let className = cellClass.className
        register(UINib(nibName: className, bundle: nil), forCellReuseIdentifier: className)
    }

    func dequeueReusableCell<T: UITableViewCell>(withClass cellClass: T.Type, indexPath: IndexPath) -> T where T: ReusableCell {
        return dequeueReusableCell(withIdentifier: cellClass.identifier, for: indexPath) as! T
    }

}
