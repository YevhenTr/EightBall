//
//  UIViewController+Alert.swift
//  EightBall
//
//  Created by Yevhen Triukhan on 8/25/19.
//  Copyright © 2019 Yevhen Triukhan. All rights reserved.
//

import UIKit

extension UIViewController {
    
    typealias Text = AppTextConstants

    func showAlert(title: String,
                   message: String,
                   actions: [UIAlertAction]? = [UIAlertAction(title: Text.ok, style: .cancel, handler: nil)]) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let _ = actions?.map{ alertController.addAction($0) }
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showAlert(error: Error) {
        self.showAlert(title: Text.error, message: error.localizedDescription)
    }
    
    func showForm(title: String,
                  message: String,
                  placeholder: String,
                  completion: @escaping (String) -> ()) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addTextField() { $0.placeholder =  placeholder }
        
        let cancelAction = UIAlertAction(title: Text.cancel, style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: Text.ok, style: .default) { _ in
            alertController.textFields?.first?.text.map { completion($0) }
        }
        
        [cancelAction, okAction].forEach { alertController.addAction($0) }
        
        self.present(alertController, animated: true, completion: nil)
    }
}
