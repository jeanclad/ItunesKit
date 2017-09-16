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
    var name: Name?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["im:name"]
    }
}

class Name: Mappable {
    var label: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        label <- map["label"]
    }
}

//class ChartModel {
//    var name: String?
//    var imageUrl: String?
//    var amount: String?
//    
////    init(name: String, imageUrl: String, amount: String) {
////        self.name = name
////        self.imageUrl = imageUrl
////        self.amount = amount
////    }
//}
