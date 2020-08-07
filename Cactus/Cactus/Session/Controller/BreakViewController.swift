//
//  BreakViewController.swift
//  Cactus
//
//  Created by Mac on 8/4/20.
//  Copyright © 2020 Bex. All rights reserved.
//

import UIKit

class BreakViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, BreakManagerDelegate{
    
    @IBOutlet var takeBreakRef: UIButton!
    @IBOutlet var closeButton: UIButton!
    @IBOutlet var countdownLabel: UILabel!
    @IBOutlet var finishButton: UIButton!
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var CactusImage: UIImageView!
    
    lazy var breakManager = BreakManager(breakDelegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CactusImage.layer.cornerRadius = CactusImage.frame.width / 2
        CactusImage.layer.masksToBounds = true
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        finishButton.layer.cornerRadius = 14
        finishButton.layer.masksToBounds = true
        finishButton.layer.borderWidth = 1
        finishButton.layer.borderColor = UIColor(named: "textColor")?.cgColor
    }
    
    @IBAction func finishButtonAction() {
        showBreakFinished()
    }
    @IBAction func CloseButton() {
       // performSegue(withIdentifier: "ClosedBreak", sender: nil)
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    let durations = [5,10, 15, 20, 25, 30]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        durations.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(durations[row])  mins"
    }
    @IBAction func TakeBreak() {
        let selectedPickerRow = pickerView.selectedRow(inComponent: 0)
        let selectedDuration = durations[selectedPickerRow] // *60
        breakManager.startBreak(breakk: Break(durationInSeconds: selectedDuration))
    }
    
    // Delegate realization
    func showBreakStarted(breakk: Break) {
        showTimeLeftFunc(durationInSeconds: breakk.durationInSeconds)
        finishButton.isHidden = false
        countdownLabel.isHidden = false
        pickerView.isHidden = true
        takeBreakRef.isHidden = true
        closeButton.isHidden = true
    }
       
    func showBreakEnded(breakk: Break) {
        presentingViewController?.dismiss(animated: true, completion: nil)
        
    }
       
    func showTimeLeft(secondsLeft: Int) {
           showTimeLeftFunc(durationInSeconds: secondsLeft)
    }
    func showTimeLeftFunc (durationInSeconds: Int) {
        countdownLabel.text = String(format: "%02d:%02d", durationInSeconds / 60, durationInSeconds % 60)
    }
    func showBreakFinished() {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }

}
