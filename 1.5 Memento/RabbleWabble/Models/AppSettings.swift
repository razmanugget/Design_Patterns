//
//  AppSettings.swift
//  RabbleWabble
//
//  Created by Rami on 2/18/20.
//  Copyright © 2020 Lyfebug. All rights reserved.
//

import Foundation

public class AppSettings {
   // MARK: - Keys
   private struct Keys {
      static let questionStrategy = "questionStrategy"
   }
   
   // MARK: - Static Properties
   // the singleton
   public static let shared = AppSettings()
   
   
   // MARK: - Instance Properties
   public var questionStrategyType: QuestionStrategyType {
      get {
         let rawValue = userDefaults.integer(forKey: Keys.questionStrategy)
         return QuestionStrategyType(rawValue: rawValue)!
      } set {
         userDefaults.set(newValue.rawValue,
                          forKey: Keys.questionStrategy)
      }
   }
   private let userDefaults = UserDefaults.standard
   
   
   // MARK: - Object Lifecycle
   private init() { }
   
   
   // MARK: - Instance Methods
     public func questionStrategy(for questionGroupCaretaker: QuestionGroupCaretaker)
        -> QuestionStrategy {
        return questionStrategyType.questionStrategy(for: questionGroupCaretaker)
     }
}


// MARK: - QuestionStrategyType
public enum QuestionStrategyType: Int, CaseIterable {
   case random
   case sequential
   
  
   
   public func title() -> String {
      switch self {
      case .random:
         return "Random"
      case . sequential:
         return "Sequential"
      }
   }
   
   public func questionStrategy(for questionGroupCaretaker: QuestionGroupCaretaker)
      -> QuestionStrategy {
         switch self {
         case .random:
            // can now accept convenience initializers
            return RandomQuestionStrategy(questionGroupCaretaker: questionGroupCaretaker)
         case .sequential:
            return SequentialQuestionStrategy(questionGroupCaretaker: questionGroupCaretaker)
         }
   }
   
}
