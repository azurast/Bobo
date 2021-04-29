//
//  RecordingViewController.swift
//  Bobo
//
//  Created by Azura Sakan Taufik on 29/04/21.
//

import UIKit

class RecordingViewController: UIViewController {

    @IBOutlet weak var audioButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func onTap(_ sender: Any) {
        let pulse = PulsingCALayer(numberOfPulses: 1, radius: 110, position: audioButton.center)
        pulse.animationDuration = 0.8
        pulse.backgroundColor = UIColor.init(named: "BoboBlue")?.cgColor
        self.view.layer.insertSublayer(pulse, below: audioButton.layer)
    }
    
}
