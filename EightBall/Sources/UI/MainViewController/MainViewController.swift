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
        self.networkService.answer(to: "Test") { [weak self] result in
            switch result {
            case let .success(answer):
                break
            case let .failure(error):
                self?.showAlert(error: error)
            }
        }
    }
    
    @objc func onSettings(_ sender: UIBarButtonItem) {
        debugPrint(#function)
    }
}
