//
//  GameManager.swift
//  MathMania
//  File Created and Edited By Jaskiran Gill 
//
//

import Foundation

class GameManager: ObservableObject {
    @Published var currentLevel = 1
    @Published var score = 0
    @Published var gameOver = false
    @Published var randomNumber = 0
    @Published var number1 = 0
    @Published var number2 = 0
    @Published var correctAnswer = 0
    @Published var question = ""

    init() {
        generateQuestion()
    }

    func generateQuestion() {
        switch currentLevel {
        case 1:
            randomNumber = Int.random(in: 1...100)
            question = "Is \(randomNumber) Odd or Even?"
        case 2:
            number1 = Int.random(in: 1...50)
            number2 = Int.random(in: 1...50)
            correctAnswer = number1 + number2
            question = "What is \(number1) + \(number2)?"
        case 3:
            randomNumber = Int.random(in: 2...100)
            question = "Is \(randomNumber) a Prime number?"
        default:
            gameOver = true
        }
    }
    
    func checkGuess(guess: String) {
        let isOdd = randomNumber % 2 != 0
        if (guess == "Odd" && isOdd) || (guess == "Even" && !isOdd) {
            score += 10
            nextLevel()
        } else {
            gameOver = true
        }
    }
    
    func checkAnswer(answer: Int) {
        if answer == correctAnswer {
            score += 10
            nextLevel()
        } else {
            gameOver = true
        }
    }

    func checkPrimeGuess(guess: String) {
        let isPrimeNumber = isPrime(randomNumber)
        if (guess == "Prime" && isPrimeNumber) || (guess == "Not Prime" && !isPrimeNumber) {
            score += 10
            gameOver = true
        } else {
            gameOver = true
        }
    }

    private func isPrime(_ num: Int) -> Bool {
        if num < 2 { return false }
        for i in 2..<num {
            if num % i == 0 {
                return false
            }
        }
        return true
    }

    private func nextLevel() {
        if currentLevel < 3 {
            currentLevel += 1
            generateQuestion()
        } else {
            gameOver = true
        }
    }
    
    func resetGame() {
        currentLevel = 1
        score = 0
        gameOver = false
        generateQuestion()
    }
    
}
