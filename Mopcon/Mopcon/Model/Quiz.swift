//
//  File.swift
//  Mopcon
//
//  Created by JeremyXue on 2018/9/25.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import Foundation

struct Quiz: Codable {
    var id: String
    var type: String
    var title: String
    var description: String
    var options: [String: String]?
    var banner_url: String
    var status: String
    var reward: String
    var answer: String
    var myAnswer: String?
    var boothinfo: String?
    
    static let key = "Quiz"
    
    static func getData() -> [Quiz] {
        if let savedData = UserDefaults.standard.data(forKey: key) {
            let decoder = JSONDecoder()
            let quiz = try! decoder.decode([Quiz].self, from: savedData)
            saveData(array: quiz)
            return quiz
        }
        let quizUrl = Bundle.main.url(forResource: "Quiz", withExtension: "json")
        let quizData = try! Data(contentsOf: quizUrl!)
        let decoder = JSONDecoder()
        var quiz = try! decoder.decode([Quiz].self, from: quizData)
        for i in quiz.indices {
            if quiz[i].status == "-1" {
                quiz[i].status = QuizStatus.unlock.rawValue
            }
        }
        
        let missionsUrl = Bundle.main.url(forResource: "BoothMission", withExtension: "json")
        let missionsData = try! Data(contentsOf: missionsUrl!)
        var missions = try! decoder.decode([Quiz].self, from: missionsData)
        
        for i in missions.indices {
            if missions[i].status == "0" {
                missions[i].status = QuizStatus.unlock.rawValue
            }
        }
        
        let array = quiz + missions
        saveData(array: array)
        return array
    }
    
    static func saveData(array: [Quiz]) {
        let encoder = JSONEncoder()
        let saveData = try! encoder.encode(array)
        UserDefaults.standard.set(saveData, forKey: key)
    }
    
    static func solveQuiz(id: String, answer: String, status: String) {
        var quiz = getData()
        var number = 0
        for i in quiz.indices {
            if quiz[i].id == id {
                quiz[i].status = status
                quiz[i].myAnswer = answer
                number = i
            }
        }
        let removeItem = quiz.remove(at: number)
        quiz.append(removeItem)
        saveData(array: quiz)
    }
}
