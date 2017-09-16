//
//  ChartModel.swift
//  ITunesKit
//
//  Created by jeanclad on 2017. 9. 15..
//  Copyright © 2017년 jeanclad. All rights reserved.
//

import Foundation
import ObjectMapper

class ChartModel: Mappable {
    var feed: Feed?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        feed <- map["feed"]
    }
}

class Feed: Mappable {
    var entries: [Entry]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        entries <- map["entry"]
    }
}

class Entry: Mappable {
    var imName: ImImage?
    var imImages: [ImImage]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        imName <- map["im:name"]
        imImages <- map["im:image"]
    }
}

class ImName: Mappable {
    var label: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        label <- map["label"]
    }
}

class ImImage: Mappable {
    var label: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        label <- map["label"]
    }
}
