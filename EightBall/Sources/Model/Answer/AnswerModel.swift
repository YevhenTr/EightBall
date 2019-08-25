//
//  Answer.swift
//  EightBall
//
//  Created by Yevhen Triukhan on 8/25/19.
//  Copyright © 2019 Yevhen Triukhan. All rights reserved.
//

struct AnswerModel: Codable {
    
    let content: AnswerContentModel
    var answer: String { return self.content.answer }
    
    enum CodingKeys: String, CodingKey {
        case content = "magic"
    }
}

struct AnswerContentModel: Codable {
    
    let question: String
    let answer: String
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case question = "question"
        case answer = "answer"
        case type = "type"
    }
}
