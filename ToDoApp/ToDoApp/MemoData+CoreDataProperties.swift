//
//  MemoData+CoreDataProperties.swift
//  ToDoApp
//
//  Created by moonkey on 2023/02/27.
//
//

import Foundation
import CoreData


extension MemoData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MemoData> {
        return NSFetchRequest<MemoData>(entityName: "MemoData")
    }

    @NSManaged public var memoText: String?
    @NSManaged public var data: Date?
    @NSManaged public var color: Int64

}

extension MemoData : Identifiable {

}
