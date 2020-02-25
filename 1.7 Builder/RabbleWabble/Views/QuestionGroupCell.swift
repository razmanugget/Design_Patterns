//
//  QuestionGroupCell.swift
//  RabbleWabble
//
//  Created by Rami on 2/15/20.
//  Copyright © 2020 Lyfebug. All rights reserved.
//

import UIKit
import Combine

public class QuestionGroupCell: UITableViewCell {
   @IBOutlet public var titleLabel: UILabel!
   @IBOutlet public var percentageLabel: UILabel!
   
   public var percentageSubscriber: AnyCancellable?
}
