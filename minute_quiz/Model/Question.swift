//
//  Question.swift
//  minute_quiz
//
//  Created by MacBook Pro on 7/29/18.
//  Copyright © 2018 Code Drizzlers. All rights reserved.
//

import Foundation

class Question {
    //create properties
    let questionImage: String
    let questionText: String
    let answer: Bool
    
    //initialize properties
    init(image: String, text:String, correctAnswer: Bool) {
        questionImage = image
        questionText = text
        answer = correctAnswer
    }
}
