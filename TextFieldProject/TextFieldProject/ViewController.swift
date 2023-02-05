//
//  ViewController.swift
//  TextFieldProject
//
//  Created by moonkey on 2023/02/05.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        textField.delegate = self
    }
    func setUp(){
        view.backgroundColor = UIColor.gray
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.placeholder = "이메일 입력"
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("on textField")
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return false
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(string)
        return true
    }

    @IBAction func doneButtonTapped(_ sender: UIButton) {
    }
    
}

