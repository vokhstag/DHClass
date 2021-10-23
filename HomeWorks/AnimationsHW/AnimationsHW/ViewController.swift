//
//  ViewController.swift
//  AnimationsHW
//
//  Created by Yunus Abubakarov on 19.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playAnimationButton: UIButton!
    @IBOutlet weak var progressBarView: ProgressBarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setup()
    }

    @IBAction func playAnimationTouched(_ sender: Any) {
        progressBarView.animate()
    }
    
}

//MARK: - Setup
private extension ViewController {
    func setup() {
        playAnimationButton.layer.cornerRadius = 24
    }
}

