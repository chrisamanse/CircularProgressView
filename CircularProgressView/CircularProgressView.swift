//
//  CircularProgressView.swift
//  CircularProgressView
//
//  Created by Chris Amanse on 5/2/15.
//  Copyright (c) 2015 Joe Christopher Paul Amanse. All rights reserved.
//

import UIKit

@IBDesignable
class CircularProgressView: UIView {
    // MARK: - Layers
    
    let trackLayer: CAShapeLayer = CAShapeLayer()
    let progressLayer: CAShapeLayer = CAShapeLayer()
    
    // MARK: - Properties
    
    @IBInspectable var trackWidth: CGFloat = 5.0 {
        didSet {
            redrawTrackSublayer()
            redrawProgressSublayer()
        }
    }
    
    @IBInspectable var trackColor: UIColor = UIColor.darkGrayColor() {
        didSet {
            trackLayer.strokeColor = trackColor.CGColor
        }
    }
    @IBInspectable var progressColor: UIColor = UIColor.lightGrayColor() {
        didSet {
            progressLayer.strokeColor = progressColor.CGColor
        }
    }
    @IBInspectable var progress: Double = 0 {
        didSet {
            redrawProgressSublayer()
        }
    }
    
    // MARK: - Drawing
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Redraw layers to keep center and proportional
        redrawTrackSublayer()
        redrawProgressSublayer()
    }
    
    func redrawTrackSublayer() {
        let frameWidth = frame.width
        let frameHeight = frame.height
        let side: CGFloat = (frameWidth < frameHeight) ? frameWidth : frameHeight
        let trackCenter = CGPoint(x: frameWidth / 2, y: frameHeight / 2)
        
        let radius = (side - trackWidth) / 2
        let trackPath = UIBezierPath()
        trackPath.moveToPoint(CGPoint(x: trackCenter.x + radius, y: trackCenter.y))
        trackPath.addArcWithCenter(trackCenter, radius: radius, startAngle: 0, endAngle: CGFloat(2 * M_PI), clockwise: true)

        trackLayer.path = trackPath.CGPath
        trackLayer.lineWidth = trackWidth
    }
    
    func redrawProgressSublayer() {
        let frameWidth = frame.width
        let frameHeight = frame.height
        let side: CGFloat = (frameWidth < frameHeight) ? frameWidth : frameHeight
        let trackCenter = CGPoint(x: frameWidth / 2, y: frameHeight / 2)
        
        let radius = (side - trackWidth) / 2
        let progressPath = UIBezierPath()
        progressPath.moveToPoint(CGPoint(x: trackCenter.x, y: trackCenter.y - radius))
        progressPath.addArcWithCenter(trackCenter, radius: radius, startAngle: CGFloat(-M_PI_2), endAngle: CGFloat(progress*2*M_PI - M_PI_2), clockwise: true)
        
        progressLayer.path = progressPath.CGPath
        progressLayer.lineWidth = trackWidth
    }
    
    // MARK: - Initialization
    
    func commonInitialization() {
        // Add track layer
        trackLayer.opacity = 1
        trackLayer.strokeColor = trackColor.CGColor
        trackLayer.fillColor = nil
        layer.addSublayer(trackLayer)
        
        // Add progress layer
        progressLayer.opacity = 1
        progressLayer.strokeColor = progressColor.CGColor
        progressLayer.fillColor = nil
        layer.addSublayer(progressLayer)
    }
    
    // MARK: Live Render IB
    override func prepareForInterfaceBuilder() {
        commonInitialization()
    }
    
    // MARK: IB load
    override func awakeFromNib() {
        commonInitialization()
    }
    
    // MARK: Programmatic
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Initialize sublayers
        commonInitialization()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init(frame: CGRect, trackWidth: CGFloat, progress: Double) {
        self.init(frame: frame)
        self.trackWidth = trackWidth
        self.progress = progress
    }
}
