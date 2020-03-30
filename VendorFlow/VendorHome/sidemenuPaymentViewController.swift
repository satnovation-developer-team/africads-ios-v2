//
//  sidemenuPaymentViewController.swift
//  Afric Ads
//
//  Created by apple on 19/03/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class sidemenuPaymentViewController: UIViewController {

    
    
    @IBOutlet weak var paymntBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        paymntBtn.layer.cornerRadius = 20
    }
    

 
    @IBAction func backbtn(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
        
    }
    
    
    
}
