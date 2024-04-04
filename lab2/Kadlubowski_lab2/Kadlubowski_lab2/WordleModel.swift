//
//  WordleModel.swift
//  Kadlubowski_lab2
//
//  Created by Jakub Kadlubowski on 25/03/2024.
//

import Cocoa

class WordleModel{
    private var answer: [Int]
    
    init(){
        answer = [Int]()
        generateAnswer()
    }
    
    func generateAnswer(){
        answer.removeAll()
        while answer.count < 5{
            let digit = Int.random(in: 0...9)
            answer.append(digit)
        }
    }
    
    func getAnswer() -> [Int]{
        return answer
    }
    
    
    
 /*   func checkGuess(_ guess: [Int]) -> (correctOnPlace: Int, correctButMisplaced: Int){
        var correctOnPlace = 0
        var correctButMisplaced = 0
        
        for i in 0..<5 {
            if guess[i] == answer[i] {
                correctOnPlace += 1
            }
            else if answer.contains(guess[i]) {
                correctButMisplaced += 1
            }
        }
        
        return (correctOnPlace, correctButMisplaced)
    }*/
}
