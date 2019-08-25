//
//  MainView.swift
//  EightBall
//
//  Created by Yevhen Triukhan on 8/25/19.
//  Copyright © 2019 Yevhen Triukhan. All rights reserved.
//

import UIKit

class MainView: UIView {

    // MARK - Properties
    
    @IBOutlet var invitationLabel: UILabel?
    @IBOutlet var answerLabel: UILabel?
    @IBOutlet var tooltipLabel: UILabel?
    
    // MARK: - Public API
    
    func show(answer: AnswerModel) {
        DispatchQueue.main.async { [weak self] in
            self?.answerLabel?.text = answer.answer
        }
    }
    
    func getQuestion() -> String? {
        return String.random()
    }
}
