//
//  VideoTableViewCell.swift
//  youtube-browserApp
//
//  Created by Mohammed Hamdi on 8/4/20.
//  Copyright © 2020 Mohammed Hamdi. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var video: Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func setCell(_ v: Video) {
        self.video = v
        
        guard let video = self.video else { return }
        
        // Set Title
        self.titleLabel.text = video.title
        
        // Set Date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video.published)
        
        // Set Thumbnail
        guard video.thumbnail != "" else { return }
        
        // Check cache before downloading data
        if let cachedData = CacheManager.getVideoCache(video.thumbnail) {
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
        
        guard let url = URL(string: video.thumbnail) else { return }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            
            if error == nil && data != nil {
                
                // Save the data in the cache
                CacheManager.setVideoCache(url.absoluteString, data)
                
                // Check that the downloaded url matches the video thumbnail url that the cell should display
                if url.absoluteString != self.video?.thumbnail {
                    return
                }
                
                let image = UIImage(data: data!)
                
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
            }
        }
        
        dataTask.resume()
    }
}
