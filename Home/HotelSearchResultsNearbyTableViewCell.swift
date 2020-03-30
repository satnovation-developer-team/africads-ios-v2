//
//  HotelSearchResultsNearbyTableViewCell.swift
//  Afric Ads
//
//  Created by apple on 12/03/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class HotelSearchResultsNearbyTableViewCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var namefield: UILabel!
    @IBOutlet weak var addresslbl: UITextView!
    @IBOutlet weak var kilometerLbl: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        self.img.layer.masksToBounds = true
        self.img.layer.cornerRadius = 8
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
