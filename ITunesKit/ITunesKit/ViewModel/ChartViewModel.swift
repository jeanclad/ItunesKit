//
//  ChartViewModel.swift
//  ITunesKit
//
//  Created by jeanclad on 2017. 9. 11..
//  Copyright © 2017년 jeanclad. All rights reserved.
//

import UIKit

class ChartViewModel: NSObject {
    @IBOutlet internal var chartClient: HttpClient!
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
    
    internal func titleForItemAtIndexPath(indexPath: IndexPath) -> String {
        return chart?[indexPath.row].value(forKeyPath: "im:name.label") as? String ?? ""
    }
    
    internal func idForItemAtIndexPath(indexPath: IndexPath) -> String {
        return chart?[indexPath.row].value(forKeyPath: "id.attributes.im:id") as? String ?? ""
    }
}
