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
        NetManager.sharedInstance.request("renren.com", params: nil) {
            (data, error) in
            print(data)
        }
    }
}

class Day: NSObject {
    var events:[EventModel]?
    var themes:[ThemeModel]?
}

class EventModel: NSObject {
    
}

class ThemeModel: NSObject {
    
}
