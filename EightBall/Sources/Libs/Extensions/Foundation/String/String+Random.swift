//
//  String+Random.swift
//  EightBall
//
//  Created by Yevhen Triukhan on 8/25/19.
//  Copyright © 2019 Yevhen Triukhan. All rights reserved.
//

import Foundation

extension String {
    
    static func random(length: Int = 8) -> String {
        return (0..<length)
            .map { _ in UInt8.random(in: 97...122) }
            .map { String(UnicodeScalar($0)) }
            .joined()
    }
}
