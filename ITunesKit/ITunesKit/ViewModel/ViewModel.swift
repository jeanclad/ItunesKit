//
//  ViewModel.swift
//  ITunesKit
//
//  Created by jeanclad on 2017. 9. 11..
//  Copyright © 2017년 jeanclad. All rights reserved.
//

import UIKit

class ViewModel: NSObject {
    @IBOutlet internal var chartClient: ChartClient!
    fileprivate var chart: [NSDictionary]?
    internal var numberOfItemInSection: Int {
        return chart?.count ?? 0
    }
    
    internal func fetchChartList(completion: @escaping () -> Void) {
        chartClient.fetchChart { chart in
            self.chart = chart
            completion()
        }
    }
    
    internal func titleForItemAtIndexPath(indexPath: NSIndexPath) -> String {
        return chart?[indexPath.row].value(forKeyPath: "im:name.label") as? String ?? ""
    }
}
