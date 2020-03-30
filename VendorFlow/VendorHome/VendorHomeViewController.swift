//
//  VendorHomeViewController.swift
//  Afric Ads
//
//  Created by apple on 22/02/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import SideMenuSwift


class VendorHomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    
var names = ["1","2","3","4","5","6","7"]
var namess = ["Hotel Dwaraka","Hotel Empire","Hotel Dwaraka","Hotel Empire","Hotel Dwaraka","Hotel Empire","Hotel Dwaraka","Hotel Empire"]
    
    @IBOutlet weak var hometopViw: UIView!
    @IBOutlet weak var bckViw: UIView!
    @IBOutlet weak var optionviw: UIView!
    @IBOutlet weak var filterViw: UIView!
    @IBOutlet weak var tabelViw: UITableView!
    
    
    @IBOutlet weak var vieww1: UIView!
    @IBOutlet weak var vieww2: UIView!
    
    
    @IBOutlet weak var createBsnsListngBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        hometopViw.layer.masksToBounds = false
        hometopViw?.layer.shadowColor = UIColor.lightGray.cgColor
        hometopViw?.layer.shadowOffset =  CGSize.zero
        hometopViw?.layer.shadowOpacity = 0.5
        hometopViw?.layer.shadowRadius = 4
        
        
        optionviw.layer.masksToBounds = false
        optionviw?.layer.shadowColor = UIColor.lightGray.cgColor
        optionviw?.layer.shadowOffset =  CGSize.zero
        optionviw?.layer.shadowOpacity = 1.5
        optionviw?.layer.shadowRadius = 4
        
        
        filterViw.layer.masksToBounds = false
        filterViw.layer.cornerRadius = 5
        filterViw?.layer.shadowColor = UIColor.lightGray.cgColor
        filterViw?.layer.shadowOffset =  CGSize.zero
        filterViw?.layer.shadowOpacity = 2
        filterViw?.layer.shadowRadius = 4
        
        createBsnsListngBtn.layer.cornerRadius = 5
        
        bckViw.layer.masksToBounds = false
        bckViw.layer.shadowRadius = 0.5
        bckViw.layer.shadowOpacity = 0.5
        bckViw.layer.shadowColor = UIColor.lightGray.cgColor
        bckViw.layer.shadowOffset = CGSize(width: 0 , height:1)
        
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        names.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
        
        let cell1  = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath as IndexPath) as! VendorHomeTableViewCell
        cell1.selectionStyle = .none
        
        cell1.snoField.text = names[indexPath.row]
        cell1.nameField.text = namess[indexPath.row]
        
        return cell1
      }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        return 138
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        
        
    }
    
    
    
    @IBAction func menuAction(_ sender: Any) {
        
        
        self.sideMenuController?.revealMenu()
        
        
        
    }
    
    
    @IBAction func masterAdminAction(_ sender: Any) {
        
        vieww1.alpha = 1
        vieww2.alpha = 0
        
        
    }
    
   
    
    
    @IBAction func subAdminAction(_ sender: Any) {
        
        vieww1.alpha = 0
        vieww2.alpha = 1
        
        
    }
    
    
    
    
    @IBAction func ceateNewBusinessListingAction(_ sender: Any) {
        
        
        
        
        
        
        
    }
    

}
