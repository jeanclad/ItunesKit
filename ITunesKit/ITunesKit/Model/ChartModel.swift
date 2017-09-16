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
    var imPrice: ImPrice?
    var imImages: [ImImage]?
    var appId: AppId?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        imName <- map["im:name"]
        imImages <- map["im:image"]
        imPrice <- map["im:price"]
        appId <- map["id"]
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

class ImPrice: Mappable {
    var label: String?
    var priceAttr: PriceAttr?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        label <- map["label"]
        priceAttr <- map["attributes"]
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

class PriceAttr: Mappable {
    var amount: String?
    var currency: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        amount <- map["amount"]
        currency <- map["currency"]
    }
}

class AppId: Mappable {
    var idAttr: IdAttr?

    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        idAttr <- map["attributes"]
    }
}

class IdAttr: Mappable {
    var imId: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        imId <- map["im:id"]
    }
}
