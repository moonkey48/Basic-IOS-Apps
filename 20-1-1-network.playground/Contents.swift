import UIKit

let userURL = "https://jsonplaceholder.typicode.com/users/1"
let structURL = URL(string: userURL)!
let userSession = URLSession.shared

userSession.dataTask(with: structURL) { d, r, e in
    if e != nil {
        return
    }
    if let safeData = d {
        //print(String(decoding: safeData, as: UTF8.self))
        let parseCompany = parseUser(safeData)
        dump(parseCompany!)
    }
}.resume()

func parseUser(_ userData: Data) -> Company? {
    do {
        let decoder = JSONDecoder()
        let decodedData = try decoder.decode(User.self, from: userData)
        return decodedData.company
    } catch {
        return nil
    }
}

// MARK: - WelcomeElement
struct User: Codable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String
}

// MARK: - Company
struct Company: Codable {
    let name, catchPhrase, bs: String
}
