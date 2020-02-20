//
//  DiskCaretaker.swift
//  RabbleWabble
//
//  Created by Rami on 2/20/20.
//  Copyright © 2020 Lyfebug. All rights reserved.
//

import Foundation

public final class DiskCaretaker {
   public static let decoder = JSONDecoder()
   public static let encoder = JSONEncoder()
   
   public static func save<T: Codable>(_ object: T, to fileName: String) throws {
      do {
         let url = createDocumentURL(withFileName: fileName)
         let data = try encoder.encode(object)
         try data.write(to: url, options: .atomic)
      } catch (let error) {
         print("Save failed: Object: '\(object)', " + "Error: '\(error)'")
         throw error
      }
   }
   
   public static func createDocumentURL(
      withFileName fileName: String) -> URL {
      let fileManager = FileManager.default
      let url = fileManager.urls(for: .documentDirectory,
                                 in: .userDomainMask).first!
      return url.appendingPathComponent(fileName)
         .appendingPathExtension("json")
   }
}
