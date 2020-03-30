//
//  profileTableViewCell.swift
//  Afric Ads
//
//  Created by apple on 28/02/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class profileTableViewCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var nameField: UILabel!
    @IBOutlet weak var subNameField: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
