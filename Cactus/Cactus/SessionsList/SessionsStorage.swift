//
//  SesssionStorage.swift
//  Cactus
//
//  Created by Mac on 8/8/20.
//  Copyright © 2020 Bex. All rights reserved.
//

import Foundation

class SessionsStorage {
    static let shared = SessionsStorage()
    var sessions = [Session]()
    func add(_ session: Session) {
        sessions.append(session)
    }
}
