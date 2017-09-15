//
//  DetailViewModel.swift
//  ITunesKit
//
//  Created by jeanclad on 2017. 9. 15..
//  Copyright © 2017년 jeanclad. All rights reserved.
//

import UIKit

internal class DetailViewModel: NSObject {
    @IBOutlet var httptClient: HttpClient!
    var appInfo: NSArray?
    
    var appName: String?
    var appId: String?
    
    internal func fetchAppInfo(completion: @escaping () -> Void) {
        // TODO: Unit Test appId를 다르게 해서
        httptClient.fetchAppInfo(appId: appId) { appInfo in
            self.appInfo = appInfo
            completion()
        }
    }
}
