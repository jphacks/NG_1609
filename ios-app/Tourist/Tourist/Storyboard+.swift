//
//  Storyboard+.swift
//  Tourist
//
//  Created by Tomoya Hayakawa on 2016/11/06.
//  Copyright © 2016年 NG_1609. All rights reserved.
//

import UIKit


protocol StoryBoardInstantiatable {}
extension UIViewController: StoryBoardInstantiatable {}

extension StoryBoardInstantiatable where Self: UIViewController {

    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: className, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }

    static func instantiate(withStoryboard storyboard: String) -> Self {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }

    static func storyboard() -> UIStoryboard {
        return UIStoryboard(name: className, bundle: nil)
    }

}
