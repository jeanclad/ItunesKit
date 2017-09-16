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
        
        self.chartViewModel.fetchChartList()
        bind()
    }
    
    private func bind() {
        self.chartViewModel.items
            .asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: "listCell", cellType: ChartListTableTableViewCell.self)) { (_, item, cell) in
                cell.item = item
            }
            .addDisposableTo(disposeBag)
        
        self.tableView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                self?.tableView.deselectRow(at: indexPath, animated: true)
            })
            .addDisposableTo(disposeBag)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailViewController", let destination = segue.destination as? DetailViewController {
            if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
                let appId = chartViewModel.chartModel?.feed?.entries?[indexPath.row].appId?.idAttr?.imId
                destination.detailViewModel.appId = appId
            }
        }
    }
}
