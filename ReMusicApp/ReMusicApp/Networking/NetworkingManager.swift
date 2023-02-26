//
//  NetworkingManager.swift
//  ReMusicApp
//
//  Created by moonkey on 2023/02/26.
//

import Foundation

enum NetworkError: Error {
    case networkingError
    case dateError
    case parseError
}

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    typealias NetworkCompleion = (Result<[Music], NetworkError>) -> Void
    
    func fetchMusic(searchTerm: String, completion: @escaping NetworkCompleion) {
        let urlString = "\(MusicApi.requestUrl)\(MusicApi.mediaParam)&term=\(searchTerm)"
        print(urlString)
        performRequest(with: urlString, completion: completion)
    }
    private func performRequest(with urlString: String, completion: @escaping NetworkCompleion) {
        guard let url = URL(string: urlString) else {return}
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { (data,res,error) in
            if error != nil {
                completion(.failure(.networkingError))
                return
            }
            
            guard let safeData = data else {
                completion(.failure(.dateError))
                return
            }
            
            if let musics = self.parseJSON(safeData) {
                print("parsing...")
                completion(.success(musics))
            } else {
                print("parsing failed")
                completion(.failure(.parseError))
            }
        }
        task.resume()
    }
    private func parseJSON(_ musicData: Data) -> [Music]? {
        do {
            let musicData = try JSONDecoder().decode(MusicData.self, from: musicData)
            return musicData.results
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
