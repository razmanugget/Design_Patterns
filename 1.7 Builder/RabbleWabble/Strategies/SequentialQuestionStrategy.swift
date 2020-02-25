//
//  SequentialQuestionStrategy.swift
//  RabbleWabble
//
//  Created by Rami on 2/17/20.
//  Copyright © 2020 Lyfebug. All rights reserved.
//

import Foundation

public class SequentialQuestionStrategy: BaseQuestionStrategy {
   
   public convenience init(
      questionGroupCaretaker: QuestionGroupCaretaker) {
      let questionGroup = questionGroupCaretaker.selectedQuestionGroup!
      let questions = questionGroup.questions
      self.init(questionGroupCaretaker: questionGroupCaretaker,
                questions: questions)
   }
}
