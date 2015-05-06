# CircularProgressView

A circular progress view for iOS implemented in Swift.

![alt tag](https://christopheramanse.files.wordpress.com/2015/05/circularprogressview.png)

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

The MIT License (MIT)

Copyright (c) 2015 Joe Christopher Paul Amanse

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
