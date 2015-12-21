//
//  DataParser.swift
//  imitateDay
//
//  Created by 振亮 孙 on 15/12/20.
//  Copyright © 2015年 papa.studio. All rights reserved.
//

import Foundation
import SwiftyJSON

class DataParser {
    class func convertToDayModel(data: NSData) -> DayModel {
        let jsonData:JSON!
        do {
            let json = try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
            jsonData = JSON(json!)
        } catch {
            print("Unsupport filetype :(")
        }
        
        let result = DayModel()
        result.msg = jsonData!["msg"].rawString()
        result.code = jsonData["code"].int
//        result.list = jsonData["list"].arrayObject as? [Day]
        result.list = Day.parse(jsonData["list"].arrayObject);
        
        return result
    }
    
    private static func getAllPropertiesName(cls: AnyClass) -> Array<String> {
        var arrName:[String] = []
        
        var count:UInt32 = 0
        let properties = class_copyPropertyList(cls, &count)
        for i in 0..<count {
            let property = properties[Int(i)]
            
            // 属性名称
            let cname = property_getName(property)
            let name = String.fromCString(cname)!
            arrName.append(name)
        }

        return arrName
    }
}
