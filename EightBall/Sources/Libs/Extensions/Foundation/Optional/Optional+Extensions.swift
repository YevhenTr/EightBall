//
//  Optional+Extensions.swift
//  EightBall
//
//  Created by Yevhen Triukhan on 8/25/19.
//  Copyright © 2019 Yevhen Triukhan. All rights reserved.
//

import Foundation

extension Optional {
    
    public var isNone: Bool {
        switch self {
        case .none: return true
        case .some: return false
        }
    }
    
    public var isSome: Bool {
        return !self.isNone
    }
}
