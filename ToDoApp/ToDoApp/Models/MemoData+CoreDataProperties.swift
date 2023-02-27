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
    @NSManaged public var date: Date?
    @NSManaged public var color: Int64

    var dateString: String? {
        let dateFormmater = DateFormatter()
        dateFormmater.dateFormat = "yyyy-MM-dd"
        guard let date = self.date else { return ""}
        let savedDateString = dateFormmater.string(from: date)
        
        return savedDateString
    }
}

extension MemoData : Identifiable {

}
