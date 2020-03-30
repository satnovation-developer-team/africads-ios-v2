//
//  NotificationTableViewCell.swift
//  Afric Ads
//
//  Created by apple on 03/03/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {

    
    @IBOutlet weak var backShdwViw: UIView!
    @IBOutlet weak var dateField: UILabel!
    @IBOutlet weak var notictionField: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
          backShdwViw.layer.shadowColor = UIColor.lightGray.cgColor
          backShdwViw.layer.shadowOpacity = 1
              backShdwViw.layer.shadowOffset = CGSize.zero
              backShdwViw.layer.shadowRadius = 5
              backShdwViw.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
