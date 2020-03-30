//
//  BookingsTableViewCell.swift
//  Afric Ads
//
//  Created by apple on 03/03/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class BookingsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var backshadowViw: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var hotelNameFiedl: UILabel!
    @IBOutlet weak var addressFiedl: UILabel!
    @IBOutlet weak var bookingTimeField: UILabel!
    @IBOutlet weak var orderField: UILabel!
    @IBOutlet weak var statutsfiedl: UILabel!
    @IBOutlet weak var detailsBtn: UIButton!
    @IBOutlet weak var cancelRequestBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
      
        
        backshadowViw.layer.shadowColor = UIColor.lightGray.cgColor
        backshadowViw.layer.shadowOpacity = 1
        backshadowViw.layer.shadowOffset = CGSize.zero
        backshadowViw.layer.shadowRadius = 5
        backshadowViw.layer.cornerRadius = 5
        
        
        
        
        self.img.layer.masksToBounds = true
         self.img.layer.cornerRadius = 8

    }
    
    
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
