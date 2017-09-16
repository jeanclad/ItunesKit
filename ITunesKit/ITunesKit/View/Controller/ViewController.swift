//
//  ViewController.swift
//  ITunesKit
//
//  Created by jeanclad on 2017. 9. 11..
//  Copyright © 2017년 jeanclad. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import ObjectMapper

class ViewController: UIViewController {
    
    @IBOutlet fileprivate var tableView: UITableView!
    
    var disposeBag = DisposeBag()
    let chartViewModel = ChartViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        chartViewModel.fetchChartList()
        bind()
    }
    
    private func configureTableView() {
        //        tableView.rx.setDelegate(self).addDisposableTo(disposeBag)
    }
    
    private func bind() {
        self.chartViewModel.items
            .asObservable()
            .bind(to: self.tableView.rx.items(cellIdentifier: "listCell", cellType: ChartListTableTableViewCell.self)) { (row, item, cell) in
                cell.item = item
            }
            .disposed(by: self.disposeBag)
    }
}
