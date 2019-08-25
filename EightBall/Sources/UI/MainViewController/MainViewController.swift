//
//  MainViewController.swift
//  EightBall
//
//  Created by Yevhen Triukhan on 8/25/19.
//  Copyright © 2019 Yevhen Triukhan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, Typeable {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureUI()
    }
    
    // MARK: - Public API
    
    func configureUI() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(self.onSettings))
    }
    
    @objc func onSettings(_ sender: UIBarButtonItem) {
        debugPrint(#function)
    }
}
