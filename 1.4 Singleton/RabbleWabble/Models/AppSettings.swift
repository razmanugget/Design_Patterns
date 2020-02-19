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
   public static let shared = AppSettings()
   
   // MARK: - Object Lifecycle
   private init() { }
}


// MARK: - QuestionStrategyType
public enum QuestionStrategyType: Int, CaseIterable {
   case random
   case sequential
   
   // MARK: - Instance Methods
   public func title() -> String {
      switch self {
      case .random:
         return "Random"
      case . sequential:
         return "Sequential"
      }
   }
   
   public func questionStrategy(for questionGroup: QuestionGroup)
      -> QuestionStrategy {
         switch self {
         case .random:
            return RandomQuestionStrategy(questionGroup: questionGroup)
         case .sequential:
            return SequentialQuestionStrategy(questionGroup: questionGroup)
         }
   }
   
}
