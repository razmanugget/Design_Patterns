//
//  QuestionViewController.swift
//  RabbleWabble
//
//  Created by Rami on 2/10/20.
//  Copyright © 2020 Lyfebug. All rights reserved.
//

import UIKit

public class QuestionViewController: UIViewController {
   
   // MARK: - Properties
   public var questionGroup = QuestionGroup.basicPhrases()
   public var questionIndex = 0
   
   public var correctCount = 0
   public var incorrectCount = 0
   
   public var questionView: QuestionView! {
      guard isViewLoaded else { return nil }
      return (view as! QuestionView)
   }
   
   
   // MARK: - VC Life Cycle
   public override func viewDidLoad() {
      
      super.viewDidLoad()
      showQuestion()
   }
   
   private func showQuestion() {
      let question = questionGroup.questions[questionIndex]
      
      questionView.answerLabel.text = question.answer
      questionView.promptLabel.text = question.prompt
      questionView.hintLabel.text = question.hint
      
      questionView.answerLabel.isHidden = true
      questionView.hintLabel.isHidden = true
   }
   
}
