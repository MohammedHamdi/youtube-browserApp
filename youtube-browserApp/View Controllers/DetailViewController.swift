//
//  DetailViewController.swift
//  youtube-browserApp
//
//  Created by Mohammed Hamdi on 8/4/20.
//  Copyright © 2020 Mohammed Hamdi. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var textView: UITextView!
    
    var video: Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
        
        guard let video = video else { return }
        
        let embedurlString = Constants.YT_EMBED_URL + video.videoId
        
        guard let url = URL(string: embedurlString) else { return }
        let request = URLRequest(url: url)
        webView.load(request)
        
        titleLabel.text = video.title
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        dateLabel.text = df.string(from: video.published)
        
        textView.text = video.description
    }
}
