//
//  ViewController.swift
//  LoginProject
//
//  Created by moonkey on 2023/02/05.
//

import UIKit

class ViewController: UIViewController {

    let emailTextFieldView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    func makeUI(){
        emailTextFieldView.backgroundColor = UIColor.gray
        view.addSubview(emailTextFieldView)
        emailTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        
        emailTextFieldView.layer.cornerRadius = 10
        emailTextFieldView.layer.masksToBounds = true
        emailTextFieldView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        emailTextFieldView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        emailTextFieldView.topAnchor.constraint(equalTo: view.topAnchor, constant: 180).isActive = true
        emailTextFieldView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }


}

