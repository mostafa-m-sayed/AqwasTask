//
//  ConstraintExt.swift
//  Aqwas Task
//
//  Created by Mostafa sayed on 10/13/19.
//  Copyright © 2019 Mostafa. All rights reserved.
//

import UIKit
extension NSLayoutConstraint {
    func minPriority() {
        self.priority = UILayoutPriority(rawValue: 1)
    }
    func maxPriority() {
        self.priority = UILayoutPriority(rawValue: 1000)
    }
}
