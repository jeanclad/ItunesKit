//
//  AppIdModel.swift
//  ITunesKit
//
//  Created by jeanclad on 2017. 9. 15..
//  Copyright © 2017년 jeanclad. All rights reserved.
//

import UIKit

class AppIdModel: NSObject {
    var appId: String!
    
    override init() {
        super.init()
    }
    
    init(appId: String) {
        self.appId = appId
    }
}
