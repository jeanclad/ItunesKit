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
        chartViewModel.items
            .asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: "listCell", cellType: ChartListTableTableViewCell.self)) { (_, item, cell) in
                cell.item = item
            }
            .addDisposableTo(disposeBag)
        
        tableView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                let cell = self?.tableView.cellForRow(at: indexPath) as? ChartListTableTableViewCell
                print("aa")
                self?.tableView.deselectRow(at: indexPath, animated: true)
            })
            .addDisposableTo(disposeBag)
    }
}
