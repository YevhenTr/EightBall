//
//  MainViewController.swift
//  EightBall
//
//  Created by Yevhen Triukhan on 8/25/19.
//  Copyright © 2019 Yevhen Triukhan. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController<MainView>, Typeable {

    // MARK: - Properties
    
    private let networkService = NetworkService()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureUI()
        
    }
    
    // MARK: - Public API
    
    override func configureUI() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(self.onSettings))
    }
    
    @IBAction func onTest(_ sender: UIButton) {
        if let question = self.rootView?.getQuestion() {
            self.sendRequest(question: question)
        } else {
            self.showAlert(error: NSError.wrongQuestion)
        }
    }
    
    @objc func onSettings(_ sender: UIBarButtonItem) {
        debugPrint(#function)
    }
    
    // MARK: - Private API
    
    private func sendRequest(question: String) {
        self.networkService.answer(to: question) { [weak self] result in
            switch result {
            case let .success(answer):
                self?.rootView?.show(answer: answer)
            case let .failure(error):
                self?.showAlert(error: error)
            }
        }
    }
}
