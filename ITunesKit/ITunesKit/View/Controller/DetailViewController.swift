//
//  DetailViewController.swift
//  ITunesKit
//
//  Created by jeanclad on 2017. 9. 14..
//  Copyright © 2017년 jeanclad. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import ObjectMapper

class DetailViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var disposeBag = DisposeBag()
    var detailViewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        self.detailViewModel.fetchAppInfo()
        bind()
    }
    
    private func configureTableView() {
        self.tableView.estimatedRowHeight = 100
        self.tableView
            .rx
            .setDelegate(self)
            .addDisposableTo(disposeBag)
    }
    
    private func bind() {
        detailViewModel.items
            .asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: "titleCell", cellType: DetailTitleTableViewCell.self)) { (row, item, cell) in
                if row == 0 {
                    cell.item = item
                }
            }
            .addDisposableTo(disposeBag)

        tableView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                self?.tableView.deselectRow(at: indexPath, animated: true)
            })
            .addDisposableTo(disposeBag)
    }
}

extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
