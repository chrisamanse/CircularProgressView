//
//  ViewController.swift
//  CircularProgressView
//
//  Created by Chris Amanse on 5/2/15.
//  Copyright (c) 2015 Joe Christopher Paul Amanse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressView: CircularProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Create CircularProgressView programmatically
//        let rectProgressView = CGRect(x: 40, y: 40, width: 100, height: 100)
//        let progressView = CircularProgressView(frame: rectProgressView, trackWidth: 10, progress: 0.85)
//        
//        view.addSubview(progressView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderValueDidChange(sender: UISlider) {
        progressView.progress = Double(sender.value)
    }
}

