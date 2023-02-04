//
//  ViewController.swift
//  UpDownGame
//
//  Created by moonkey on 2023/02/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    var randomNum = Int.random(in: 0...100)
    
    func setDefaultLabel(){
        mainLabel.text = "선택하세요"
        numberLabel.text = ""
        randomNum = Int.random(in: 0...100)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultLabel()
    }


    @IBAction func buttonTapped(_ sender: UIButton) {
        guard let input = sender.currentTitle else {
            return
        }
        if let numberText = numberLabel.text {
            numberLabel.text = numberText + String(describing: input)
        }
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        if let numValue = numberLabel.text {
            if Int(numValue)! < randomNum {
                mainLabel.text = "UP"
            } else if Int(numValue)! > randomNum {
                mainLabel.text = "DOWN"
            } else {
                mainLabel.text = "BINGO"
            }
        }
        numberLabel.text = ""
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        setDefaultLabel()
    }
    
}

