//
//  ListAllTableViewCell.swift
//  Afric Ads
//
//  Created by apple on 05/03/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class ListAllTableViewCell: UITableViewCell {

    
    @IBOutlet weak var listAllimg: UIImageView!
    @IBOutlet weak var mallNameField: UILabel!
    @IBOutlet weak var addressField: UILabel!
    @IBOutlet weak var kiloMtrField: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.listAllimg.layer.masksToBounds = true
        self.listAllimg.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
