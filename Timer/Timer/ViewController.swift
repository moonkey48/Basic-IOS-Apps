//
//  ViewController.swift
//  Timer
//
//  Created by moonkey on 2023/02/04.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var mainLabel: UILabel!
    var currentTime: Int = 30
    weak var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func configureFunc(){
        slider.value = 0.5
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        currentTime = Int(round(60 * sender.value))
        mainLabel.text = "\(currentTime)초"
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        slider.setValue(0.5, animated: true)
        timer?.invalidate()
        currentTime = 0
        mainLabel.text = "초를 선택하세요"
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        //기존에 timer 가 동작하면 멈추기
        if currentTime <= 0 {
            return
        }
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(repeatingFunction), userInfo: nil, repeats: true)
    }
    
    @objc func repeatingFunction(){
        currentTime -= 1
        let timeChanged = currentTime
        mainLabel.text = "\(timeChanged)초"
        slider.value = Float(timeChanged)/Float(60)
        
        if currentTime == 0 {
            timer?.invalidate()
            configureFunc()
            mainLabel.text = "END"
            AudioServicesPlayAlertSound(SystemSoundID(1322))
        }
    }
    
}

