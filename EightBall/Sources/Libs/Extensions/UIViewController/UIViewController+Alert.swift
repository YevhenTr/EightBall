//
//  UIViewController+Alert.swift
//  EightBall
//
//  Created by Yevhen Triukhan on 8/25/19.
//  Copyright © 2019 Yevhen Triukhan. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String,
                   message: String,
                   actions: [UIAlertAction]? = [UIAlertAction(title: "OK", style: .cancel, handler: nil)]) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let _ = actions?.map{ alertController.addAction($0) }
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showAlert(error: Error) {
        self.showAlert(title: "Error", message: error.localizedDescription)
    }
}
