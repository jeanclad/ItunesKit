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
import ObjectMapper

protocol HTTPClient {
    func get(urlString: String, params: String?) -> Observable<NSDictionary>
}

public class HTTPClientService: HTTPClient {
    public static let shared = HTTPClientService()
    
    public func get (urlString: String, params: String? = nil) -> Observable<NSDictionary> {
        return Observable.from(optional: urlString)
            .map { (urlString) -> URL in
                return URL(string: urlString)!
            }
            .flatMap { (url) -> Observable<(HTTPURLResponse, Data)> in
                return URLSession.shared.rx.response(request: URLRequest(url: url))
            }
            .filter { response, _ in
                return 200..<300 ~= response.statusCode
            }
            .map { _, data -> NSDictionary in
                guard let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []),
                    let result = jsonObject as? NSDictionary else {
                        return [:]
                }
                return result
            }
            .filter { objects in
                return objects.count > 0
        }
    }
}
