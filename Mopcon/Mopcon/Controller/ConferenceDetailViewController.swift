//
//  ConferenceDetailViewController.swift
//  Mopcon
//
//  Created by EthanLin on 2018/7/7.
//  Copyright © 2018 EthanLin. All rights reserved.
//

import UIKit

class ConferenceDetailViewController: UIViewController {
    
    var key:String?
    var agenda:Schedule.Payload.Agenda.Item.AgendaContent?
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var topicLabel: UILabel!
    
    @IBOutlet weak var speakerImageView: UIImageView!
    @IBOutlet weak var speakerName: UILabel!
    @IBOutlet weak var speakerJob: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var scheduleInfoLabel: UILabel!
    @IBOutlet weak var addToMyScheduleButton: CustomCornerButton!
    
    @IBAction func addToMySchedule(_ sender: UIButton) {
        
        guard let agenda = agenda,let key = key  else {
            return
        }
        
        if sender.currentImage == UIImage(named: "buttonStarNormal"){
            MySchedules.add(agenda: agenda, forKey: key)
            sender.setImage(UIImage(named: "buttonStarChecked"), for: .normal)
        } else {
            MySchedules.remove(agenda: agenda, forKey: key)
            sender.setImage(UIImage(named: "buttonStarNormal"), for: .normal)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white
        // Do any additional setup after loading the view.
        if CurrentLanguage.getLanguage() == Language.english.rawValue {
            self.navigationItem.title = "Agenda"
        }
        if let agenda = agenda {
            updateUI(agenda: agenda)
        }
    }
    
    func updateUI(agenda:Schedule.Payload.Agenda.Item.AgendaContent) {
        if let picture = agenda.picture {
            self.speakerImageView.getImage(address: picture)
        }
        
        if MySchedules.checkRepeat(scheduleID: agenda.schedule_id) {
            self.addToMyScheduleButton.setImage(UIImage(named: "buttonStarChecked"), for: .normal)
        }

        self.speakerImageView.makeCircle()
        
        let language = CurrentLanguage.getLanguage()
        switch language {
        case Language.chinese.rawValue:
            self.scheduleInfoLabel.text = agenda.schedule_info
            self.companyLabel.text = agenda.company
            self.typeLabel.text = agenda.category
            self.topicLabel.text = agenda.schedule_topic
            self.speakerName.text = agenda.name
            self.speakerJob.text = agenda.job
        case Language.english.rawValue:
            self.scheduleInfoLabel.text = agenda.schedule_info_en
            self.companyLabel.text = agenda.company
            self.topicLabel.text = agenda.schedule_topic_en
            self.typeLabel.text = agenda.category
            self.speakerName.text = agenda.name_en
            self.speakerJob.text = agenda.job
        default:
            break
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
