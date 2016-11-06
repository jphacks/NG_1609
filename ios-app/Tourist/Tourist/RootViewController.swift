//
//  RootViewController.swift
//  Tourist
//
//  Created by Tomoki Nishinaka on 2016/11/06.
//  Copyright © 2016年 NG_1609. All rights reserved.
//

import UIKit
import APIKit
import RealmSwift
import SwiftGifOrigin

class RootViewController: UIViewController {

    @IBOutlet weak var imageview: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        imageview.loadGif(name: "2sec")
    }

    @IBAction func tappedButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "RegionListViewController", bundle: nil)
        let vc = storyboard.instantiateInitialViewController()
        show(vc!, sender: self)
    }

  }
