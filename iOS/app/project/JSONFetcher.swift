//
//  JSONFetcher.swift
//  project
//
//  Created by Shaheen Ghiassy on 7/15/21.
//

import Foundation

class API {
    static func fetch(_ url:URL, onComplete:@escaping (Data)->()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                onComplete(data)
            }
        }.resume()
    }
}

