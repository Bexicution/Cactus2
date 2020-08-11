//
//  CactusTabBarController.swift
//  Cactus
//
//  Created by Mac on 8/8/20.
//  Copyright © 2020 Bex. All rights reserved.
//

import UIKit

class CactusTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = UIColor(named: "secondPrimaryColor")
        tabBar.unselectedItemTintColor = UIColor(named: "lightGrey")
    }
   


}
