//
//  MainTabBarController.swift
//  imitateDay
//
//  Created by 振亮 孙 on 15/12/10.
//  Copyright © 2015年 papa.studio. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        self.setupTabMenu()
        
        super.viewDidLoad()
    }
    
    private func setupTabMenu() {
        // 探店
        createTabbarItem(ExplorerViewController(), title: "探店", normalImg: "recommendation_1", selectImg: "recommendation_2")
        
        // 体验
        createTabbarItem(ExplorerViewController(), title: "体验", normalImg: "broadwood_1", selectImg: "broadwood_2")
        
        // 分类
        createTabbarItem(ExplorerViewController(), title: "分类", normalImg: "classification_1", selectImg: "classification_2")
        
        // 我的
        createTabbarItem(ExplorerViewController(), title: "我的", normalImg: "my_1", selectImg: "my_2")
    }
    
    /**
     构建TabbarItem 并添加到Tabbar内
     
     - parameter controller: 对应的控制器
     - parameter title:      显示的文字
     - parameter normalImg:  正常图片
     - parameter selectImg:  选中后的图片
     */
    private func createTabbarItem(controller: UIViewController, title: String,normalImg: String, selectImg: String) {
        // 构建一个BarItem
        controller.tabBarItem = UITabBarItem(title: title, image: UIImage(named: normalImg), selectedImage: UIImage(named: selectImg))
        
        // 设置背景色
        controller.view.backgroundColor = UIColor.whiteColor()
        
        let nav = MainNavigationController(rootViewController: controller)
        addChildViewController(nav)
        
    }
}
