//
//  MainViewController.swift
//  EightBall
//
//  Created by Yevhen Triukhan on 8/25/19.
//  Copyright © 2019 Yevhen Triukhan. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController<MainView> {

    // MARK: - Properties
    
    private let networkService = NetworkService()
    
    // MARK: - Public API
    
    override func configure() {
        self.configureShakeDetector()
        self.configureUI()
    }
    
    func onShake() {
        if let question = self.rootView?.getQuestion() {
            self.sendRequest(question: question)
        } else {
            self.showAlert(error: NSError.wrongQuestion)
        }
    }
    
    @objc func onSettings() {
        self.present(UINavigationController(rootViewController: SettingsViewController()), animated: true)
    }
    
    // MARK: - Private API
    
    private func configureUI() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(self.onSettings))
    }
    
    private func configureShakeDetector() {
        let detector = ShakeDetector()
        
        detector.becomeFirstResponder()
        detector.onShake = { [weak self] in self?.onShake() }
        self.rootView?.addSubview(detector)
    }
    
    private func sendRequest(question: String) {
        self.networkService.answer(to: question) { [weak self] result in
            switch result {
            case let .success(answer):
                self?.rootView?.show(answer: answer)
            case .failure:
                self?.getStorageService().randomAnswer()
                    .map { self?.rootView?.show(answer: $0) }
            }
        }
    }
}
