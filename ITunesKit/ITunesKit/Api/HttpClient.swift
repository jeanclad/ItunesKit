//
//  HttptClient.swift
//  ITunesKit
//
//  Created by jeanclad on 2017. 9. 11..
//  Copyright © 2017년 jeanclad. All rights reserved.
//

import UIKit

class HttpClient: NSObject {
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
