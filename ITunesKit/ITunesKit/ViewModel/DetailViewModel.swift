//
//  DetailViewModel.swift
//  ITunesKit
//
//  Created by jeanclad on 2017. 9. 15..
//  Copyright © 2017년 jeanclad. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import ObjectMapper

internal final class DetailViewModel: NSObject {
    var disposeBag = DisposeBag()
    
    var appId: String?
    
    var items = Variable<[Result]>([])
    var detailModel: DetailModel?
    
    internal func fetchAppInfo() {
        HTTPClientService.shared
            .get(urlString: "https://itunes.apple.com/lookup?id=\(appId ?? "")&country=kr")
            .observeOn(MainScheduler.instance)
            .subscribe { (jsonDic) in
                let detailModel = Mapper<DetailModel>().map(JSONObject: jsonDic.element)
                if detailModel != nil {
                    self.detailModel = detailModel
                    self.items.value = (detailModel?.results)!
                }                
            }
            .addDisposableTo(disposeBag)
    }
}
