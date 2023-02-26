//
//  Constants.swift
//  ReMusicApp
//
//  Created by moonkey on 2023/02/26.
//

import Foundation

public enum MusicApi {
    static let requestUrl = "https://itunes.apple.com/search?"
    static let mediaParam = "media=music"
}

public struct Cell {
    static let musicCellIdentifier = "MusicCell"
    static let musicCollectionViewCellIdentifier = "MusicColltionViewCell"
    private init(){}
}

public struct CVCell {
    static let spacingWidth: CGFloat = 1
    static let cellColumn: CGFloat = 3
    private init() {}
}
