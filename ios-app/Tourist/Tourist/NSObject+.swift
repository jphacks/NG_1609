//
//  NSObject+.swift
//  Tourist
//
//  Created by Tomoya Hayakawa on 2016/11/05.
//  Copyright © 2016年 NG_1609. All rights reserved.
//

import Foundation


extension NSObject {

    class var className: String {
        return String(describing: self)
    }

    var className: String {
        return type(of: self).className
    }

}
