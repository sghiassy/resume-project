//
//  JSONFetcher.swift
//  project
//
//  Created by Shaheen Ghiassy on 7/15/21.
//

import Foundation

class API {
    static func fetch(_ url:URL, onComplete:@escaping (String)->()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
          if let data = data {
             if let jsonString = String(data: data, encoding: .utf8) {
    //            print(jsonString)
                onComplete(jsonString)
             }
           }
        }.resume()
    }
}
