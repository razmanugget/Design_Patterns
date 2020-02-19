//
//  AppSettingsViewController.swift
//  RabbleWabble
//
//  Created by Rami on 2/19/20.
//  Copyright © 2020 Lyfebug. All rights reserved.
//

import UIKit

public class AppSettingsViewController: UITableViewController {
   // MARK: - Properties
   public let appSettings = AppSettings.shared
   private let cellIdentifier = "basicCell"
   
   // MARK: - View Life Cycle
   public override func viewDidLoad() {
      super.viewDidLoad()
      tableView.tableFooterView = UIView()
      tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
   }
}
