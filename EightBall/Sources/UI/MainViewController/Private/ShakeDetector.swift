//
//  ShakeDetector.swift
//  EightBall
//
//  Created by Yevhen Triukhan on 8/25/19.
//  Copyright © 2019 Yevhen Triukhan. All rights reserved.
//

import UIKit

class ShakeDetector: UIView {
    
    // MARK: - Properties
    
    var onShake: EmptyAction?
    
    // MARK: - Init and Deinit
    
    init() {
        super.init(frame: .zero)
        self.becomeFirstResponder()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UIResponder
    
    override var canBecomeFirstResponder: Bool {
        get { return true  }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            self.onShake?()
        }
    }
}

