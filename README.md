# CircularProgressView

A circular progress view for iOS implemented in Swift.

## Features

* Autoresizes proportionally and centers to fit view
* Change track color, and progress color
* Adjustable track width

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
