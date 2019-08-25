//
//  NetworkService.swift
//  EightBall
//
//  Created by Yevhen Triukhan on 8/25/19.
//  Copyright © 2019 Yevhen Triukhan. All rights reserved.
//

import Foundation

typealias EmptyAction = () -> ()

final class NetworkService {
    
    // MARK: - Subtypes
    
    private enum Constants {
        
        static let mainURLString = "https://8ball.delegator.com/magic/JSON/"
        static let defaultTimeout = 5.0
    }
    
    // MARK: - Properties
    
    private let parser = AnswerParser()
    private let session: URLSession
    private var currentTask: URLSessionDataTask?
    
    // MARK: - Init and Deinit
    
    deinit {
        self.currentTask?.cancel()
    }
    
    init(sessionConfig: URLSessionConfiguration = URLSessionConfiguration.default) {
        sessionConfig.timeoutIntervalForRequest = Constants.defaultTimeout
        self.session = URLSession(configuration: sessionConfig)
    }
    
    // MARK: - Public API
    
    func answer(to question: String, completion: @escaping (Result<AnswerModel, Error>) -> ()) {
        guard let url = URL(string: Constants.mainURLString + question) else { return }

        self.currentTask?.cancel()
        
        let task = self.session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                completion(self.parser.parse(data: data))
            } else {
                completion(.failure(NSError.unexpectedBehaviour))
            }
        }
        
        self.currentTask = task
        task.resume()
    }
    
    // MARK: - Private API
    
}

