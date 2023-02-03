//
//  ViewController.swift
//  RPS
//
//  Created by moonkey on 2023/02/03.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var computerImageView: UIImageView!
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var computerLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    
    var comChoice: Rps = Rps(rawValue: Int.random(in: 0...2))!
    var userChoice: Rps = Rps.rock
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBasicInfo()
    }
    
    
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        
        guard let title = sender.currentTitle else { return }
 
        switch title {
        case "가위":
            userChoice = .scissors
            userLabel.text = "가위"
        case "바위":
            userChoice = .rock
            userLabel.text = "바위"
        case "보":
            userChoice = .paper
            userLabel .text = "보"
        default:
            break
        }
    }
    
    func handleSwitching(choice: Rps,viewElem: UIImageView, labelElem: UILabel) {
        switch choice {
        case .scissors:
            viewElem.image = UIImage(named: "scissors.png")
            labelElem.text = "가위"
        case .rock:
            viewElem.image = UIImage(named: "rock.png")
            labelElem.text = "바위"
        case .paper:
            viewElem.image = UIImage(named: "paper.png")
            labelElem.text = "보"
        }
    }
    
    func setBasicInfo(){
        computerLabel.text = "준비"
        computerImageView.image = #imageLiteral(resourceName: "ready")
        userLabel.text = "준비"
        userImageView.image = #imageLiteral(resourceName: "ready")
        
        mainLabel.text = "선택하세요"
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {

        handleSwitching(choice: userChoice, viewElem: userImageView, labelElem: userLabel)
        comChoice = Rps(rawValue: Int.random(in: 0...2))!

        handleSwitching(choice: comChoice, viewElem: computerImageView, labelElem: computerLabel)
        
        
        if userChoice == comChoice {
            mainLabel.text = "비겼다"
        } else if userChoice == .paper && comChoice == .rock {
            mainLabel.text = "이겼다"
        }  else if userChoice == .scissors && comChoice == .paper {
            mainLabel.text = "이겼다"
        } else if userChoice == .rock && comChoice == .scissors {
            mainLabel.text = "이겼다"
        } else {
            mainLabel.text = "졌다"
        }
        
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        setBasicInfo()
    }
}

