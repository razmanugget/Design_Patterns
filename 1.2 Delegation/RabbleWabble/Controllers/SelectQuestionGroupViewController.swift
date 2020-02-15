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
      // to prevent the table view from drawing unnecessary empty cells
      didSet {
         tableView.tableFooterView = UIView()
      }
   }
   
   // MARK: - Properties
   public let questionGroups = QuestionGroup.allGroups()
   private var selectedQuestionGroup: QuestionGroup!
   
}


// MARK: - UITableViewDataSource
extension SelectQuestionGroupViewController: UITableViewDataSource {
   
   public func tableView(_ tableView: UITableView,
                         numberOfRowsInSection section: Int)
      -> Int {
         return questionGroups.count
   }
   
   public func tableView(_ tableView: UITableView,
                         cellForRowAt indexPath: IndexPath)
      -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionGroupCell") as! QuestionGroupCell
         let questionGroup = questionGroups[indexPath.row]
         cell.titleLabel.text = questionGroup.title
         return cell
   }
}
