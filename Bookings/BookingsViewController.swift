//
//  BookingsViewController.swift
//  Afric Ads
//
//  Created by apple on 03/03/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class BookingsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
        let cell1  = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath as IndexPath) as! BookingsTableViewCell
        cell1.selectionStyle = .none
        
        //cell1.snoField.text = list[indexPath.row]
        //cell1.nameField.text = nameArray[indexPath.row]
        
        
        return cell1
      }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 214
    }
   

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "CancelViewController") as! CancelViewController
        self.navigationController?.pushViewController(loginVC, animated: true)
        
    }
}
