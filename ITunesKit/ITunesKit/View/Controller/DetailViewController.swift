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
        
        detailViewModel.fetchAppInfo()
        bind()
    }
    
    private func bind() {
        detailViewModel.items
            .asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: "titleCell", cellType: DetailTitleTableViewCell.self)) { (_, item, cell) in
                cell.item = item
            }
            .addDisposableTo(disposeBag)
        
        tableView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                self?.tableView.deselectRow(at: indexPath, animated: true)
            })
            .addDisposableTo(disposeBag)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
