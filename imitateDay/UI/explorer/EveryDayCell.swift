//
//  EveryDayCell.swift
//  imitateDay
//
//  Created by 振亮 孙 on 15/12/13.
//  Copyright © 2015年 papa.studio. All rights reserved.
//

import UIKit
import Kingfisher

class EveryDayCell: UITableViewCell {
    
    @IBOutlet weak var lblCellTitle: UILabel!
    @IBOutlet weak var lblMonth: UILabel!
    @IBOutlet weak var lblDay: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var imgBG: UIImageView!
    
    var day:Day? {
        didSet {
            lblCellTitle.text = day?.events?.last?.title
            lblMonth.text = day?.month
            lblDay.text = day?.day

            let imageURL = NSURL(string: day?.events!.last!.imgs!.last! ?? "quesheng") // ?? "quesheng"
            let resource = Resource(downloadURL: imageURL!, cacheKey: "your_customized_key")
            imgBG.kf_setImageWithResource(resource, placeholderImage: UIImage(named: "quesheng")!)
        }
    }
    
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
