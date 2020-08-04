//
//  ViewController.swift
//  youtube-browserApp
//
//  Created by Mohammed Hamdi on 8/2/20.
//  Copyright © 2020 Mohammed Hamdi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        model.delegate = self
        
        model.getVideos()
    }
    
    // MARK:- Model Delegate Methods
    func videosFetched(_ videos: [Video]) {
        
        self.videos = videos
        
        tableView.reloadData()
    }

    // MARK:- TableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        let video = self.videos[indexPath.row]
        cell.setCell(video)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedIndexPath = tableView.indexPathForSelectedRow else { return }
        
        let selectedVideo = videos[selectedIndexPath.row]
        
        let detailVC = segue.destination as! DetailViewController
        
        detailVC.video = selectedVideo
    }
}

