//
//  ArcView.swift
//  LowesArc
//
//  Created by Sharma, Manu - Manu on 7/6/15.
//  Copyright (c) 2015 Manu Sharma. All rights reserved.
//

import UIKit

let π:CGFloat = CGFloat(M_PI)

@IBDesignable public class MSHArcView: UIView {
    
    private let maxValue = 100
    private let circularTrack = CAShapeLayer()
    private let circularProgress = CAShapeLayer()
    private let animationTimeInSeconds: CFTimeInterval = 0.75
    private let arcWidth: CGFloat = 7

    private var path: UIBezierPath!
    
    @IBInspectable public var counter: Int = 60 { didSet { setupViews() } }
    @IBInspectable public var progressColor: UIColor = UIColor(netHex: 0x29b9e7) { didSet { setupViews() } }
    @IBInspectable public var trackColor: UIColor = UIColor(netHex: 0xdfdfe0) { didSet { setupViews() } }
    @IBInspectable public var animation: Bool = true { didSet {setupViews () } }
    
    public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeView()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initializeView()
    }
    
    override public var frame: CGRect {
        didSet {
            setupViews()
        }
    }
    
    private func initializeView() {
        layer.addSublayer(circularTrack)
        layer.addSublayer(circularProgress)
        setupViews()
    }
    
    private func setupViews() {
        
        let center = CGPoint(x:bounds.width/2, y: bounds.height/2)
        let radius: CGFloat = max(bounds.width, bounds.height)
        let startAngle: CGFloat = 3 * π / 4
        let endAngle: CGFloat = π / 4
        path = UIBezierPath(arcCenter: center,
            radius: radius/2 - arcWidth/2,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: true)
        
        circularTrack.lineWidth = arcWidth
        circularTrack.lineCap = kCALineCapRound
        circularTrack.strokeColor = trackColor.CGColor
        circularTrack.fillColor = UIColor.clearColor().CGColor
        circularTrack.path = path.CGPath
        
        if (animation == true) {
            animateProgressFrom(0, toValue: CGFloat(counter)/100)
        } else {
            animateProgressFrom(CGFloat(counter)/100, toValue: CGFloat(counter)/100)
        }
    }
    
    
    func animateProgressFrom (value: CGFloat, toValue: CGFloat) {
        circularProgress.strokeEnd = value

        let animation = CABasicAnimation(keyPath: "strokeEnd")

        circularProgress.lineCap = kCALineCapRound
        circularProgress.lineWidth = arcWidth
        circularProgress.strokeColor = progressColor.CGColor
        circularProgress.fillColor = UIColor.clearColor().CGColor
        circularProgress.path = path.CGPath

        animation.fromValue = value
        animation.toValue = toValue
        animation.duration = animationTimeInSeconds
        animation.delegate = self
        animation.removedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        circularProgress.addAnimation(animation, forKey: "strokeEnd")

    }
}
