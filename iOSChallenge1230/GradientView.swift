//
//  GradientView.swift
//  iOSChallenge1230
//
//  Created by Jordan Olson on 1/1/16.
//  Copyright © 2016 JPRODUCTION. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore


private var _orangeColorOne: UIColor! = UIColor.init(red: 1, green: 213/255, blue: 79/255, alpha: 1)
private var _orangeColorTwo: UIColor! = UIColor.init(red: 1, green: 193/255, blue: 7/255, alpha: 1)
private var _orangeColorThree: UIColor! = UIColor.init(red: 1, green: 160/255, blue: 0, alpha: 1)
private var _lightBlueColorOne: UIColor! = UIColor.init(red: 129/255, green: 212/255, blue: 250/255, alpha: 1)
private var _lightBlueColorTwo: UIColor! = UIColor.init(red: 2/255, green: 136/255, blue: 209/255, alpha: 1)
private var _lightBlueColorThree: UIColor! = UIColor.init(red: 1, green: 87/255, blue: 155/255, alpha: 0.5)





var orangeColorOne: UIColor {
    return _orangeColorOne
}

var orangeColorTwo: UIColor {
    return _orangeColorTwo
}

var orangeColorThree: UIColor {
    return _orangeColorThree
}

var lightBlueColorOne: UIColor {
    return _lightBlueColorOne
}

var lightBlueColorTwo: UIColor {
    return _lightBlueColorTwo
}

var lightBlueColorThree: UIColor {
    return _lightBlueColorThree
}



//STOP WORKING ON IT IT LOOKS GREAT W THIS ANIMATION
//ONLY COLOR CHANGE

class GradientViewTwo: UIView {
    
    let gradientLayer: CAGradientLayer = {
        
        let gradientOne = CAGradientLayer()
        
        gradientOne.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientOne.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        let colors = [orangeColorOne.CGColor, orangeColorTwo.CGColor, orangeColorThree.CGColor]
        gradientOne.colors = colors
        
        
        let locations = [0.0, 0.25, 0.75]
        gradientOne.locations = locations
        
        return gradientOne
        
    }()
    
    
    override func didMoveToWindow() {
        layer.addSublayer(gradientLayer)
        let gradientAnimation = CABasicAnimation(keyPath: "locations")
        gradientAnimation.duration = 3.0
        gradientAnimation.repeatCount = Float.infinity
        gradientAnimation.fromValue = [0.0, 0.75, 1.0]
        gradientAnimation.toValue = [0.0, 0.25, 0.5]
        gradientAnimation.autoreverses = true
        gradientLayer.addAnimation(gradientAnimation, forKey: nil)
        
    }
    
    override func layoutSubviews() {
        gradientLayer.frame = CGRect(x: -bounds.size.width, y: bounds.origin.y, width: 4 * bounds.size.width, height: 5 * bounds.size.width)
        
    }
    
}
