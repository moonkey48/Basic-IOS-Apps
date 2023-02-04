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
    var timer: Timer?
    
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
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [weak self] _ in
            self?.currentTime -= 1
            let timeChanged = self?.currentTime ?? 0
            self?.mainLabel.text = "\(timeChanged)초"
            self?.slider.value = Float(timeChanged)/Float(60)
            
            if self?.currentTime == 0 {
                self?.timer?.invalidate()
                self?.configureFunc()
                self?.mainLabel.text = "END"
                AudioServicesPlayAlertSound(SystemSoundID(1322))
            }
        })
    }
}

