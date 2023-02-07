//
//  BMICalculaterManager.swift
//  BMI
//
//  Created by moonkey on 2023/02/07.
//

import UIKit

struct BMICaculaterManager {
    
    var bmi: BMI?
    
    mutating func getBMIResult(weight: String, height: String) -> BMI{
        
        calculateBMI(weight: weight, height: height)
        
        return bmi ?? BMI(value: 0.0, matchColor: .black, advice: "에러발생")
    }
    
    mutating func calculateBMI(weight: String, height: String){
        guard let w = Double(weight), let h = Double(height) else {
            bmi  = BMI(value: 0.0, matchColor: .black, advice: "에러발생")
            return
        }
        var bmiNumber = w / (h * h) * 10000
        bmiNumber = round(bmiNumber * 10) / 10
        
        switch bmiNumber {
        case ..<18.6:
            bmi  = BMI(value: bmiNumber, matchColor: .brown, advice: "저체중")
        case 18.6..<23.0:
            bmi  = BMI(value: bmiNumber, matchColor: .cyan, advice: "표준")
        case 23.0..<25.0:
            bmi  = BMI(value: bmiNumber, matchColor: .gray, advice: "과체중")
        case 25.0..<30.0:
            bmi  = BMI(value: bmiNumber, matchColor: .orange, advice: "중도비만")
        case 30.0...:
            bmi  = BMI(value: bmiNumber, matchColor: .red, advice: "고도비만")
        default:
            bmi  = BMI(value: 0.0, matchColor: .black, advice: "에러 발생")
        }
    }
    
    
}
