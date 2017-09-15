//
//  ViewController.swift
//  ITunesKit
//
//  Created by jeanclad on 2017. 9. 11..
//  Copyright © 2017년 jeanclad. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet fileprivate var chartViewModel: ChartViewModel!
    @IBOutlet fileprivate var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
                
        self.chartViewModel.fetchChartList {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chartViewModel.numberOfItemInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as UITableViewCell
        
        configureCell(cell: cell, forRowIndexPath: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            let id = chartViewModel.idForItemAtIndexPath(indexPath: indexPath)
            let appIdModel = AppIdModel(appId: id)
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    fileprivate func configureCell(cell: UITableViewCell, forRowIndexPath indexPath: IndexPath) {
        cell.textLabel?.text = chartViewModel.titleForItemAtIndexPath(indexPath: indexPath)
    }
}
