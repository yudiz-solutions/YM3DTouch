//
//  ListCell.swift
//  PeekPop3DTouch
//
//  Created by Yudiz Solutions Pvt.Ltd. on 04/01/17.
//  Copyright © 2017 Yudiz Solutions Pvt.Ltd. All rights reserved.
//

import UIKit

// Cell Class
class ListCell : UITableViewCell {
    @IBOutlet weak var btnForce: UIButton!
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// Cell Model Class 

class Company {
    var name:String
    var address:String
    var logo : UIImage
    var url:String
    init(name:String,address:String,url:String,logo:UIImage) {
        self.name = name
        self.address = address
        self.logo = logo
        self.url = url
    }
}
