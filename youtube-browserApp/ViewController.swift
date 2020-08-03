//
//  ViewController.swift
//  youtube-browserApp
//
//  Created by Mohammed Hamdi on 8/2/20.
//  Copyright © 2020 Mohammed Hamdi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos()
    }


}

