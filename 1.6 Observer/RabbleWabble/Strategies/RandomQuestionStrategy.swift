//
//  RandomQuestionStrategy.swift
//  RabbleWabble
//
//  Created by Rami on 2/17/20.
//  Copyright © 2020 Lyfebug. All rights reserved.
//

import Foundation
import GameplayKit.GKRandomSource      // singleton import

public class RandomQuestionStrategy: BaseQuestionStrategy {
   
   public convenience init(
      questionGroupCaretaker: QuestionGroupCaretaker) {
      let questionGroup = questionGroupCaretaker.selectedQuestionGroup!
      let randomSource = GKRandomSource.sharedRandom()
      let questions = randomSource.arrayByShufflingObjects(
         in: questionGroup.questions) as! [Question]
      self.init(questionGroupCaretaker: questionGroupCaretaker,
                questions: questions)
   }
}
