//
//  DayModel.swift
//  imitateDay
//
//  Created by 振亮 孙 on 15/12/17.
//  Copyright © 2015年 papa.studio. All rights reserved.
//

import Foundation
import SwiftyJSON

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
    
    static func parse(data: [AnyObject]?) -> [Day]{
        var result: [Day] = [];
        data?.forEach{
            let d = Day();
            let dayJson = JSON($0);
            if let date = dayJson["date"].rawString() {
                d.data = date;
            }
            
            if let events = dayJson["events"].array {
                d.events = [];
                events.forEach{
                    var e = EventModel();
                    e.parse($0.rawValue);
                    d.events?.append(e);
                }
            }
            
            if let themes = dayJson["themes"].array {
                d.themes = [];
                themes.forEach{
                    var t = ThemeModel();
                    t.parse($0.rawValue);
                    d.themes?.append(t);
                }
            }
            
            result.append(d);
        }
        return result;
    }
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

//ModelParserType
protocol ModelParserType{
    
    ///mirror缓存
//    static var mirror: Mirror?{get set}
    
    ///解析数据
    mutating func parse(data: AnyObject?)
}
extension ModelParserType where Self: NSObject{
    
    mutating func parse(data: AnyObject?){
        guard let data = data else {return;}
//        guard let mirror = Self.mirror else {
//            Self.mirror = Mirror(reflecting: self);
//            parse(data);
//            return;
//        }
        let mirror = Mirror(reflecting: self);
        mirror.children.forEach{
            guard let n = $0.label else {return;}
            guard let v = data.valueForKey(n) else {return;}
            self.setValue(v, forKey: n);
        }
    }
}
extension ThemeModel: ModelParserType{}
extension EventModel: ModelParserType{}
