//
//  DetailViewController.swift
//  ToDoApp
//
//  Created by moonkey on 2023/02/28.
//

import UIKit

class DetailViewController: UIViewController {
    
    var memoData: MemoData? {
        didSet {
            temporaryNum = memoData?.color
        }
    }
    
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    
    lazy var buttons: [UIButton] = {
       return [redButton, greenButton, blueButton, purpleButton]
    }()
    
    @IBOutlet weak var textBackgroundView: UIView!
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var saveButton: UIButton!
    
    let memoManager = CoreDataManager.shared
    
    var temporaryNum: Int64? = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        configureUI()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        buttons.forEach { button in
            button.clipsToBounds = true
            button.layer.cornerRadius = button.bounds.height / 2
        }
    }
    func setup() {
        textView.delegate = self
        
        textBackgroundView.clipsToBounds = true
        textBackgroundView.layer.cornerRadius = 10
        
        saveButton.clipsToBounds = true
        saveButton.layer.cornerRadius = 10
        clearButtonColors()
    }
    func configureUI(){
        if let memoData = self.memoData {
            //기존 데이터가 있는 경우
            self.title = "메모 수정하기"
            
            guard let text = memoData.memoText else {return}
            textView.text = text
            saveButton.setTitle("UPDATE", for: .normal)
            textView.becomeFirstResponder()
            
            let color = Color(rawValue: memoData.color)
            setupColorTheme(color: color)
        } else {
            //새로운 매모 생성
            self.title = "새로운 메모"
            
            textView.text = "텍스트를 여기에 입력하세요"
            textView.textColor = .lightGray
            setupColorTheme(color: .red)
        }
        setupColorButton(num: temporaryNum ?? 1)
    }
    func clearButtonColors() {
        redButton.backgroundColor = Color.red.backgroundColor
        redButton.setTitleColor(Color.red.buttonColor, for: .normal)
        greenButton.backgroundColor = Color.green.backgroundColor
        greenButton.setTitleColor(Color.green.buttonColor, for: .normal)
        blueButton.backgroundColor = Color.blue.backgroundColor
        blueButton.setTitleColor(Color.blue.buttonColor, for: .normal)
        purpleButton.backgroundColor = Color.purple.backgroundColor
        purpleButton.setTitleColor(Color.purple.buttonColor, for: .normal)
    }
    func setupColorTheme(color: Color?){
        textBackgroundView.backgroundColor = color?.backgroundColor
        saveButton.backgroundColor = color?.backgroundColor
    }
    func setupColorButton(num: Int64){
        switch num {
        case 1:
            redButton.backgroundColor = Color.red.buttonColor
            redButton.setTitleColor(.white, for: .normal)
        case 2:
            greenButton.backgroundColor = Color.green.buttonColor
            greenButton.setTitleColor(.white, for: .normal)
        case 3:
            blueButton.backgroundColor = Color.blue.buttonColor
            blueButton.setTitleColor(.white, for: .normal)
        case 4:
            purpleButton.backgroundColor = Color.purple.buttonColor
            purpleButton.setTitleColor(.white, for: .normal)
        default:
            redButton.backgroundColor = Color.red.buttonColor
            redButton.setTitleColor(.white, for: .normal)
        }
    }
    
    
    @IBAction func colorButtonTapped(_ sender: UIButton) {
        self.temporaryNum = Int64(sender.tag)
        
        let color = Color(rawValue: Int64(sender.tag))
        setupColorTheme(color: color)
        
        clearButtonColors()
        setupColorButton(num: Int64(sender.tag))
    }
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        if let memoData = self.memoData {
            memoData.memoText = textView.text
            memoData.color = temporaryNum ?? 1
            memoManager.updateMemo(newMemoData: memoData) {
                print("update complete")
                self.navigationController?.popViewController(animated: true)
            }
        } else {
            let memoText = textView.text
            memoManager.saveMemoData(memoText: memoText, colorInt: temporaryNum ?? 1) {
                print("save complete")
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension DetailViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "텍스트를 여기에 입력하세요" {
            textView.text  = nil
            textView.textColor = .black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = "텍스트를 여기에 입력하세요"
            textView.textColor = .lightGray
        }
    }
}
