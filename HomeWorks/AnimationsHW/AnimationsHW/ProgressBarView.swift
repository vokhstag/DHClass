//
//  ProgressBarView.swift
//  AnimationsHW
//
//  Created by Yunus Abubakarov on 19.10.2021.
//

import UIKit

class ProgressBarView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
    
    private let whiteLayer = CAShapeLayer()
    private var redLayer = CAShapeLayer()

    override func draw(_ rect: CGRect) {
        setup()
    }
    
    func animate() {
        let animate = CABasicAnimation(keyPath: #keyPath(CAShapeLayer.path))
        animate.fromValue = redLayer.path
        animate.toValue = whiteLayer.path
        animate.duration = 2
        animate.fillMode = CAMediaTimingFillMode.forwards
        animate.isRemovedOnCompletion = false
        redLayer.add(animate, forKey: nil)
    }

}

private extension ProgressBarView {
    func setup() {
        let roundedRect = CGRect(x: 0, y: 0, width: self.bounds.width, height: 20)
        whiteLayer.path = UIBezierPath(roundedRect: roundedRect, cornerRadius: 10).cgPath
        whiteLayer.fillColor = UIColor.white.cgColor
        self.layer.addSublayer(whiteLayer)
        
        let redRoundedRct = CGRect(x: 0, y: 0, width: 20, height: 20)
        redLayer.path = UIBezierPath(roundedRect: redRoundedRct, cornerRadius: 10).cgPath
        redLayer.fillColor = UIColor.red.cgColor
        self.layer.addSublayer(redLayer)
    }
}
