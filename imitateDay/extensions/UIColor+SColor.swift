//
//  UIColor+SColor.swift
//  imitateDay
//
//  Created by 振亮 孙 on 15/12/16.
//  Copyright © 2015年 papa.studio. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    static func colorWith(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
    }
}