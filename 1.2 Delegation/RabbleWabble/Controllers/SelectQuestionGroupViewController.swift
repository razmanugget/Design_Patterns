//
//  SelectQuestionGroupViewController.swift
//  RabbleWabble
//
//  Created by Rami on 2/13/20.
//  Copyright © 2020 Lyfebug. All rights reserved.
//

import UIKit

public class SelectQuestionGroupViewController: UIViewController {
   
   // MARK: - Outlets
   @IBOutlet internal var tableView: UITableView! {
      didSet {
         tableView.tableFooterView = UIView()
      }
   }
   
   // MARK: - Properties
   public let questionGroups = QuestionGroup.allGroups()
   private var selectedQuestionGroup: QuestionGroup!
   
   
//   (_ tableView: UITableView, numberOfRowsInSection section: Int)
//   -> Int {
//   return questionGroups.count
//   }
//
//   public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
//      -> UITableViewCell {
//         return UITableViewCell()
//   }
}
