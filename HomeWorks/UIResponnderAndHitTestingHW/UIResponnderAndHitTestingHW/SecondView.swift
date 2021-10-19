//
//  SecondView.swift
//  UIResponnderAndHitTestingHW
//
//  Created by Yunus Abubakarov on 13.10.2021.
//

import UIKit

class SecondView: UIView {

    
    override func draw(_ rect: CGRect) {
        let innerCircle = UIBezierPath(arcCenter: CGPoint(x: self.bounds.width/2, y: self.bounds.height/2), radius: self.bounds.width/4, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        let outerCircle = UIBezierPath(arcCenter: CGPoint(x: self.bounds.width/2, y: self.bounds.height/2), radius: self.bounds.width/2, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        outerCircle.append(innerCircle)
        let donut = CAShapeLayer()
        donut.path = outerCircle.cgPath
        donut.fillColor = UIColor.red.cgColor
        self.layer.addSublayer(donut)
        
        donut.fillRule = .evenOdd
    }
    
    
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let innerCircle = UIBezierPath(arcCenter: CGPoint(x: self.bounds.width/2, y: self.bounds.height/2), radius: self.bounds.width/4, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        let outerCircle = UIBezierPath(arcCenter: CGPoint(x: self.bounds.width/2, y: self.bounds.height/2), radius: self.bounds.width/2, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        if innerCircle.contains(point) {
            return false
        } else if outerCircle.contains(point) {
            return true
        } else {
            return false
        }
    }
    
}
