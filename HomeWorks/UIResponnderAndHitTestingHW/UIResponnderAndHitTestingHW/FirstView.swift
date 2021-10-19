//
//  FirstView.swift
//  UIResponnderAndHitTestingHW
//
//  Created by Yunus Abubakarov on 15.10.2021.
//

import UIKit

class FirstView: UIView {

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        //Это область вокруг view где будет работать тап, (вторая часть домашки)
        let touchScopeCircle = UIBezierPath(arcCenter: CGPoint(x: self.bounds.width/2, y: self.bounds.height/2), radius: self.bounds.width/1.5, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        return touchScopeCircle.contains(point)
    }

}
