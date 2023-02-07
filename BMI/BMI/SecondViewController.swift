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
    
    var bmiNumber: Double?
    var bmiString: String?
    var bmiColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    private func makeUI(){
        backButton.clipsToBounds = true
        backButton.layer.cornerRadius = 5
        
        
        guard let bmiNumber = bmiNumber else {return}
        bmiNumberLabel.text = String(bmiNumber)
        
        //어차피 optional이라 guard가 필요 없다.
        adiviceLabel.text = bmiString
        bmiNumberLabel.backgroundColor = bmiColor
    }
    
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
