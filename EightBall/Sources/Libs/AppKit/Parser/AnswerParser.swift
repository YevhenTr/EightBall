//
//  AnswerParser.swift
//  EightBall
//
//  Created by Yevhen Triukhan on 8/25/19.
//  Copyright © 2019 Yevhen Triukhan. All rights reserved.
//

import Foundation

final class AnswerParser {
    
    // MARK: - Public API
    
    func parse(data: Data) -> Result<AnswerModel, Error> {
        do {
            let answer = try JSONDecoder().decode(AnswerModel.self, from: data)
            
            return .success(answer)
        } catch {
            return .failure(error)
        }
    }
}
