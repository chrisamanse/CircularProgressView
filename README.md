# CircularProgressView

A circular progress view for iOS implemented in Swift.

![](./Images/CircularProgressView.png)

# Features

* Autoresizes proportionally and centers to fit view
* Change track color, and progress color
* Adjustable track width

# Installation

There are a couple of ways to use `CircularProgressView` in your project:

- Manual
  - Simply add CircularProgressView.swift in your project. Then either create an instance of CircularProgressView using code or Interface Builder.
- Carthage
  - Add `github "chrisamanse/CircularProgressView"` in your Cartfile

# Usage

## Programmatically

        let rectProgressView = CGRect(x: 40, y: 40, width: 100, height: 100)
        let progressView = CircularProgressView(frame: rectProgressView, progress: 0.67)
        
        view.addSubview(progressView)

### To change progress, simply change progress property ( Float values pinned to [0,1] )

        progressView.progress = 0.75

### View properties are trackWidth, trackTintColor, progressTintColor

        progressView.trackWidth = 4.0
        progressView.trackTintColor = UIColor.lightGrayColor()
        progressView.progressTintColor = UIColor.darkGrayColor()

## Interface Builder

Just use custom UIView subclass CircularProgressView on UIView in Interface Builder. Its properties can also be changed in IB.

## License

Copyright (c) 2016 Joe Christopher Paul Amanse. This software is distributed under the [MIT License](./LICENSE.md)

