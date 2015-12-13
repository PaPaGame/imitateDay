//
//  ExplorerViewController.swift
//  imitateDay
//
//  Created by 振亮 孙 on 15/12/10.
//  Copyright © 2015年 papa.studio. All rights reserved.
//

import UIKit

class ExplorerViewController: MainViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置导航器
        setNavigator()
    }
    
    private func setNavigator(){
        let viewStack = TabViewStack(leftText: "Hello", rightText: "World")
        viewStack.frame = CGRectMake(0, 0, 120, 44)
        navigationItem.titleView = viewStack
    }
}
