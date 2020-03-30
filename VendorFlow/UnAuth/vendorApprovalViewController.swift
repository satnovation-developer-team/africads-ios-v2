//
//  vendorApprovalViewController.swift
//  Afric Ads
//
//  Created by apple on 21/02/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class vendorApprovalViewController: UIViewController {

    
    
    @IBOutlet weak var mainViw: UIView!
    @IBOutlet weak var apprvviw: UIView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        apprvviw.layer.cornerRadius = 5
    }
    
    
    
    
    
    @IBAction func closeBtn(_ sender: Any) {
        
       
        self.performSegue(withIdentifier: "ottp", sender: nil)
        
        
    }
    
    
    
    


}
