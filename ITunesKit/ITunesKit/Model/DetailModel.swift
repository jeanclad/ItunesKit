//
//  DetailModel.swift
//  ITunesKit
//
//  Created by jeanclad on 2017. 9. 16..
//  Copyright © 2017년 jeanclad. All rights reserved.
//

import Foundation
import ObjectMapper

internal class DetailModel: Mappable {
    var resultCount: Int?
    var results: [Result]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        resultCount <- map["resultCount"]
        results <- map["results"]
    }
}

internal class Result: Mappable {
    var trackCensoredName: String?
    var artworkUrl100: String?
    var description: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        trackCensoredName <- map["trackCensoredName"]
        artworkUrl100 <- map["artworkUrl100"]
        description <- map["description"]
    }
}
