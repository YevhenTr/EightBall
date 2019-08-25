//
//  NSError+Extensions.swift
//  EightBall
//
//  Created by Yevhen Triukhan on 8/25/19.
//  Copyright © 2019 Yevhen Triukhan. All rights reserved.
//

import Foundation

extension NSError {
    
    static var unexpectedBehaviour: NSError {
        
        return NSError(domain: "Unexpected behavior: network response has no data, no error.", code: 9999, userInfo: nil)
    }
}
