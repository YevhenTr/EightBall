//
//  SettingsViewController.swift
//  EightBall
//
//  Created by Yevhen Triukhan on 8/25/19.
//  Copyright © 2019 Yevhen Triukhan. All rights reserved.
//

import UIKit

class SettingsViewController: BaseViewController<SettingsView> {

    let storage = StorageService()
    
    // MARK: - Public API

    override func configureUI() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(self.onCancel))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.onAdd))
    }
    
    @objc func onCancel() {
        self.dismiss(animated: true)
    }
    
    @objc func onAdd() {
        self.showForm(title: "New Answer",
                      message: "Add new predefined answer.",
                      placeholder: "New Aswer",
                      completion: { newAnswer in
                        if !newAnswer.isEmpty {
                            self.storage.add(answer: newAnswer)
                        }
                    })
    }
}
