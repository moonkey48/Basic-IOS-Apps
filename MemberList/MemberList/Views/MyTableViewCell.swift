//
//  MyTableViewCell.swift
//  MemberList
//
//  Created by moonkey on 2023/02/16.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    var member: Member? {
        didSet {
            guard var member = member else {return}
            mainImageView.image = member.memberImage
            memberNameLabel.text = member.name
            memberAddresssLabel.text = member.address
        }
    }

    let mainImageView : UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let memberNameLabel : UILabel = {
        var nameLabel = UILabel()
        nameLabel.font = UIFont.boldSystemFont(ofSize: 12)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    let memberAddresssLabel : UILabel = {
        var addressLabel = UILabel()
        addressLabel.font = UIFont.boldSystemFont(ofSize: 12)
        addressLabel.numberOfLines = 0
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        return addressLabel
    }()
    
    let stackView : UIStackView = {
        var sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 5
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.distribution = .fill
        sv.alignment = .fill
        return sv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupStackView()
    }
    
    func setupStackView(){
        self.addSubview(mainImageView)
        self.addSubview(stackView)
        
        stackView.addArrangedSubview(memberNameLabel)
        stackView.addArrangedSubview(memberAddresssLabel)
        
    }
    
    override func updateConstraints() {
        setConstraints()
        super.updateConstraints()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.mainImageView.clipsToBounds = true
        self.mainImageView.layer.cornerRadius = self.mainImageView.frame.width / 2
    }
    func setConstraints(){
        NSLayoutConstraint.activate([
            mainImageView.heightAnchor.constraint(equalToConstant: 40),
            mainImageView.widthAnchor.constraint(equalToConstant: 40),
            mainImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            mainImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
        
        NSLayoutConstraint.activate([
            memberNameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: mainImageView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: mainImageView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
