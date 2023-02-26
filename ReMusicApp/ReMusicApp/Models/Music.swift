//
//  Music.swift
//  ReMusicApp
//
//  Created by moonkey on 2023/02/26.
//

import Foundation


// MARK: - Welcome
struct MusicData: Codable {
    let resultCount: Int
    let results: [Music]
}

// MARK: - Result
struct Music: Codable {
    let artistName: String?
    let albumName: String?
    let songName: String?
    let previewURL: String?
    let imageUrl: String?
    private let releaseDate: String?

    enum CodingKeys: String, CodingKey {
        case artistName
        case albumName = "collectionName"
        case songName = "trackName"
        case previewURL
        case imageUrl = "artworkUrl100"
        case releaseDate
    }
    
    var releaseDateString: String? {
        guard let isoDate = ISO8601DateFormatter().date(from: releaseDate ?? "") else {
            return ""
        }
        let myFormatter = DateFormatter()
        myFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = myFormatter.string(from: isoDate)
        return dateString
    }
}
