//
//  CustomRangeSlider.swift
//  Airbnb
//
//  Created by 백상휘 on 2022/06/02.
//

import UIKit
import QuartzCore

class CustomRangeSlider: UIControl {
    
    var minimumValue: CGFloat = 0.0
    var maximumValue: CGFloat = 1.0
    var lowerValue: CGFloat = 0.2
    var upperValue: CGFloat = 0.8
    
    let (trackLayer, lowerThumbLayer, upperThumbLayer) = (CustomRangeSliderTrackLayer(), CustomRangeSliderThumbLayer(), CustomRangeSliderThumbLayer())
    
    var trackTintColor = UIColor.getGrayScale(.Grey4)
    var trackHighlightTintColor = UIColor.getGrayScale(.Grey3)
    var thumbTintColor = UIColor.white
    
    var curvanceousness: CGFloat = 1.0
    
    var thumbWidth: CGFloat {
        CGFloat(bounds.height)
    }
    
    var previousLocation = CGPoint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        trackLayer.rangeSlider = self
        trackLayer.contentsScale = UIScreen.main.scale
        trackLayer.backgroundColor = UIColor.getGrayScale(.Grey3)?.cgColor
        layer.addSublayer(trackLayer)
        
        lowerThumbLayer.rangeSlider = self
        lowerThumbLayer.contentsScale = UIScreen.main.scale
        layer.addSublayer(lowerThumbLayer)
        
        upperThumbLayer.rangeSlider = self
        upperThumbLayer.contentsScale = UIScreen.main.scale
        layer.addSublayer(upperThumbLayer)
        
        updateLayerFrames()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func updateLayerFrames() {
        trackLayer.frame = bounds.insetBy(dx: 0.0, dy: (bounds.height / 2) - 1)
        trackLayer.setNeedsDisplay()

        let lowerThumbCenter = CGFloat(positionForValue(value: lowerValue))
        
        lowerThumbLayer.frame = CGRect(
                x: lowerThumbCenter - thumbWidth / 2.0,
                y: 0.0,
                width: thumbWidth,
                height: thumbWidth
        )
        lowerThumbLayer.contents = UIImage(named: "PauseCircle")?.cgImage
        
        let upperThumbCenter = CGFloat(positionForValue(value: upperValue))
        
        upperThumbLayer.frame = CGRect(
                x: upperThumbCenter - thumbWidth / 2.0,
                y: 0.0,
                width: thumbWidth,
                height: thumbWidth
        )
        upperThumbLayer.contents = UIImage(named: "PauseCircle")?.cgImage
    }
    
    func positionForValue(value: Double) -> Double {
        Double(bounds.width - thumbWidth) * (value - minimumValue) / (maximumValue - minimumValue) + Double(thumbWidth / 2.0)
    }
    
    func boundsValue(value: Double, toLowerValue lowerValue: Double, upperValue: Double) -> Double {
        return min(max(value, lowerValue), upperValue)
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        previousLocation = touch.location(in: self)
        
        if lowerThumbLayer.frame.contains(previousLocation) {
            lowerThumbLayer.highlighted = true
        } else if upperThumbLayer.frame.contains(previousLocation) {
            upperThumbLayer.highlighted = true
        }
        
        return lowerThumbLayer.highlighted || upperThumbLayer.highlighted
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let location = touch.location(in: self)
        
        let deltaLocation = Double(location.x - previousLocation.x)
        let deltaValue = (maximumValue - minimumValue) * deltaLocation / Double(bounds.width - thumbWidth)
        
        previousLocation = location
        
        if lowerThumbLayer.highlighted {
            lowerValue += deltaValue
            lowerValue = boundsValue(value: lowerValue, toLowerValue: minimumValue, upperValue: upperValue)
        } else if upperThumbLayer.highlighted {
            upperValue += deltaValue
            upperValue = boundsValue(value: upperValue, toLowerValue: lowerValue, upperValue: maximumValue)
        }
        
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        
        updateLayerFrames()
        
        CATransaction.commit()
        
        sendActions(for: .valueChanged)
        
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        lowerThumbLayer.highlighted = false
        upperThumbLayer.highlighted = false
    }
}
