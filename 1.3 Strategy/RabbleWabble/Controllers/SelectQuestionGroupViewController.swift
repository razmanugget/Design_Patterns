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


// MARK: - UITableViewDelegate
extension SelectQuestionGroupViewController: UITableViewDelegate {
   // set the question group here because if it was triggered on didSelect, it would be nil
   public func tableView(_ tableView: UITableView,
                         willSelectRowAt indexPath: IndexPath)
      -> IndexPath? {
         selectedQuestionGroup = questionGroups[indexPath.row]
         return indexPath
   }
   // this deselect is to not see selected cells when you return to menu
   public func tableView(_ tableView: UITableView,
                         didSelectRowAt indexPath: IndexPath) {
      tableView.deselectRow(at: indexPath, animated: true)
   }
   
   public override func prepare(for segue: UIStoryboardSegue,
                                sender: Any?) {
      guard let viewController = segue.destination as? QuestionViewController else { return }
      viewController.questionStrategy = RandomQuestionStrategy(questionGroup: selectedQuestionGroup)
      viewController.delegate = self
   }
}


// MARK: - QuestionViewControllerDelegate
extension SelectQuestionGroupViewController: QuestionViewControllerDelegate {
   public func questionViewController(
      _ viewController: QuestionViewController,
      didCancel questionGroup: QuestionStrategy) {
      navigationController?.popToViewController(self, animated: true)
   }
   
   public func questionViewController(
      _ viewController: QuestionViewController,
      didComplete questionGroup: QuestionStrategy) {
      navigationController?.popToViewController(self, animated: true)
   }
}
