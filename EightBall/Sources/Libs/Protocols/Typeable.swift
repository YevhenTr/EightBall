//
//  Typeable.swift
//  EightBall
//
//  Created by Yevhen Triukhan on 8/25/19.
//  Copyright © 2019 Yevhen Triukhan. All rights reserved.
//

import Foundation

protocol Typeable {
    
    static var typeName: String { get }
}

extension Typeable where Self: Any {
    
    static var typeName: String {
        return String(describing: self)
    }
}
