//
//  MainTableView.swift
//  imitateDay
//
//  Created by 振亮 孙 on 15/12/16.
//  Copyright © 2015年 papa.studio. All rights reserved.
//

import UIKit

class MainTableView: UITableView {
    convenience init(frame: CGRect, style: UITableViewStyle, dataSource: UITableViewDataSource?, delegate: UITableViewDelegate?) {
        self.init(frame: frame, style: style)
        self.dataSource = dataSource
        self.delegate = delegate
        separatorStyle = .None
    }
}
