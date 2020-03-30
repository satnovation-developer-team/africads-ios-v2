//
//  sideMenuBusinessProfileViewController.swift
//  Afric Ads
//
//  Created by apple on 19/03/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class sideMenuBusinessProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

  
    
    
    @IBAction func editAction(_ sender: Any) {
        
        self.performSegue(withIdentifier: "edit", sender: nil)
        
        
    }
    
    
    
    @IBAction func backAction(_ sender: Any) {
        
        
        dismiss(animated: true, completion: nil)
        
        
        
    }
    
    
    

}
