//
//  ChartViewModel.swift
//  ITunesKit
//
//  Created by jeanclad on 2017. 9. 11..
//  Copyright © 2017년 jeanclad. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import ObjectMapper

internal class ChartViewModel: NSObject {
    var disposeBag = DisposeBag()
    
    var items = Variable<[Entry]>([])
    var chartModel: ChartModel?
    
    func fetchChartList() {
        HTTPClientService.shared
            .get(urlString: "https://itunes.apple.com/kr/rss/topfreeapplications/limit=50/genre=6015/json")
            .observeOn(MainScheduler.instance)
            .subscribe { (jsonDic) in
                print(jsonDic)
                let chartModel = Mapper<ChartModel>().map(JSONObject: jsonDic.element)
                if chartModel != nil {
                    self.chartModel = chartModel!
                    self.items.value = (chartModel?.feed?.entries)!
                }
            }
            .addDisposableTo(disposeBag)
    }
}
