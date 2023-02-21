//: [Previous](@previous)

import Foundation

enum NetworkError: Error {
    case someError
}

func performRequest(with url: String, completion: @escaping (Data?, NetworkError?) -> Void) {
    guard let url = URL(string: url) else {return}
    URLSession.shared.dataTask(with: url) { (data, res, err) in
        if err != nil {
            completion(nil, .someError)
            return
        }
        guard let safeData = data else {
            completion(nil, .someError)
            return
        }
        completion(safeData, nil)
    }.resume()
}

performRequest(with: "https://...") { data, error in
    if error != nil {
        print(error)
    }
    //handle Data
}
