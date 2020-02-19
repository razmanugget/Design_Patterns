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
   
   
   // MARK: - Instance Properties
   public var questionStrategyType: QuestionStrategyType {
      get {
         let rawValue = UserDefaults.integer(forKey: Keys.questionStrategy)
         return QuestionStrategyType(rawValue: rawValue)!
      } set {
         UserDefaults.set(newValue.rawValue, forKey: Keys.questionStrategy)
      }
   }
   private let userDefaults = UserDefaults.standard
   
   
   // MARK: - Object Lifecycle
   private init() { }
}


// MARK: - QuestionStrategyType
public enum QuestionStrategyType: Int, CaseIterable {
   case random
   case sequential
   
   // MARK: - Instance Methods
   public func questionStrategy(for questionGroup: QuestionGroup)
      -> QuestionStrategy {
      return QuestionStrategyType.questionStrategy(for: questionGroup)
   }
   
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
