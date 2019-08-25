//
//  BaseViewController.swift
//  EightBall
//
//  Created by Yevhen Triukhan on 8/25/19.
//  Copyright © 2019 Yevhen Triukhan. All rights reserved.
//

import UIKit

class BaseViewController<RootView>: UIViewController {

    // MARK: - Properties
    
    public var rootView: RootView? {
        return self.viewIfLoaded as? RootView
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureUI()
    }
    
    // MARK: - Public API
    
    func configureUI() {
        fatalError("Not implented in base class")
    }

}
