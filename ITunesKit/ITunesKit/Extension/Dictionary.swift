//
//  Dictionary.swift
//  ITunesKit
//
//  Created by jeanclad on 2017. 9. 15..
//  Copyright © 2017년 jeanclad. All rights reserved.
//

import Foundation

extension Dictionary where Key:ExpressibleByStringLiteral, Value: ExpressibleByStringLiteral {
    func toParameterString() -> String {
        guard let _self = (self as AnyObject) as? Dictionary<String, String> else {
            return ""
        }
        if _self.count < 10 {
            return (1..._self.count+1).map { "\($0)=\($0)" }.joined(separator: "&")
        }
        return (1..._self.count).map { "\($0)=\($0)" }.joined(separator: "&")
    }
}
