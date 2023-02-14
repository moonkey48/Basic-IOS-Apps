//
//  Member.swift
//  MemberList
//
//  Created by moonkey on 2023/02/14.
//

import UIKit

struct Member {
    
    lazy var memberImage: UIImage? = {
        guard let name = name else {
            return UIImage(systemName: "person")
        }
        return UIImage(named: "\(name).png") ?? UIImage(systemName: "person")
    }()
    
    static var memberNumbers = 0
    
    let memberId: Int
    var name: String?
    var age: Int?
    var phone: String?
    var address: String?
    
    init(memberId: Int, name: String?, age: Int?, phone: String?, address: String?) {
        self.memberId = Member.memberNumbers == 0 ? 0 : Member.memberNumbers
        
        self.name = name
        self.age = age
        self.phone = phone
        self.address = address
        
        Member.memberNumbers += 1
    }
}
