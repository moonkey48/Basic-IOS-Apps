//
//  File.swift
//  MemberList
//
//  Created by moonkey on 2023/02/14.
//

import Foundation

final class MemberListManager {
    
    private var memberList: [Member] = []
    
    func makeMemberListData(){
        //get member data from server
        memberList  = [
            Member(name: "배트맨", age: 30, phone: "010-1234-5678", address: "서울"),
            Member(name: "베조스", age: 31, phone: "010-1234-5678", address: "서울"),
            Member(name: "스티브", age: 32, phone: "010-1234-5678", address: "서울"),
            Member(name: "임꺽정", age: 33, phone: "010-1234-5678", address: "서울"),
            Member(name: "조커", age: 34, phone: "010-1234-5678", address: "서울"),
            Member(name: "쿡", age: 35, phone: "010-1234-5678", address: "서울"),
            Member(name: "홍길동", age: 36, phone: "010-1234-5678", address: "서울"),
        ]
    }
    func getMemberList() -> [Member] {
        return memberList
    }
    func makeNewMember(_ member: Member) {
        memberList.append(member)
    }
    func updateMemberInfo(index: Int, _ member: Member){
        memberList[index] = member
    }
}
