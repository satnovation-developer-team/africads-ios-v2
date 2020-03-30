//
//  CancelViewController.swift
//  Afric Ads
//
//  Created by apple on 03/03/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class CancelViewController: UIViewController {

    
    @IBOutlet weak var backviw1: UIView!
    @IBOutlet weak var backviw2: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var cancelBookingBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        backviw1.layer.shadowColor = UIColor.lightGray.cgColor
        backviw1.layer.shadowOpacity = 1
        backviw1.layer.shadowOffset = CGSize.zero
        backviw1.layer.shadowRadius = 5
        backviw1.layer.cornerRadius = 5
             
        
        
          backviw2.layer.shadowColor = UIColor.lightGray.cgColor
           backviw2.layer.shadowOpacity = 1
               backviw2.layer.shadowOffset = CGSize.zero
               backviw2.layer.shadowRadius = 5
               backviw2.layer.cornerRadius = 5
        
        
        cancelBookingBtn.layer.cornerRadius = 25
        
        
    }
    

   

}
