//
//  HTTPClientService.swift
//  ITunesKit
//
//  Created by jeanclad on 2017. 9. 15..
//  Copyright © 2017년 jeanclad. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol HTTPClient {
    func get(urlString: String, params: String?) -> Observable<NSDictionary>
}

class HTTPClientService: HTTPClient {
    static let shared = HTTPClientService()
    
    func get (urlString: String, params: String? = nil) -> Observable<NSDictionary> {
        let requetURL = URL(string: urlString)// + "?" + params)
        
        return Observable.create({ (observer) -> Disposable in
            let s = URLSession.shared.dataTask(with: requetURL!) {(data, _, error) in
                if let error = error {
                    observer.onError(error)
                }
                
                guard let data = data, let json = try? JSONSerialization.jsonObject(with: data, options: []) else {
                    observer.onError(NSError(domain: "Error", code: -901, userInfo: nil))
                    return
                }
                observer.onNext((json as? NSDictionary)!)
            }
            s.resume()
            return Disposables.create()
        })
    }
}
