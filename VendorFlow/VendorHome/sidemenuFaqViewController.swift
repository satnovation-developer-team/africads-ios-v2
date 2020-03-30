//
//  sidemenuFaqViewController.swift
//  Afric Ads
//
//  Created by apple on 19/03/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class sidemenuFaqViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

var names = ["FAQ's","Hotel Cancellation charges","Hotel Rescheduling Charges","Check status of Hotel","Payment/Refund","Other"]

    
    
    var seleectedIndex1 = -1
      var collapse1 = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return names.count
              }
              
              func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                  
                let cell1  = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath as IndexPath) as! sidemenuFaqTableViewCell
                cell1.selectionStyle = .none
             //  cell1.imgBtn.setImage(UIImage(named:(any_boolean_condition ? "checkedImage" : "uncheckedImage")), forState:UIControlState.Normal)
               //cell1.questionfield.text = "Qa. \(questions[indexPath.row])"
               //cell1.ansrField.text = "Ans. \(answers[indexPath.row])"
               
                cell1.namefield.text = names[indexPath.row]
                
                
                
                return cell1
              }
            
       
       
       
       
            func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
               
               
               
               if self.seleectedIndex1 == indexPath.row && collapse1 == true{
                                   
                                   return 195
                                   }else {
                                       return 55
                                   }
               
                
            }
       
       
       
       
       
       
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           
           
           
                     tableView.deselectRow(at: indexPath, animated: true)
                              
                              if seleectedIndex1 == indexPath.row {
                                  
                                  if self.collapse1 == false {
                                      
                                      
                                       self.collapse1 = true
                                  }else{
                                   
                                      
                                      self.collapse1 = false
                                  }
                                  
                                  
                              }else{
                        self.collapse1 = true
                           
                          }
                            self.seleectedIndex1 = indexPath.row
                                 tableView.reloadRows(at: [indexPath], with: .automatic)
                        
                    // let cell = tableView.cellForRow(at: indexPath) as! faqTableViewCell
                        
                              //  cell.newOderRightImg.image = UIImage(named: "downArw")
                     let cell2 = tableView.cellForRow(at: indexPath) as! sidemenuFaqTableViewCell
                     
                           cell2.rightImg.image = UIImage(named: "down")
          
           
           
           
       }
       
       
       
       
       
       func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
              
              
           let cell2 = tableView.cellForRow(at: indexPath) as! sidemenuFaqTableViewCell
                            
                                  cell2.rightImg.image = UIImage(named: "right")
           
           

             }
       
    
    
    @IBAction func backbtn(_ sender: Any) {
        
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    
    
    
    
    
}
