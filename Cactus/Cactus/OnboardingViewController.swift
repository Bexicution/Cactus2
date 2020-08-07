//
//  OnboardingViewController.swift
//  Cactus
//
//  Created by Mac on 8/4/20.
//  Copyright © 2020 Bex. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {

//    @IBOutlet var TappedNextButtonx: UIButton!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        TappedNextButtonx.layer.cornerRadius = 14
//        TappedNextButtonx.layer.masksToBounds = true
//    }
//
//    func TappedButton(sender: UIButton!) {
//        performSegue(withIdentifier: "showSession", sender: nil)
//    }
    
    @IBOutlet var TappedButton: UIButton!
    override func viewDidLoad() {
            super.viewDidLoad()
            TappedButton.layer.cornerRadius = 14
            TappedButton.layer.masksToBounds = true
    }
    @IBAction func TappedButtonx() {
        performSegue(withIdentifier: "showSession", sender: nil)
           
    }
}
