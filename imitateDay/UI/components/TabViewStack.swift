////
////  TabViewStack.swift
////  imitateDay
////
////  Created by 振亮 孙 on 15/12/13.
////  Copyright © 2015年 papa.studio. All rights reserved.
////
import UIKit

class TabViewStack: UIView {
    
    private let leftButton: UnhighLightButton = UnhighLightButton()
    private let rightButton: UnhighLightButton = UnhighLightButton()
    // 文本颜色
    private let textColor: UIColor = UIColor(red: 100 / 255.0, green: 100 / 255.0, blue: 100 / 255.0, alpha: 1)
    private let font: UIFont = theme.DefaultNavFontSize

    private var selButton: UIButton?
    weak var delegate:TabViewStackProtocol?
    
    private var bottomLineView: UIView = UIView()
    convenience init(leftText: String, rightText: String) {
        self.init()
        //设置2个按钮
        createButton(leftButton, label: leftText, index: 0)
        createButton(rightButton, label: rightText, index: 1)
        // 设置按钮下面移动的黑线
        setBottomLineView()
        
    }
    
    private func createButton(btn: UIButton, label: String, index: Int) {
        btn.setTitleColor(UIColor.blackColor(), forState: .Selected)
        btn.setTitleColor(textColor, forState: .Normal)
        btn.titleLabel?.font = font
        btn.tag = index
        btn.addTarget(self, action: "tabStackTitleClickHandler:", forControlEvents: .TouchUpInside)
        btn.setTitle(label, forState: .Normal)
        addSubview(btn)
    }
    
    @objc private func tabStackTitleClickHandler(sender: UIButton) {
        selButton?.selected = false
        selButton = sender
        selButton?.selected = true
        
        //播放移动动画
        moveToTag(sender.tag)
    }
    
    private func setBottomLineView() {
        bottomLineView.backgroundColor = UIColor.blackColor()
        addSubview(bottomLineView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let btnW = width * 0.5
        leftButton.frame = CGRectMake(0, 0, btnW, height)
        rightButton.frame = CGRectMake(btnW, 0, btnW, height)
        bottomLineView.frame = CGRectMake(0, height - 2 , btnW, 2)
    }
    
    func moveToTag(tag: Int) {
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.bottomLineView.frame.origin.x = CGFloat(tag) * self.bottomLineView.width
        })
    }
}


protocol TabViewStackProtocol: NSObjectProtocol {
    
}

class UnhighLightButton: UIButton {
    
    /// 没有高亮的按钮
    override var highlighted: Bool {
        didSet {
            return super.highlighted = false
        }
    }
}