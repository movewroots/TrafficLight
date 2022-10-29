//
//  ViewController.swift
//  TrafficLight
//
//  Created by Nikita Verkhoturov on 25.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var redView: UIView!
    @IBOutlet var yellowView: UIView!
    @IBOutlet var greenView: UIView!
    
    @IBOutlet var changeLightButton: UIButton!
    
    private var currentLight = CurrentLight.red
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeLightButton.layer.cornerRadius = 10
        
        redView.alpha = lightIsOff
        yellowView.alpha = lightIsOff
        greenView.alpha = lightIsOff
        
    }
    
    override func viewWillLayoutSubviews() {
        redView.layer.cornerRadius = redView.frame.width / 2
        yellowView.layer.cornerRadius = yellowView.frame.width / 2
        greenView.layer.cornerRadius = greenView.frame.width / 2
    }
    
    @IBAction func changeLight() {
        if changeLightButton.currentTitle == "START" {
            changeLightButton.setTitle("NEXT", for: .normal)
        }
        
        switch currentLight {
        case .red:
            greenView.alpha = lightIsOff
            redView.alpha = lightIsOn
            currentLight = .yellow
        case .yellow:
            redView.alpha = lightIsOff
            yellowView.alpha = lightIsOn
            currentLight = .green
        case .green:
            yellowView.alpha = lightIsOff
            greenView.alpha = lightIsOn
            currentLight = .red
        }
    }
}

// MARK: - CurrentLight

extension ViewController {
    enum CurrentLight {
        case red, yellow, green
    }
}
