//
//  ToDoCell.swift
//  ToDoApp
//
//  Created by moonkey on 2023/02/27.
//

import UIKit

class ToDoCell: UITableViewCell {

    @IBOutlet weak var cellBackgroundView: UIView!
    
    @IBOutlet weak var toDoTextLabel: UILabel!
    @IBOutlet weak var dateTextLabel: UILabel!
    @IBOutlet weak var updateButton: UIButton!
    
    var memoData: MemoData? {
        didSet {
            configureUIwithData()
        }
    }
    
    var updateButtonPressed: (ToDoCell) -> Void = { (sender) in }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    func configureUI(){
        cellBackgroundView.clipsToBounds = true
        cellBackgroundView.layer.cornerRadius = 8
        
        updateButton.clipsToBounds = true
        updateButton.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureUIwithData(){
        toDoTextLabel.text = memoData?.memoText
        dateTextLabel.text = memoData?.dateString
        guard let colorNum = memoData?.color else {return}
        let color = Color(rawValue: colorNum) ?? .red
        updateButton.backgroundColor = color.buttonColor
        cellBackgroundView.backgroundColor = color.backgroundColor
    }

    
    @IBAction func updateButtonTapped(_ sender: UIButton) {
        updateButtonPressed(self)
    }
}
