//
//  NearByTableViewCell.swift
//  Afric Ads
//
//  Created by apple on 03/03/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class NearByTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var nearbyImg: UIImageView!
    @IBOutlet weak var nearByMallField: UILabel!
    @IBOutlet weak var nearByRoadField: UILabel!
    @IBOutlet weak var nearByKilomtrField: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.nearbyImg.layer.masksToBounds = true
        self.nearbyImg.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
