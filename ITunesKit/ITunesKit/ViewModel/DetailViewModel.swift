//
//  DetailViewModel.swift
//  ITunesKit
//
//  Created by jeanclad on 2017. 9. 15..
//  Copyright © 2017년 jeanclad. All rights reserved.
//

import UIKit

internal class DetailViewModel: NSObject {
    @IBOutlet fileprivate var chartClient: HttpClient!
    fileprivate var appInfo: [NSDictionary]?
    fileprivate var appId: String?
}
