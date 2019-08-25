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
    
    @IBOutlet var transitionView: TransitionView?
    
    private var isStarted = false
    
    // MARK: - View Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.invitationLabel?.text = "Shake iPhone to get answer!"
        [self.answerLabel, self.tooltipLabel]
            .forEach { $0?.text = "" }
    }
    
    // MARK: - Public API
    
    func show(answer: AnswerModel) {
        DispatchQueue.main.async { [weak self] in
            self?.transitionView?.hide()
            if self?.isStarted == false {
                self?.updateUI()
            }
            
            self?.answerLabel?.text = answer.answer
        }
    }
    
    func getQuestion() -> String? {
        self.transitionView?.show()
        return String.random()
    }
    
    // MARK: - Private API
    
    private func updateUI() {
        self.invitationLabel?.text = ""
        self.tooltipLabel?.text = "Shake again if you want more answers!"
        self.isStarted = true
    }
}
