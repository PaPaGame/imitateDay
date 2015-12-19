//
//  NetManager.swift
//  imitateDay
//
//  Created by 振亮 孙 on 15/12/19.
//  Copyright © 2015年 papa.studio. All rights reserved.
//

import Foundation
import Alamofire

class NetManager {
    private static let instance = NetManager()
    
    class var sharedInstance:NetManager {
        return instance
    }
    
    typealias completion = (result: AnyObject?, error: NSError?) -> ()
    
    func request(baseUrl: String, params: [String: String]?, complete: completion) {
        Alamofire.request(.GET, baseUrl, parameters: params).responseJSON(){
            response in
                print(response.data)
        }
    }
}