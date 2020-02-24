//
//  Questions.swift
//  RabbleWabble
//
//  Created by Rami on 2/10/20.
//  Copyright © 2020 Lyfebug. All rights reserved.
//

import Foundation
import Combine

public class User {
   @Published var name: String
   public init(name: String) {
      self.name = name
   }
}

let user = User(name: "Ray")
let publisher = user.$name

var subscriber: AnyCancellable? = publisher.sink() {
   print("User's name is \($0)")
}

user.name = "Rami"

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

