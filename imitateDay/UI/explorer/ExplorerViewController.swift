//
//  ExplorerViewController.swift
//  imitateDay
//
//  Created by 振亮 孙 on 15/12/10.
//  Copyright © 2015年 papa.studio. All rights reserved.
//

import UIKit

class ExplorerViewController: MainViewController, TabViewStackProtocol{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置导航器
        setNavigator()
    }
    
    private func setNavigator(){
        let viewStack = TabViewStack(leftText: "美天", rightText: "美辑")
        viewStack.frame = CGRectMake(0, 0, 120, 44)
        navigationItem.titleView = viewStack
    }
}

extension ExplorerViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        return cell
    }
}
