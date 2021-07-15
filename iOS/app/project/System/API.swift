//
//  JSONFetcher.swift
//  project
//
//  Created by Shaheen Ghiassy on 7/15/21.
//

import UIKit

class API {
    class Fetch { // just for namespacing
        static func data(_ url:URL, onComplete:@escaping (Foundation.Data)->()) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    onComplete(data)
                }
            }.resume()
        }

        static func model<T:Decodable>(_ url:URL, type:T.Type, onComplete:@escaping (T)->()) {
            API.Fetch.data(url) { data in
                do {
                    let res = try JSONDecoder().decode(T.self, from: data)
                    onComplete(res)
                } catch let error {
                    print(error)
                }
            }
        }

        static func image(_ url:URL, onComplete:@escaping (UIImage)->()) {
            API.Fetch.data(url) { data in
                DispatchQueue.global(qos: .userInteractive).async {
                    kdebug_signpost_start(10, 0, 0, 0, 0) // Measure Image creation time
                    if let image = UIImage(data: data) {
                        kdebug_signpost_end(10, 0, 0, 0, 0)
                        onComplete(image)
                    }
                }
            }
        }
    }
}
