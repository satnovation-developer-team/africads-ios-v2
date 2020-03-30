//
//  bycityTableViewCell.swift
//  Afric Ads
//
//  Created by apple on 11/03/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class bycityTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var cityNamefield: UILabel!
    @IBOutlet weak var cityBtn: UIButton!
    @IBOutlet weak var citySelection: UIButton!
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
