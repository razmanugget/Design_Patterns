//
//  Questions.swift
//  RabbleWabble
//
//  Created by Rami on 2/10/20.
//  Copyright © 2020 Lyfebug. All rights reserved.
//

import Foundation

public class Question: Codable {
   public let answer: String
   public let hint: String?
   public let prompt: String
   
   public init(answer: String, hint: String?, prompt: String) {
      self.answer = answer
      self.hint = hint
      self.prompt = prompt
   }
}

