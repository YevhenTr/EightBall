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
    
    private let storageService = StorageService()
    
    // MARK: - Init and Deinit
    
    deinit {
        debugPrint("\(self) deinit")
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configure()
    }
    
    // MARK: - Public API
    
    func configure() {
        fatalError("Not implented in base class")
    }

    func getStorageService() -> StorageService {
        return self.storageService
    }
}
