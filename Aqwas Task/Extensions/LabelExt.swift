//
//  LabelExt.swift
//  Aqwas Task
//
//  Created by Mostafa sayed on 10/16/19.
//  Copyright © 2019 Mostafa. All rights reserved.
//

import UIKit
extension UILabel {
    func animate(font: UIFont, duration: TimeInterval) {
        let labelScale = self.font.pointSize / font.pointSize
        self.font = font
        let oldTransform = transform
        transform = transform.scaledBy(x: labelScale, y: labelScale)
        setNeedsUpdateConstraints()
        UIView.animate(withDuration: duration) {
            self.transform = oldTransform
            self.layoutIfNeeded()
        }
    }
}
