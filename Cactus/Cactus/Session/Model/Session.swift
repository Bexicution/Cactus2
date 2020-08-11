    //
//  Session.swift
//  Cactus
//
//  Created by Mac on 8/5/20.
//  Copyright © 2020 Bex. All rights reserved.
//

import Foundation
 class Session {
     let durationInSeconds: Int
     let startDate: Date
     init(durationInSeconds: Int, startDate: Date) {
         self.durationInSeconds = durationInSeconds
         self.startDate = startDate
     }
 }

