//
//  ViewController.swift
//  Cactus
//
//  Created by Mac on 8/3/20.
//  Copyright © 2020 Bex. All rights reserved.
//

import UIKit

class SessionViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, SessionManagerDelegate {
    
    
    
    @IBOutlet var countdownLabel: UILabel!
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var PlantButton: UIButton!
    @IBOutlet var cactusImageView: UIImageView!
    @IBOutlet var giveUpButton: UIButton!
    
    lazy var sessionManager = SessionManager(sessionDelegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cactusImageView.layer.cornerRadius = cactusImageView.frame.width / 2
        cactusImageView.layer.masksToBounds = true

        PlantButton.layer.cornerRadius = 14
        PlantButton.layer.masksToBounds = true
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        giveUpButton.layer.cornerRadius = 14
        giveUpButton.layer.masksToBounds = true
        giveUpButton.layer.borderWidth = 1
        giveUpButton.layer.borderColor = UIColor(named: "textColor")?.cgColor
    }
    @IBAction func didTapGiveUp() {
        sessionManager.cancelSession()
    }
    @IBAction func TappedPlantButtonx() {
        let selectedPickerRow = pickerView.selectedRow(inComponent: 0)
        let selectedDuration = durations[selectedPickerRow]//*60
        sessionManager.startSession(session: Session(durationInSeconds: selectedDuration, startDate: Date()))
    }
    
    let durations =  [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return durations.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return  "\(durations[row]) mins"
    }
    // SessionManagerDelegate realization
    func showSessionStarted(session: Session) {
        showTimeLeftfunc(durationInSeconds: session.durationInSeconds)
        pickerView.isHidden = true
        PlantButton.isHidden = true
        countdownLabel.isHidden = false
        giveUpButton.isHidden = false
    }
    
    func showTimeLeft(secondsLeft: Int) {
        showTimeLeftfunc(durationInSeconds: secondsLeft)
    }
    func showTimeLeftfunc(durationInSeconds: Int) {
        countdownLabel.text = String(format: "%02d:%02d", durationInSeconds / 60, durationInSeconds % 60)
    }
    func showSessionEnded(session:Session) {
        performSegue(withIdentifier: "showHurray", sender: nil)
        pickerView.isHidden = false
        PlantButton.isHidden = false
        countdownLabel.isHidden = true
        giveUpButton.isHidden = true
    }
    
    func showSessionCancelled() {
        pickerView.isHidden = false
        PlantButton.isHidden = false
        countdownLabel.isHidden = true
        giveUpButton.isHidden = true
        
    }
    
}

