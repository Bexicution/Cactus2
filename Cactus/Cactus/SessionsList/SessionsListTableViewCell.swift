//
//  SessionsListTableViewCell.swift
//  Cactus
//
//  Created by Mac on 8/8/20.
//  Copyright © 2020 Bex. All rights reserved.
//

import UIKit

class SessionsListTableViewCell: UITableViewCell {

    @IBOutlet var CactusimageView: UIImageView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    
    static let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with session: Session) {
        let time = session.durationInSeconds
        let hoursCount = time / 60
        let minutesCount = time % 60
        var durationText: String!
        if (hoursCount == 0) {
            durationText = "\(minutesCount)m"
        }
        else if minutesCount == 0 {
            durationText = "\(hoursCount)h"
        }
        else {
            durationText = "\(hoursCount)h \(minutesCount)m"
        }
        timeLabel.text = durationText
        
        dateLabel.text = "\(SessionsListTableViewCell.dateFormat.string(from: session.startDate))"
    }
}
