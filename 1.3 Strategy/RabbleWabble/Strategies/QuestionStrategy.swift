//
//  QuestionStrategy.swift
//  RabbleWabble
//
//  Created by Rami on 2/17/20.
//  Copyright © 2020 Lyfebug. All rights reserved.
//

import Foundation

public protocol QuestionStrategy: class {
   var title: String { get }
   var correctCount: Int { get }
   var incorrectCount: Int { get }
   
   func advanceToNextQuestion() -> Bool
   func currentQuestion() -> Question
   
   func markQuestionCorrect(_ question: Question)
   func markQuestionIncorrect(_ question: Question)
   
   func questionIndexTitle() -> String
}
