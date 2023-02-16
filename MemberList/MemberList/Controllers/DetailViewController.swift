//
//  DetailViewController.swift
//  MemberList
//
//  Created by moonkey on 2023/02/16.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let detailView = DetailView()
    
    var member: Member?
    

    override func loadView() {
        view = detailView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
    }
    private func setupData(){
        detailView.member = member
    }
    func setupButtonAction(){
        detailView.saveButton.addTarget(self, action: #selector(saveButtonTapped) , for: .touchUpInside)
    }
    @objc func saveButtonTapped(){
        
    }
}
