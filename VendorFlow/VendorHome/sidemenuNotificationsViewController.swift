//
//  sidemenuNotificationsViewController.swift
//  Afric Ads
//
//  Created by apple on 19/03/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class sidemenuNotificationsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    

    override func viewDidLoad() {
        super.viewDidLoad()

       
        
        
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 10
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
        
        
        let cell1  = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath as IndexPath) as! sidemenuNotificationsTableViewCell
              
              cell1.selectionStyle = .none
        
        
        return cell1
        
       }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 120
    }

    
    
    
    @IBAction func bckbtn(_ sender: Any) {
    }
    
    
    
}
