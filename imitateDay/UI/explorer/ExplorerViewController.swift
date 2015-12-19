//
//  ExplorerViewController.swift
//  imitateDay
//
//  Created by 振亮 孙 on 15/12/10.
//  Copyright © 2015年 papa.studio. All rights reserved.
//

import UIKit
import PullToRefresh

class ExplorerViewController: MainViewController, TabViewStackProtocol{

    private var scrollView: UIScrollView!
    
    private var dayView: MainTableView!
    
    private var albumView: MainTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置导航器
        setNavigator()
        
        // 因为有每天和美辑 2个table, 所以初始化一个uiview, 里面放2个uitableview
        setScrollableView()
        
        // 设置每天的页面
        setDayView()
        
        // 设置美辑的页面
        setAlbumView()
    }
    
    private func setNavigator(){
        let viewStack = TabViewStack(leftText: "美天", rightText: "美辑")
        viewStack.frame = CGRectMake(0, 0, 120, 44)
        navigationItem.titleView = viewStack
    }
    
    private func setScrollableView() {
        
        // http://m.blog.csdn.net/blog/humingtao2013/27662093
        self.automaticallyAdjustsScrollViewInsets = false
        
        scrollView = UIScrollView(frame: CGRectMake(0, 0, AppWidth * 2, AppHeight - NavigationHeight - 49)) //49 为tabbar的高度
        // 背景颜色
        scrollView.backgroundColor = theme.SBackgroundColor
        scrollView.contentSize = CGSizeMake(AppWidth * 2, 0)
        // 不显示横竖滚动条
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        // 按页面显示.防止显示半屏
        scrollView.pagingEnabled = true
        // 设置代理
        scrollView.delegate = self
        // 添加到舞台
        view.addSubview(scrollView)
    }
    
    /**
     初始化美天页面
     */
    private func setDayView() {
        
        dayView = MainTableView(frame: CGRectMake(0, 0, AppWidth, AppHeight - NavigationHeight), style: .Grouped, dataSource: self, delegate: self)
        scrollView.addSubview(dayView)
        dayView.addPullToRefresh(SPullToRefresh(), action: {
            // 创建一个延时
            let delayTime = dispatch_time(DISPATCH_TIME_NOW,
                Int64(0.5 * Double(NSEC_PER_SEC)))
            dispatch_after(delayTime, dispatch_get_main_queue()) {
                // 获取数据 1:成功,2:失败返回
                // 停止刷新
                // 列表加载新数据
                DayModel.loadData(){
                    (_, _) in
                    print("hello")
                }
            }
        })
    }
    
    
    /**
     初始化美辑页面
     */
    private func setAlbumView() {
        
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
