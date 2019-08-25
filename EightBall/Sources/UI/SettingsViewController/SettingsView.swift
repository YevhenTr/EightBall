//
//  SettingsView.swift
//  EightBall
//
//  Created by Yevhen Triukhan on 8/25/19.
//  Copyright © 2019 Yevhen Triukhan. All rights reserved.
//

import UIKit

class SettingsView: UIView {

    // MARK: - Properties
    
    @IBOutlet var tableView: UITableView?
    var dataSource = [AnswerModel]() {
        didSet {
            self.tableView?.reloadData()
        }
    }
    
    // MARK: - View Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.register(AnswerTableViewCell.self)
    }
    
    // MARK: - Public API
}

extension SettingsView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withCellClass: AnswerTableViewCell.self, for: indexPath)
        
        (cell as? AnswerTableViewCell).map {
            $0.answerTextView?.text = self.dataSource[indexPath.row].answer
        }
        
        return cell
    }
}
