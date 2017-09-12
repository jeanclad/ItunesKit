//
//  ChartClient.swift
//  ITunesKit
//
//  Created by jeanclad on 2017. 9. 11..
//  Copyright © 2017년 jeanclad. All rights reserved.
//

import UIKit

class ChartClient: NSObject {
    func fetchChart (completion: @escaping ([NSDictionary]?) -> Void) {
        // fetch the data
        let urlString = "https://itunes.apple.com/kr/rss/topfreeapplications/limit=50/genre=6015/json"
        guard let url = URL(string: urlString) else {
            print("URL is nil")
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
}
