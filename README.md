# CircularProgressView

A circular progress view for iOS implemented in Swift.

![](./Images/circularprogressview.png)

## Features

* Autoresizes proportionally and centers to fit view
* Change track color, and progress color
* Adjustable track width

## Installation

Simply add CircularProgressView.swift in your project. Then either create an instance of CircularProgressView using code or Interface Builder.

## Usage

### Programmatically

        let rectProgressView = CGRect(x: 40, y: 40, width: 100, height: 100)
        let progressView = CircularProgressView(frame: rectProgressView, trackWidth: 10, progress: 0.85)
        
        view.addSubview(progressView)

#### To change progress, simply change progress property ( Double values from 0 to 1 )

        progressView.progress = 0.75

#### View properties are trackWidth, trackColor, progressColor

        progressView.trackWidth = 5.0
        progressView.trackColor = UIColor.darkGrayColor()
        progressView.progressColor = UIColor.progressColor()

### Interface Builder

Just use custom UIView subclass CircularProgressView on UIView in Interface Builder. Its properties can be changed in IB too.

## License

Copyright (c) 2015 Joe Christopher Paul Amanse. This software is licensed under the [MIT License](./LICENSE.md)

