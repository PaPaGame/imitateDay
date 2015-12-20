//
//  DayModel.swift
//  imitateDay
//
//  Created by 振亮 孙 on 15/12/17.
//  Copyright © 2015年 papa.studio. All rights reserved.
//

import Foundation

class DayModel: NSObject {
    
    var msg: String?
    
    var code: Int?
    
    var list:[Day]?
    
    class func loadData(complete: (data:DayModel, error:NSError?) -> ()) {
//        NetManager.sharedInstance.request("http://www.joint001.com/szl/rnd.php", params: nil) {
//            (data, error) in
//            print(data)
//        }
        
        let path = NSBundle.mainBundle().pathForResource("events", ofType: nil)
        let data = NSData(contentsOfFile: path!)
        guard data != nil else {
            print("没有数据")
            return
        }
        let allData = DataParser.convertToDayModel(data!)
        complete(data: allData, error: nil)
    }
}

class Day: NSObject {
    var data: String?
    var events:[EventModel]?
    var themes:[ThemeModel]?
}

class EventModel: NSObject {
    var feel: String?
    /// 分享url地址
    var shareURL: String?
    var note: String?
    var questionURL: String?
    /// 电话
    var telephone: String?
    /// 标签
    var tag: String?
    /// 编号
    var id: Int = -1
    /// 标题
    var title:String?
    /// 详情
    var detail: String?
    /// cellTitle
    var feeltitle: String?
    /// 城市
    var city: String?
    /// 地址
    var address: String?
    /// 店详情店名
    var remark: String?
    /// 顶部图片数组
    var imgs: [String]?
    /// 猜你喜欢
//    var more: [GuessLikeModel]?
    /// cell内容
    var mobileURL: String?
    /// 位置
    var position: String?
    
    // 辅助模型
    /// 标记是否需要显示距离
    var isShowDis = false
    /// 计算出用户当前位置距离店铺我距离,单位km
    var distanceForUser: String?
}

class ThemeModel: NSObject {
    
}
