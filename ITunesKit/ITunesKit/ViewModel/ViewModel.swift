//
//  ViewModel.swift
//  ITunesKit
//
//  Created by jeanclad on 2017. 9. 11..
//  Copyright © 2017년 jeanclad. All rights reserved.
//

import UIKit

class ViewModel: NSObject {
    func numberOfItemInSection(section: Int) -> Int {
        return 10
    }
    func titleForItemAtIndexPath(indexPath: NSIndexPath) -> String {
        return "hi"
    }
}
