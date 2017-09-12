//
//  ViewModel.swift
//  ITunesKit
//
//  Created by jeanclad on 2017. 9. 11..
//  Copyright © 2017년 jeanclad. All rights reserved.
//

import UIKit

class ViewModel: NSObject {
    @IBOutlet var chartClient: ChartClient!
    var chart: [NSDictionary]?
    
    func fetchChartList(completion: @escaping ()-> ()) {
        chartClient.fetchChart { chart in
            self.chart = chart
            completion()
        }
    }
    
    func numberOfItemInSection(section: Int) -> Int {
        return chart?.count ?? 0
    }
    func titleForItemAtIndexPath(indexPath: NSIndexPath) -> String {
        return chart?[indexPath.row].value(forKeyPath: "im:name.label") as? String ?? ""
    }
}
