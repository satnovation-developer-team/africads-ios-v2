//
//  MySubscriptionViewController.swift
//  Afric Ads
//
//  Created by apple on 19/03/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class MySubscriptionViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        
        
        
        
        
        
        
        
        
    }
    

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell1  = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath as IndexPath) as! MySubscriptionsTableViewCell
        
        cell1.selectionStyle = .none
        
        
        
        
        return cell1
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        return 60
    }
    
    
    
    
    
    
    @IBAction func backButton(_ sender: Any) {
        
      dismiss(animated: true, completion: nil)
        
        
    }
    
    
    
    
    
    
    

}
