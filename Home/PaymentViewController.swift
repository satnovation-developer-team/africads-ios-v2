//
//  PaymentViewController.swift
//  Afric Ads
//
//  Created by apple on 13/03/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func homeActiom(_ sender: Any) {
        
        self.performSegue(withIdentifier: "gohome", sender: nil)
        
        
    }
    
    
    
    

}
