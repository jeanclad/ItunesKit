//
//  ChartClient.swift
//  ITunesKit
//
//  Created by jeanclad on 2017. 9. 11..
//  Copyright © 2017년 jeanclad. All rights reserved.
//

import UIKit

class ChartClient: NSObject {
    func fetchChart (completion: @escaping ([NSDictionary]?)-> ()) {
        // fetch the data
        let urlString = "https://itunes.apple.com/kr/rss/topfreeapplications/limit=50/genre=6015/json"
        let url = URL(string: urlString)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                completion(nil)
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                    if let chart = json.value(forKeyPath: "feed.entry") as? [NSDictionary] {
                        completion(chart)
                        return
                    }
                }
            } catch let error as NSError {
                print(error)
            }
            
        }
        task.resume()
        
        // call the completion block
    }
}
