//
//  RootViewController.swift
//  Tourist
//
//  Created by Tomoki Nishinaka on 2016/11/06.
//  Copyright © 2016年 NG_1609. All rights reserved.
//

import UIKit
import SwiftGifOrigin

class RootViewController: UIViewController  {

    @IBOutlet var imageview: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
       imageview.loadGif(name: "2sec")
    }

  }
