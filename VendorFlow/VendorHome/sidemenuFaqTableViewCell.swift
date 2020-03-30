//
//  sidemenuFaqTableViewCell.swift
//  Afric Ads
//
//  Created by apple on 19/03/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class sidemenuFaqTableViewCell: UITableViewCell {

    
    
    
    @IBOutlet weak var namefield: UILabel!
       
       @IBOutlet weak var rightImg: UIImageView!
       
       @IBOutlet weak var questionfield: UILabel!
       @IBOutlet weak var ansrField: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
