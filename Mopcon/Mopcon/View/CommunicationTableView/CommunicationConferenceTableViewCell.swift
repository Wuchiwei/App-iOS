//
//  CommunicationConferenceTableViewCell.swift
//  Mopcon
//
//  Created by EthanLin on 2018/7/5.
//  Copyright © 2018 EthanLin. All rights reserved.
//

import UIKit

class CommunicationConferenceTableViewCell: UITableViewCell {
    
    @IBOutlet weak var tiltleLabel: UILabel!
    @IBOutlet weak var speakerLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.selectionStyle = .none
        // Configure the view for the selected state
    }
    
    func updateUI(schedule:Schedule_unconf.Payload.Item) {
        self.tiltleLabel.text = schedule.topic
        self.speakerLabel.text = schedule.speaker
    }
    

}
