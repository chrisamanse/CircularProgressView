//
//  ViewController.swift
//  CircularProgressView-example
//
//  Created by Chris Amanse on 2/10/18.
//  Copyright © 2018 Joe Christopher Paul Amanse. All rights reserved.
//

import UIKit
import CircularProgressView

class ViewController: UIViewController {
    @IBOutlet private weak var progressView: CircularProgressView!
    @IBOutlet private weak var slider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.progress = slider.value
    }

    @IBAction func didChangeSliderValue(_ sender: UISlider) {
        progressView.progress = sender.value
    }

    @IBAction func didPressAnimate(_ sender: Any) {
        UIView.animate(withDuration: 3.0) {
            self.progressView.progress = 1.0
        }
    }
}
