//
//  SecondViewController.swift
//  BMI
//
//  Created by moonkey on 2023/02/07.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var bmiumberLabel: UILabel!
    
    @IBOutlet weak var adiviceLabel: UILabel!
    
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    private func makeUI(){
        backButton.clipsToBounds = true
        backButton.layer.cornerRadius = 5
    }
    
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
