//
//  VendorHomeTableViewCell.swift
//  Afric Ads
//
//  Created by apple on 22/02/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class VendorHomeTableViewCell: UITableViewCell {

    @IBOutlet weak var snoField: UILabel!
    @IBOutlet weak var nameField: UILabel!
    
    
    @IBOutlet weak var viw: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viw.layer.masksToBounds = false
                viw?.layer.shadowColor = UIColor.lightGray.cgColor
               viw?.layer.shadowOffset =  CGSize.zero
               viw?.layer.shadowOpacity = 1.5
                      viw?.layer.shadowRadius = 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
