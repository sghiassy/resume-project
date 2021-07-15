//
//  JSONFetcher.swift
//  project
//
//  Created by Shaheen Ghiassy on 7/15/21.
//

import Foundation

class API {
    class Fetch { // just for namespacing
        static func data(_ url:URL, onComplete:@escaping (Foundation.Data)->()) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    onComplete(data)
                }
            }.resume()
        }

        static func model<T:Decodable>(_ url:URL, type: T.Type, onComplete:@escaping (T)->()) {
            API.Fetch.data(url) { data in
                do {
                    let res = try JSONDecoder().decode(T.self, from: data)
                    onComplete(res)
                } catch let error {
                    print(error)
                }
            }
        }
    }
}
