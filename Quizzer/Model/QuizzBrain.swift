//
//  QuizzBrain.swift
//  Quizzer
//
//  Created by macbook on 09.11.2023.
//

import Foundation

struct QuizzBrain {
    let quizz =   [  Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
                     Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
                     Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
                     Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
                     Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
                     Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
                     Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
                     Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
                     Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
                     Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
    
    var questionNumber = 0
    var score = 0
    
    
    func titleForButton(_ buttonNumber: Int) -> String? {
        guard quizz.indices.contains(questionNumber),
              quizz[questionNumber].a.indices.contains(buttonNumber) else {
            return nil
        }
        return quizz[questionNumber].a[buttonNumber]
    }
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quizz[questionNumber].correctAnswer {
            self.score += 1
            return true
        } else {
            return false
        }
    }
    
    func getQuestionText() -> String {
        return quizz[questionNumber].q
    }
    
    func getProgress() -> Float {
        let progress = Float(questionNumber) / Float(quizz.count)
        return progress
    }
    
    mutating func nextQuestion() {
        if questionNumber + 1 < quizz.count {
            self.questionNumber += 1
        } else {
            self.questionNumber = 0
            self.score = 0
        }
    }
    func getScore() -> Int {
        return score
    }
    
}
