//
//  ViewController.swift
//  ITunesKit
//
//  Created by jeanclad on 2017. 9. 11..
//  Copyright © 2017년 jeanclad. All rights reserved.
//

import UIKit

// TODO: 메쏘드 속성 붙이기
class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var viewModel: ViewModel!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        self.viewModel.fetchChartList {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItemInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as UITableViewCell
        
        configureCell(cell: cell, forRowIndexPath: indexPath as NSIndexPath)
        
        return cell
    }
    
    func configureCell(cell: UITableViewCell, forRowIndexPath indexPath: NSIndexPath) {
        cell.textLabel?.text = viewModel.titleForItemAtIndexPath(indexPath: indexPath)
    }
}

