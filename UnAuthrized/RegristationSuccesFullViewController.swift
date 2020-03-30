//
//  RegristationSuccesFullViewController.swift
//  Afric Ads
//
//  Created by apple on 19/02/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class RegristationSuccesFullViewController: UIViewController {

    
    @IBOutlet weak var regstrnSuccsLbl: UILabel!
    @IBOutlet weak var loginbtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       loginbtn.setTitle("LOGIN".localized(withComment:"so"), for: .normal)
       regstrnSuccsLbl.text = "Registration Successfully".localized(withComment:"so")
    }
    

    @IBAction func logAction(_ sender: Any) {
        
        
        self.performSegue(withIdentifier: "log", sender: nil)
        
        
    }
    

}
