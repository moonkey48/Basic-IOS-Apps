//
//  ViewController.swift
//  MyFirstApp
//
//  Created by moonkey on 2023/02/02.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mainLabel: UILabel!
    
    //앱의 화면에 들어오면 처음 실행시키는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if mainLabel.text == "안녕하세요" {
            mainLabel.text = "반갑습니다"
        } else {
            mainLabel.text = "안녕하세요"
        }
        mainLabel.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
}

