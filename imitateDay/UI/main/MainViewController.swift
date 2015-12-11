//
//  MainViewController.swift
//  imitateDay
//
//  Created by 振亮 孙 on 15/12/10.
//  Copyright © 2015年 papa.studio. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    var btnCity: TextImageButton!
    
    override func viewDidLoad() {
        
        // 选择城市的按钮
        btnCity = TextImageButton(frame: CGRectMake(0, 20, 80, 44))
        // 设置文本, 该出讲做本地持久化
        btnCity.setTitle("北京", forState: .Normal)
        // 设置字号
        btnCity.titleLabel?.font = UIFont.systemFontOfSize(16)
        // 设置字体颜色
        btnCity.setTitleColor(UIColor.blackColor(), forState: .Normal)
        // 设置文本右侧下箭头样式
        btnCity.setImage(UIImage(named: "home_down"), forState: .Normal)
        // 按钮添加点击事件
        btnCity.addTarget(self, action: "btnCityClickHandler", forControlEvents: .TouchUpInside)
        // 设置导航器左侧按钮为 当前button
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btnCity)
    }
    
    func btnCityClickHandler() {
        print("点选城市选择")
    }
}

class TextImageButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 文字
        titleLabel?.font = UIFont.systemFontOfSize(16)
        titleLabel?.contentMode = UIViewContentMode.Center
        // 图片
        imageView?.contentMode = UIViewContentMode.Left
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel?.sizeToFit()
        titleLabel?.frame = CGRect(x: 0, y: 0, width: titleLabel!.width, height: height)
        imageView?.frame = CGRect(x: titleLabel!.width + 3, y: 0, width: self.width - titleLabel!.width, height: height)
    }
}
