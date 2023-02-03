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
        // Do any additional setup after loading the view.
        computerImageView.image = #imageLiteral(resourceName: "ready")
        userImageView.image = #imageLiteral(resourceName: "ready")
        
        computerLabel.text = "준비"
        userLabel.text = "준비"
    }
    
    
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle else {
            return
        }
        
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
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        //handle userturn
        switch userChoice {
        case .scissors:
            userImageView.image = UIImage(named: "scissors.png")
            userLabel.text = "가위"
        case .rock:
            userImageView.image = UIImage(named: "rock.png")
            userLabel.text = "바위"
        case .paper:
            userImageView.image = UIImage(named: "paper.png")
            userLabel.text = "보"
        }
        comChoice = Rps(rawValue: Int.random(in: 0...2))!
        
        
        switch comChoice {
        case .scissors:
            computerImageView.image = UIImage(named: "scissors.png")
            computerLabel.text = "가위"
        case .rock:
            computerImageView.image = UIImage(named: "rock.png")
            computerLabel.text = "바위"
        case .paper:
            computerImageView.image = UIImage(named: "paper.png")
            computerLabel.text = "보"
        }
        
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
        computerLabel.text = "준비"
        computerImageView.image = #imageLiteral(resourceName: "ready")
        userLabel.text = "준비"
        userImageView.image = #imageLiteral(resourceName: "ready")
        
        mainLabel.text = "선택하세요"
        
    }
    
}

