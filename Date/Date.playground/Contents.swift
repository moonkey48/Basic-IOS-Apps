
import Foundation

let now = Date()

now
now.timeIntervalSince1970
now.timeIntervalSinceReferenceDate


enum Weekday: Int {
    case sunday = 1, monday, tuesday, wednesday, thursday, friday, saturday
    
    static var today: Weekday {
        let weekday = Calendar.current.component(.weekday, from: Date())
        return Weekday(rawValue: weekday)!
    }
}
Weekday.today

