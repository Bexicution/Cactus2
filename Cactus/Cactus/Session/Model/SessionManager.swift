//
//  SessionManager.swift
//  Cactus
//
//  Created by Mac on 8/5/20.
//  Copyright © 2020 Bex. All rights reserved.
//

import Foundation
protocol SessionManagerDelegate {
    func showSessionStarted(session: Session)
    func showTimeLeft(secondsLeft: Int)
    func showSessionEnded(session: Session)
    func showSessionCancelled()
}
class SessionManager {
    var sessionDelegate: SessionManagerDelegate
    var timer: Timer?
    init(sessionDelegate: SessionManagerDelegate) {
        self.sessionDelegate = sessionDelegate
    }
    
    func startSession(session: Session) {
        sessionDelegate.showSessionStarted(session: session)
        sessionDelegate.showTimeLeft(secondsLeft: session.durationInSeconds)
        var secondsLeft = session.durationInSeconds
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            secondsLeft -= 1
            self.sessionDelegate.showTimeLeft(secondsLeft: secondsLeft)
            if secondsLeft == 0 {
                //    SessionsStorage.shared.add(session: session)
                self.sessionDelegate.showSessionEnded(session: session)
                
                self.timer?.invalidate()
                self.timer = nil
            }
        }
    }
    func cancelSession() {
        timer?.invalidate()
        timer = nil
        sessionDelegate.showSessionCancelled()
    }
}
//class SessionsStorage {
//    static let shared = SessionsStorage()
//    var sessions = [Session]()
//    func add(session: Session) {
//        sessions.append(session)
//    }
//}
