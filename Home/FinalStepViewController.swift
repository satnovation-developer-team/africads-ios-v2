//
//  FinalStepViewController.swift
//  Afric Ads
//
//  Created by apple on 13/03/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class FinalStepViewController: UIViewController {

    
    
    @IBOutlet weak var payAmount: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        payAmount.layer.cornerRadius = 25
    }
    

    
    
    
    
    @IBAction func payAmountAction(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PaymentViewController") as! PaymentViewController
        
        self.present(vc, animated: true, completion: nil)
        
    }
    
    
    
    
    @IBAction func back(_ sender: Any) {
        
        
         self.navigationController?.popViewController(animated: true)
        
        
        
    }
    
   

}
