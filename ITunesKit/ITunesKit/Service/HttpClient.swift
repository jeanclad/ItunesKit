//
//  HttptClient.swift
//  ITunesKit
//
//  Created by jeanclad on 2017. 9. 11..
//  Copyright © 2017년 jeanclad. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HttpClient: NSObject {
    fileprivate let bag = DisposeBag()
    
    func fecthHttpResponse(url: String) {
        
        //        let response =
        Observable.from(optional: url)
            .map { (urlString) -> URL in
                return URL(string: urlString)!
            }.flatMap { (url) -> Observable<(HTTPURLResponse, Data)> in
                return URLSession.shared.rx.response(request: URLRequest(url: url))
            }.shareReplay(1)
            //                .response
            .filter { response, _ in
                return 200..<300 ~= response.statusCode
            }
            .map {reponse, data -> NSDictionary in
                guard let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []),
                    let result = jsonObject as? NSDictionary else {
                        return [:]
                }
                return result
            }
            .filter { objects in
                return objects.count > 0
            }
//            .map { objects in
//                return objects.flatMap(Event.init)
//            }
            .subscribe(onNext: { [weak self] newEvents in
                print(newEvents)
            })
            .addDisposableTo(bag)
    }
    
    internal func fetchChart (completion: @escaping ([NSDictionary]?) -> Void) {
        // fetch the data
        let urlString = "https://itunes.apple.com/kr/rss/topfreeapplications/limit=50/genre=6015/json"
        guard let url = URL(string: urlString) else {
            print("URL is nil")
            completion(nil)
            return
        }
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print("Error occured: \(String(describing: error))")
                completion(nil)
                return
            }
            
            if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary else {
                    print("Error: JSON Deserialized")
                    completion(nil)
                    return
                }
                
                let chart = json?.value(forKeyPath: "feed.entry") as? [NSDictionary]
                completion(chart)
                return
            }
            
            completion(nil)
            return
        }
        task.resume()
        
        // call the completion block
    }
    
    internal func fetchAppInfo (appId: String?, completion: @escaping (NSArray?) -> Void) {
        // fetch the data
        guard appId != nil else {
            return
        }
        
        let urlString = "https://itunes.apple.com/lookup?id=\(appId!)&country=kr"
        guard let url = URL(string: urlString) else {
            print("URL is nil")
            completion(nil)
            return
        }
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print("Error occured: \(String(describing: error))")
                completion(nil)
                return
            }
            
            if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary else {
                    print("Error: JSON Deserialized")
                    completion(nil)
                    return
                }
                
                let results = json?.value(forKey: "results") as? NSArray
                completion(results)
                return
            }
            
            completion(nil)
            return
        }
        task.resume()
        
        // call the completion block
    }
}
