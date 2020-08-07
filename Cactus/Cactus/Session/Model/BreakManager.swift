//
//  BreakManager.swift
//  Cactus
//
//  Created by Mac on 8/5/20.
//  Copyright © 2020 Bex. All rights reserved.
//

import Foundation
protocol BreakManagerDelegate {
    func showBreakStarted(breakk: Break)
    func showBreakEnded(breakk: Break)
    func showTimeLeft(secondsLeft: Int)
    func showBreakFinished()
}

class BreakManager {
    var breakDelegate: BreakManagerDelegate
    var timer: Timer?
    init(breakDelegate: BreakManagerDelegate) {
        self.breakDelegate = breakDelegate
    }
    func startBreak(breakk: Break) {
        breakDelegate.showBreakStarted(breakk: breakk)
        breakDelegate.showTimeLeft(secondsLeft: breakk.durationInSeconds)
        var secondsLeft = breakk.durationInSeconds
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            secondsLeft -= 1
            if secondsLeft == 0 {
                self.breakDelegate.showBreakEnded(breakk: breakk)
                self.timer?.invalidate()
                self.timer = nil
                //self.breakDelegate.showBreakEnded()
            }
            else {
                self.breakDelegate.showTimeLeft(secondsLeft: secondsLeft)
            }

        })
    }
    func finishBreak() {
        timer?.invalidate()
        timer = nil
        breakDelegate.showBreakFinished()
    }
}
