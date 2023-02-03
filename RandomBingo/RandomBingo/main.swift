//
//  main.swift
//  RandomBingo
//
//  Created by moonkey on 2023/02/03.
//

import Foundation

var computerChoice = Int.random(in: 0...99)
var done = false

while !done {
    let userInput = readLine()
    
    if let input = userInput {
        if let inputValue = Int(input) {
            if inputValue > computerChoice {
                print("down")
            } else if inputValue < computerChoice {
                print("up")
            } else {
                print("Bingo")
                done = true
                break
            }
        }
    }
    
}
