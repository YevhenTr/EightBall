//
//  SettingsViewController.swift
//  EightBall
//
//  Created by Yevhen Triukhan on 8/25/19.
//  Copyright © 2019 Yevhen Triukhan. All rights reserved.
//

import UIKit

class SettingsViewController: BaseViewController<SettingsView> {
    
    // MARK: - Subtypes

    typealias Text = AppTextConstants.Settings

    // MARK: - Public API

    override func configure() {
        self.configureUI()
        self.updateDataSource()
    }
    
    @objc func onCancel() {
        self.dismiss(animated: true)
    }
    
    @objc func onAdd() {
        self.showForm(title: Text.formTitle,
                      message: Text.formMessage,
                      placeholder: Text.formPlaceholder,
                      completion: self.newAnswerHandling)
    }
    
    // MARK: - Private API
    
    private func configureUI() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(self.onCancel))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.onAdd))
    }
    
    private func updateDataSource() {
        self.rootView?.dataSource = self.getStorageService().allAnswers() ?? []
    }
    
    private func newAnswerHandling(_ newAnswer: String) {
        if !newAnswer.isEmpty {
            self.getStorageService().add(answer: AnswerModel(answer: newAnswer))
            self.updateDataSource()
        }
    }
}
