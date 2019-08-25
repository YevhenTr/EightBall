//
//  Answer.swift
//  EightBall
//
//  Created by Yevhen Triukhan on 8/25/19.
//  Copyright © 2019 Yevhen Triukhan. All rights reserved.
//

import CoreData

struct FullAnswerModel: Codable {
    
    let content: AnswerModel
    
    enum CodingKeys: String, CodingKey {
        case content = "magic"
    }
}

struct AnswerModel: Codable {
    
    let answer: String
    
    enum CodingKeys: String, CodingKey {
        case answer = "answer"
    }
}

extension AnswerModel {
    
    static var yesModel: AnswerModel {
        return AnswerModel(answer: "YES!")
    }
    
    func asCDAnswerModel(context: NSManagedObjectContext) -> CDAnswerModel {
        let managedObject = CDAnswerModel(context: context)
        
        managedObject.answer = self.answer
        
        return managedObject
    }
}

extension CDAnswerModel {
    
    func asAnswerModel() -> AnswerModel? {
        if let answer = self.answer {
            return AnswerModel(answer: answer)
        } else {
            return nil
        }
    }
}
