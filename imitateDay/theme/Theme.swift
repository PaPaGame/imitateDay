//
//  Theme.swift
//  imitateDay
//
//  Created by 振亮 孙 on 15/12/10.
//  Copyright © 2015年 papa.studio. All rights reserved.
//

import UIKit

 /// 整个app的 尺寸
public let MainBounds: CGRect = UIScreen.mainScreen().bounds
 /// app 的高度
public let AppHeight: CGFloat = UIScreen.mainScreen().bounds.height
 /// app 的宽度
public let AppWidth: CGFloat = UIScreen.mainScreen().bounds.width

public let NavigationHeight: CGFloat = 64

struct theme {
    static let DefaultFontSize = UIFont.systemFontOfSize(16)
    
    static let DefaultNavFontSize = UIFont.systemFontOfSize(18)
    
    /// ViewController的背景颜色
    static let SBackgroundColor: UIColor = UIColor.colorWith(255, green: 255, blue: 255, alpha: 1)
}


