import UIKit

func task1(){
    print("task1 start")
    sleep(2)
    print("task1 end 🏁")
}
func task2(){
    print("task2 start")
    sleep(2)
    print("task2 end 🏁")
}
func task3(){
    print("task3 start")
    sleep(2)
    print("task3 end 🏁")
}
func task4(){
    print("task4 start")
    sleep(2)
    print("task4 end 🏁")
}
func task5(){
    print("task5 start")
    sleep(2)
    print("task5 end 🏁")
}

//DispatchQueue.global().async {
//    task1()
//}
//DispatchQueue.global().async {
//    task2()
//}
//DispatchQueue.global().async {
//    task3()
//}
//DispatchQueue.global().async {
//    task4()
//}
//DispatchQueue.global().async {
//    task5()
//}

let serialQueue = DispatchQueue(label: "serial")
//serialQueue.async {
//    task1()
//}
//serialQueue.async {
//    task2()
//}
//serialQueue.async {
//    task3()
//}

let concurrentQueue = DispatchQueue.global()

concurrentQueue.async {
    task1()
}
concurrentQueue.async {
    task2()
}
concurrentQueue.async {
    task3()
}
