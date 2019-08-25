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
    
    static var wrongQuestion: NSError {
        
        return NSError(domain: "Wrong question: string is nil.", code: 9998, userInfo: nil)
    }
    
    static var wrongURL: NSError {
        
        return NSError(domain: "Wrong URL: requested URL cannot be found.", code: 9997, userInfo: nil)
    }
    
    static var failedWrite: NSError {
        
        return NSError(domain: "Writing error: failed to write file.", code: 9997, userInfo: nil)
    }
}
