//
//  Answer.swift
//  EightBall
//
//  Created by Yevhen Triukhan on 8/25/19.
//  Copyright © 2019 Yevhen Triukhan. All rights reserved.
//

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
