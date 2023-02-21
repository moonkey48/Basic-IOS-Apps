
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


let formatter = DateFormatter()

//formatter.dateStyle = .full
//formatter.timeStyle = .full
formatter.locale = Locale(identifier: "ko_KR")
formatter.timeZone = TimeZone.current
formatter.dateFormat = "yyyy년 MM월 dd일 (E) hh시 mm분 ss초"

let str = formatter.string(from: Date())


struct InstagramPost {
    let title = "title"
    let description = "my first post"

    private let date = Date()
    
    var dateString: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.timeZone = TimeZone.current
        formatter.dateStyle = .full
        formatter.timeStyle = .medium
        
        return formatter.string(from: date)
    }
}
let post = InstagramPost()
print(post.dateString)


let calender = Calendar.current

print(calender.component(.weekday, from: Date()))



