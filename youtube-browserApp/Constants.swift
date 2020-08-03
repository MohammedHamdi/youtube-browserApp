//
//  Constants.swift
//  youtube-browserApp
//
//  Created by Mohammed Hamdi on 8/3/20.
//  Copyright © 2020 Mohammed Hamdi. All rights reserved.
//

import Foundation

struct Constants {
    
    static var API_KEY = YOUTUBE_API_KEY
    static var PLAYLIST_ID = "UUBJycsmduvYEL83R_U4JriQ"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
}
