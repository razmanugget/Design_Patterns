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
   private let questionGroupCaretaker = QuestionGroupCaretaker()
   private var questionGroups: [QuestionGroup] {
      return questionGroupCaretaker.questionGroups
   }
   private var selectedQuestionGroup: QuestionGroup! {
      get { return
         questionGroupCaretaker.selectedQuestionGroup }
      set { questionGroupCaretaker.selectedQuestionGroup = newValue }
   }
   private let appSettings = AppSettings.shared
   
   // MARK: - View Lifecycle
   public override func viewDidLoad() {
      super.viewDidLoad()
      questionGroups.forEach {
         print("\($0.title): " +
            "correctCount \($0.score.correctCount), " +
            "incorrectCount \($0.score.incorrectCount)"
         )
      }
   }
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
         // setting up the Subscriber
         cell.percentageSubscriber = questionGroup.score.$runningPercentage
            // ensure events are delivered on the main queue
            .receive(on: DispatchQueue.main)
            // transform the value to % based on a map
            .map() {
               return String(format: "%.0f %%", round(100 * $0)) }
            // set the value to text on cell.percentageLabel
            .assign(to: \.text, on: cell.percentageLabel)
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
   
   public override func prepare(
  
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

public class MySingletonPlus {
   static let shared = MySingletonPlus()
   
   public init() { }
}

let singletonPlus = MySingletonPlus.shared
let singletonPlus2 = MySingletonPlus()


// MARK: - CreateQuestionGroupViewControllerDelegate
extension SelectQuestionGroupViewController: CreateQuestionGroupViewControllerDelegate {
   
   public func createQuestionGroupViewControllerDidCancel(_ viewController: CreateQuestionGroupViewController)
   {
      dismiss(animated: true, completion: nil)
   }
   
   public func createQuestionGroupViewController(_ viewController: CreateQuestionGroupViewController, created questionGroup: QuestionGroup) {
      questionGroupCaretaker.questionGroups.append(questionGroup)
      try? questionGroupCaretaker.save()
      
      dismiss(animated: true, completion: nil)
      tableView.reloadData()
   }
}
