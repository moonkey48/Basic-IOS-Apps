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
    
    // MARK - 코어데이터 읽어 오기
    func getMemoListFromCoreData() -> [MemoData] {
     
        var memoList: [MemoData] = []
        
        if let context = context {
            //요청서
            let request = NSFetchRequest<NSManagedObject>(entityName: modelName)
            //정렬 순서를 정해서 요청ㅅ에 넘겨주기
            let dataOrder = NSSortDescriptor(key: "date", ascending: false)
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
    func saveMemoData(memoText: String?, colorInt: Int64, completion: @escaping () -> Void) {
        //임시 저장소 유무 판단
        if let context = context {
            //임시 저장소에 잇는 데이터를 그려줄 형태 파악하기
            if let entity = NSEntityDescription.entity(forEntityName: self.modelName, in: context) {
                //임시 저장소에 올라가게 할 객체 만들기
                if let memoData = NSManagedObject(entity: entity, insertInto: context) as? MemoData {
                    memoData.memoText = memoText
                    memoData.date = Date()
                    memoData.color = colorInt
                    print("메모 저장 직전")
                    
                    if context.hasChanges {
                        do {
                            try context.save()
                            completion()
                        } catch {
                            print(error)
                            completion()
                        }
                    }
                }
            }
        }
        completion()
    }
    func deleteMemo(data: MemoData, completion: @escaping () -> Void) {
        guard let date = data.date else {
            completion()
            return
        }
        
        if let context = context {
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            request.predicate = NSPredicate(format: "date = %@", date as CVarArg)
            
            do {
                if let fetchedMemoList = try context.fetch(request) as? [MemoData] {
                    if let targetMemo = fetchedMemoList.first {
                        context.delete(targetMemo)
                        
                        if context.hasChanges {
                            do {
                                try context.save()
                                completion()
                            } catch {
                                print(error)
                                completion()
                            }
                        }
                    }
                }
                completion()
            } catch {
                print("fail to delete")
                completion()
            }
        }
    }
    
    func updateMemo(newMemoData: MemoData, completion: @escaping () -> Void) {
        guard let date = newMemoData.date else {
            completion()
            return
        }
        
        if let context = context {
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            request.predicate = NSPredicate(format: "date = %@", date as CVarArg)
            
            do {
                if let fetchedMemoList = try context.fetch(request) as? [MemoData] {
                    if var targetMemo = fetchedMemoList.first {
                        targetMemo = newMemoData
                        
                        if context.hasChanges {
                            do {
                                try context.save()
                                completion()
                            } catch {
                                print(error)
                                completion()
                            }
                        }
                    }
                }
                completion()
            }catch {
                print("fail to update")
                completion()
            }
        }
    }
}
