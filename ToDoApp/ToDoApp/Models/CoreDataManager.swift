//
//  CoreDataManager.swift
//  ToDoApp
//
//  Created by moonkey on 2023/02/27.
//

import UIKit
import CoreData


// MARK - To Do 관리 매니저

final class CoreDataManager {
    
    static let shared = CoreDataManager()
    private init() {}
    
    //앱 델리게이트
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    //임시 저장소
    lazy var context = appDelegate?.persistentContainer.viewContext
    
    //엔티티 이름 (코어 데이터에 저장된 객체)
    let modelName: String = "MemoData"
    
    func getMemoListFromCoreData() -> [MemoData] {
     
        var memoList: [MemoData] = []
        
        if let context = context {
            //요청서
            let request = NSFetchRequest<NSManagedObject>(entityName: modelName)
            //정렬 순서를 정해서 요청ㅅ에 넘겨주기
            let dataOrder = NSSortDescriptor(key: "data", ascending: false)
            request.sortDescriptors = [dataOrder]
            
            do {
                if let fetchedmemoList = try context.fetch(request) as? [MemoData] {
                    memoList = fetchedmemoList
                }
            } catch {
                print("fail to bring memoList")
            }
            
        }
        
        return memoList
    }
    
    // MARK - [Create] 코어 데이터에 데이터 생성
}
