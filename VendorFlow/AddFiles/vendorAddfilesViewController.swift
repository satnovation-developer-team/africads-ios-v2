//
//  vendorAddfilesViewController.swift
//  Afric Ads
//
//  Created by apple on 19/03/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class vendorAddfilesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    

    
    
    
    
    @IBOutlet weak var viw: UIView!
    @IBOutlet weak var viw2: UIView!
    @IBOutlet weak var bckViw: UIView!
    
    
    
    var blockArray = ["Block1","Block2","Block3"]
    
    var seleectedIndex1 = -1
    var collapse1 = false
    
    
    var seleectedIndex2 = -1
    var collapse2 = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bckViw.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        bckViw.layer.borderWidth = 0.5
        
      
    }
    

    
    
    
    @IBAction func serviceTypeSectionAction(_ sender: Any) {
        
        viw.alpha = 1
         viw2.alpha = 0
        
    }
    
    
    
    @IBAction func exploreSectionAction(_ sender: Any) {
        
        viw.alpha = 0
        viw2.alpha = 1
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0{
            
            
            
            
            return 1
        }else{
            
            
            
            
            
            return blockArray.count
        }
        
        
        
         
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
        
        if indexPath.section == 0{
        
        
        let cell1  = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath as IndexPath) as! AddDetailsTableViewCell
            cell1.selectionStyle = .none
        
        
        
        return cell1
    }else{
    
    let cell1  = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath as IndexPath) as! AddDetailsTableViewCell
               cell1.selectionStyle = .none
            cell1.blockNameLabl.text = blockArray[indexPath.row]
            cell1.choosefileBackviw.layer.cornerRadius = 5
           
           return cell1
    
    
    
    
    }
      }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0{
            
            
            if self.seleectedIndex1 == indexPath.row && collapse1 == true{
                                                  
                                                  return 145
                                                  }else {
                                                      return 55
                                                  }
            
            
            
            
        }else{
            
            if self.seleectedIndex2 == indexPath.row && collapse2 == true{
                                                  
            return 484
            }else {
               return 45
                }
            
            
        }
        
       
        
        
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           
        if indexPath.section == 0{
           
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
                    //let cell2 = tableView.cellForRow(at: indexPath) as! faqTableViewCell
                     
                          // cell2.rightImg.image = UIImage(named: "down")
          
           
        }else{
            
            
            tableView.deselectRow(at: indexPath, animated: true)
                                       
                                       if seleectedIndex2 == indexPath.row {
                                           
                                           if self.collapse2 == false {
                                               
                                               
                                                self.collapse2 = true
                                           }else{
                                            
                                               
                                               self.collapse2 = false
                                           }
                                           
                                           
                                       }else{
                                 self.collapse2 = true
                                    
                                   }
                                     self.seleectedIndex2 = indexPath.row
                                          tableView.reloadRows(at: [indexPath], with: .automatic)
            
        }
           
       }
    
   
}
