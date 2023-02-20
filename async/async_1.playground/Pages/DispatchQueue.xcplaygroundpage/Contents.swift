//: [Previous](@previous)

import UIKit

// MARK - main queue
let mainQueue = DispatchQueue.main

// MARK - global queue
let userInteractiveQueue = DispatchQueue.global(qos: .userInteractive)
let userInitiatedQueue = DispatchQueue.global(qos: .userInitiated)
let defaultQueue = DispatchQueue.global(qos: .default)
let utilityQueue = DispatchQueue.global(qos: .utility)
let backgroundQueue = DispatchQueue.global(qos: .background)
let unspecifiedQueue = DispatchQueue.global(qos: .unspecified)

// MARK - private queue
let privateQueue = DispatchQueue(label: "serial")



//: [Next](@next)
