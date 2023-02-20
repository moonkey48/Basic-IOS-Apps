//: [Previous](@previous)

import Foundation

var array = [String]()

let serialQueue = DispatchQueue(label: "serial")

//for i in 0...20 {
//    DispatchQueue.global().async {
//        array.append("\(i)")
//    }
//}
for i in 0...20 {
    DispatchQueue.global().async {
        serialQueue.async {
            array.append("\(i)")
        }
    }
}

DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
    print(array)
}
//: [Next](@next)
