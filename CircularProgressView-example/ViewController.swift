//
//  ViewController.swift
//  CircularProgressView-example
//
//  Created by Chris Amanse on 1/13/16.
//  Copyright © 2016 Joe Christopher Paul Amanse. All rights reserved.
//

import UIKit
import CircularProgressView

class ViewController: UIViewController {

    @IBOutlet weak var progressView: CircularProgressView!
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        slider.value = progressView.progress
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didUpdateSliderValue(sender: UISlider) {
        progressView.progress = sender.value
    }
}

