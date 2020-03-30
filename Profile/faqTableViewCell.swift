//
//  faqTableViewCell.swift
//  Afric Ads
//
//  Created by apple on 11/03/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class faqTableViewCell: UITableViewCell {

    
    
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
