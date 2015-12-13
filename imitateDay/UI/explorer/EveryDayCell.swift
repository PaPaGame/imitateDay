//
//  EveryDayCell.swift
//  imitateDay
//
//  Created by 振亮 孙 on 15/12/13.
//  Copyright © 2015年 papa.studio. All rights reserved.
//

import UIKit

class EveryDayCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .None
    }
    
    class func everyDayCell(tableview: UITableView)-> EveryDayCell {
        
        let identifier = "eventCell"
        var cell = tableview.dequeueReusableCellWithIdentifier(identifier) as? EveryDayCell
        
        if cell == nil {
            cell = (NSBundle.mainBundle().loadNibNamed("EveryDayCell", owner: nil, options: nil).last as? EveryDayCell)!
        }
        return cell!
    }
}
