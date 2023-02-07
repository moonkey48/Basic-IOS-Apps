//
//  SecondViewController.swift
//  BMI
//
//  Created by moonkey on 2023/02/07.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var bmiNumberLabel: UILabel!
    @IBOutlet weak var adiviceLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    var bmi: BMI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    private func makeUI(){
        backButton.clipsToBounds = true
        backButton.layer.cornerRadius = 5
        
        
        guard let bmi = bmi else {return}
        
        bmiNumberLabel.text = String(bmi.value)
        adiviceLabel.text = bmi.advice
        bmiNumberLabel.backgroundColor = bmi.matchColor
    }
    
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
