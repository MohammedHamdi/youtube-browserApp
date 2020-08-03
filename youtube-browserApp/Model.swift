//
//  Model.swift
//  youtube-browserApp
//
//  Created by Mohammed Hamdi on 8/3/20.
//  Copyright © 2020 Mohammed Hamdi. All rights reserved.
//

import Foundation

class Model {
    
    
    func getVideos() {
        guard let url = URL(string: Constants.API_URL) else { return }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error getting api response: ", error)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601

                let response = try decoder.decode(Response.self, from: data)
                
                dump(response)
            } catch {
                
            }
        }
        
        dataTask.resume()
    }
}
