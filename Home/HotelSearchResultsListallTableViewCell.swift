//
//  HotelSearchResultsListallTableViewCell.swift
//  Afric Ads
//
//  Created by apple on 12/03/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class HotelSearchResultsListallTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var nameField: UILabel!
    @IBOutlet weak var addressfield: UITextView!
    @IBOutlet weak var kiloMeterField: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
         self.img1.layer.masksToBounds = true
         self.img1.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
