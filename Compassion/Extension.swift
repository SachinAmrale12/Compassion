//
//  Extension.swift
//  Compassion
//
//  Created by Sachin Amrale on 11/10/17.
//  Copyright © 2017 Sachin Amrale. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func round(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}


extension UIButton {
    func alignTextUnderImage() {
        guard let imageView = imageView else {
            return
        }
        self.contentVerticalAlignment = .top
        self.contentHorizontalAlignment = .center
        let imageLeftOffset = (self.bounds.width - imageView.bounds.width) / 2//put image in center
        let titleTopOffset = imageView.bounds.height + 5
        self.imageEdgeInsets = UIEdgeInsetsMake(0, imageLeftOffset, 0, 0)
        self.titleEdgeInsets = UIEdgeInsetsMake(titleTopOffset, -imageView.bounds.width, 0, 0)
    }
}
