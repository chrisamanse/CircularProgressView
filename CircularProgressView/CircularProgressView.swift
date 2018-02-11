//
//  CircularProgressView.swift
//  CircularProgressView
//
//  Created by Chris Amanse on 2/10/18.
//  Copyright © 2018 Joe Christopher Paul Amanse. All rights reserved.
//

import UIKit

@IBDesignable
open class CircularProgressView: UIView {
    @IBInspectable
    open var trackLineWidth: CGFloat = 1 {
        didSet {
            layoutTrackLayer()
            layoutProgressLayer()
        }
    }

    @IBInspectable
    open var trackTintColor: UIColor = .white {
        didSet {
            colorTrackLayer()
        }
    }

    private var _customProgressTintColor: UIColor?
    @IBInspectable
    open var progressTintColor: UIColor? {
        get {
            return _customProgressTintColor ?? tintColor
        }
        set {
            _customProgressTintColor = newValue
            colorProgressLayer()
        }
    }

    private let centerSquareGuideLayer = CALayer()
    private let trackLayer = CAShapeLayer()
    private var trackLayerPath: UIBezierPath {
        let trackRectInset = trackLineWidth / 2
        let trackRectWithInset = centerSquareGuideLayer.bounds.insetBy(dx: trackRectInset, dy: trackRectInset)
        return UIBezierPath(ovalIn: trackRectWithInset)
    }
    private let progressLayer = CAShapeLayer()
    private var progressLayerPath: UIBezierPath {
        let path = UIBezierPath()
        let trackRectInset = trackLineWidth / 2
        let trackRectWithInset = centerSquareGuideLayer.bounds.insetBy(dx: trackRectInset, dy: trackRectInset)
        let radius = trackRectWithInset.width / 2
        let arcCenter = CGPoint(x: trackRectWithInset.midX, y: trackRectWithInset.midY)
        let circleTopPoint = CGPoint(x: arcCenter.x, y: arcCenter.y - radius)
        path.move(to: circleTopPoint)
        path.addArc(withCenter: arcCenter, radius: radius, startAngle: -.pi / 2, endAngle: 2 * .pi - (.pi / 2), clockwise: true)
        return path
    }

    open override func awakeFromNib() {
        super.awakeFromNib()
        setupCustomLayers()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupCustomLayers()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    open override func layoutSubviews() {
        layoutCustomSublayers()
    }

    open override func prepareForInterfaceBuilder() {
        setupCustomLayers()
    }

    private func setupCustomLayers() {
        layoutCustomSublayers()
        colorCustomSublayers()
        centerSquareGuideLayer.addSublayer(trackLayer)
        centerSquareGuideLayer.insertSublayer(progressLayer, above: trackLayer)
        layer.addSublayer(centerSquareGuideLayer)
    }

    private func layoutCustomSublayers() {
        layoutCenterSquareGuideLayer()
        layoutTrackLayer()
        layoutProgressLayer()
    }

    private func layoutCenterSquareGuideLayer() {
        let squareSublayerSideLength = min(layer.bounds.width, layer.bounds.height)
        let squareSublayerOriginOffset = abs(layer.bounds.width - layer.bounds.height) / 2
        let squareSublayerOriginX = layer.bounds.width < layer.bounds.height ? 0 : squareSublayerOriginOffset
        let squareSublayerOriginY = layer.bounds.width < layer.bounds.height ? squareSublayerOriginOffset : 0
        centerSquareGuideLayer.frame = CGRect(x: squareSublayerOriginX, y: squareSublayerOriginY, width: squareSublayerSideLength, height: squareSublayerSideLength)
    }

    private func layoutTrackLayer() {
        trackLayer.frame = centerSquareGuideLayer.bounds
        trackLayer.lineWidth = trackLineWidth
        trackLayer.path = trackLayerPath.cgPath
    }
    private func layoutProgressLayer() {
        progressLayer.frame = centerSquareGuideLayer.bounds
        progressLayer.lineWidth = trackLineWidth
        progressLayer.path = progressLayerPath.cgPath
    }

    private func colorCustomSublayers() {
        // TODO: Remove. For debugging only
        centerSquareGuideLayer.backgroundColor = UIColor.darkGray.cgColor
        colorTrackLayer()
        colorProgressLayer()
    }

    private func colorTrackLayer() {
        trackLayer.strokeColor = trackTintColor.cgColor
        trackLayer.fillColor = UIColor.clear.cgColor
    }

    private func colorProgressLayer() {
        progressLayer.strokeColor = progressTintColor?.cgColor
        progressLayer.fillColor = UIColor.clear.cgColor
    }
}
