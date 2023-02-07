//
//  ViewController.swift
//  BMI
//
//  Created by moonkey on 2023/02/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    var bmi: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    private func makeUI(){
        heightTextField.delegate = self
        weightTextField.delegate = self
        
        mainLabel.text = "키와 몸무게를 입력하세요"
        
        calculateButton.setTitle("BMI 계산하기", for: .normal)
        calculateButton.layer.cornerRadius = 5
        calculateButton.clipsToBounds = true
        
        heightTextField.placeholder = "cm 단위로 입력하세요"
        weightTextField.placeholder = "kg 단위로 입력하세요"
    }

    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        bmi = calculateBMI(weight:  weightTextField.text!, height: heightTextField.text!)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if heightTextField.text == "" || weightTextField.text == "" {
            mainLabel.text = "키와 몸무게 모두 입력해주세요"
            mainLabel.textColor = .red
            return false
        }
        mainLabel.text = "키와 몸무게를 입력하세요"
        mainLabel.textColor = .black
        return true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC" {
            let secondVC = segue.destination as! SecondViewController
            secondVC.bmiNumber = self.bmi
            secondVC.bmiColor = getBackgroundColor()
            secondVC.bmiString = getBMIAdviceString()
        }
        heightTextField.text = ""
        weightTextField.text = ""
    }
    
    func calculateBMI(weight: String, height: String) -> Double {
        guard let w = Double(weight), let h = Double(height) else { return 0.0 }
        var bmi = w / (h * h) * 10000
        bmi = round(bmi * 10) / 10
        return bmi
    }
    
    func getBackgroundColor() -> UIColor {
        guard let bmi = bmi else { return UIColor.black }
        switch bmi {
        case ..<18.6:
            return .brown
        case 18.6..<23.0:
            return .cyan
        case 23.0..<25.0:
            return .gray
        case 25.0..<30.0:
            return .orange
        case 30.0...:
            return .red
        default:
            return .black
        }
    }
    
    func getBMIAdviceString() -> String {
        guard let bmi = bmi else { return "" }
        switch bmi {
        case ..<18.6:
            return "저체중"
        case 18.6..<23.0:
            return "표준"
        case 23.0..<25.0:
            return "과체중"
        case 25.0..<30.0:
            return "중도비만"
        case 30.0...:
            return "고도비만"
        default:
            return ""
        }
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if Int(string) != nil || string == "" {
            return true
        }
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if heightTextField.text != "", weightTextField.text != "" {
            weightTextField.resignFirstResponder()
            return true
        } else if heightTextField.text != "" {
            weightTextField.becomeFirstResponder()
            return true
        }
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        heightTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
    }
}

