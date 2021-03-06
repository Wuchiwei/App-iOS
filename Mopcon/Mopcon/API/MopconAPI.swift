//
//  MopconAPI.swift
//  Mopcon
//
//  Created by JeremyXue on 2018/9/18.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import Foundation

class MopconAPI {
    
    private let frontURL = "https://mopcon.org/2018/api/"
    private let frontTestURL = "https://dev.mopcon.org/2018/api/"
    
    var schedule:URL
    var speaker:URL
    var sponsor:URL
    var community:URL
    var schedule_unconf:URL
    var volunteer:URL
    var news:URL
    var carousel:URL
    var new_user:URL
    var get_balance:URL
    var buy_gachapon:URL
    var get_quiz:URL
    var solve_quiz:URL
    var get_hawker_qrcode:URL
    var get_hawker_mission:URL
    
    static public let shared = MopconAPI()
    
    private init() {
        schedule = URL(string: frontURL + "schedule")!
        speaker = URL(string: frontURL + "speaker")!
        sponsor = URL(string: frontURL + "sponsor")!
        community = URL(string: frontURL + "community")!
        schedule_unconf = URL(string: frontURL + "schedule-unconf")!
        volunteer = URL(string: frontURL + "volunteer")!
        news = URL(string: frontURL + "news")!
        carousel = URL(string: frontURL + "carousel")!
        new_user = URL(string: frontTestURL + "new-user")!
        get_balance = URL(string: frontTestURL + "get-balance")!
        buy_gachapon = URL(string: frontTestURL + "buy-gachapon")!
        get_quiz = URL(string: frontTestURL + "get-quiz")!
        solve_quiz = URL(string: frontTestURL + "solve-quiz")!
        get_hawker_qrcode = URL(string: frontTestURL + "get-hawker-qrcode")!
        get_hawker_mission = URL(string: frontTestURL + "get-hawker-mission")!
    }
}
