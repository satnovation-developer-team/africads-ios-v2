//
//  HomeListTableViewCell.swift
//  Afric Ads
//
//  Created by apple on 18/02/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class HomeListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var snoField: UILabel!
    @IBOutlet weak var nameField: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
