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

class ViewController: UIViewController {//, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet fileprivate var tableView: UITableView!
    
    var disposeBag = DisposeBag()
    let chartViewModel = ChartViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        bind()
        //        self.chartViewModel.fetchChartList {
        ////            DispatchQueue.main.async {
        ////                self.tableView.reloadData()
        ////            }
        //        }
    }
    
    private func configureTableView() {
        
    }
    
    private func bind() {
        HTTPClientService.shared
            .get(urlString: "https://itunes.apple.com/kr/rss/topfreeapplications/limit=50/genre=6015/json")
            .observeOn(MainScheduler.instance)
            .subscribe { (jsonDic) in
                print(jsonDic)
                let chartModel = Mapper<ChartModel>().map(JSONObject: jsonDic.element)
                print(chartModel.debugDescription)

                if chartModel != nil {
                    self.chartViewModel.chartModel = chartModel
                }
            }
            .addDisposableTo(disposeBag)
    }
    
    // MARK: UITableViewDataSource
    //    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        return chartViewModel.numberOfItem
    //    }
    //
    //    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as UITableViewCell
    //
    //        configureCell(cell: cell, forRowIndexPath: indexPath)
    //
    //        return cell
    //    }
    //
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //        if let controller = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
    //            let id = chartViewModel.idForItemAtIndexPath(indexPath: indexPath)
    //            let title = chartViewModel.titleForItemAtIndexPath(indexPath: indexPath)
    //            controller.detailViewModel.appId = id
    //            controller.detailViewModel.appName = title
    //            navigationController?.pushViewController(controller, animated: true)
    //        }
    //    }
    //
    //    fileprivate func configureCell(cell: UITableViewCell, forRowIndexPath indexPath: IndexPath) {
    //        cell.textLabel?.text = chartViewModel.titleForItemAtIndexPath(indexPath: indexPath)
    //    }
}
