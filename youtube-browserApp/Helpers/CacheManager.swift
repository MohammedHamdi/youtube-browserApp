//
//  CacheManager.swift
//  youtube-browserApp
//
//  Created by Mohammed Hamdi on 8/4/20.
//  Copyright © 2020 Mohammed Hamdi. All rights reserved.
//

import Foundation

class CacheManager {
    
    static var cache = [String: Data]()
    
    static func setVideoCache(_ url: String, _ data: Data?) {
        cache[url] = data
    }
    
    static func getVideoCache(_ url: String) -> Data? {
        return cache[url]
    }
}
