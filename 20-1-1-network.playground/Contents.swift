import UIKit

let userURL = "https://jsonplaceholder.typicode.com/users"
let structURL = URL(string: userURL)!
let userSession = URLSession.shared

userSession.dataTask(with: structURL) { d, r, e in
    if e != nil {
        print(e)
        return
    }
    if let safeData = d {
        print(String(decoding: safeData, as: UTF8.self))
    }
}.resume()
