//
//  ContactusUserViewController.swift
//  Afric Ads
//
//  Created by apple on 11/03/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Alamofire

class ContactusUserViewController: UIViewController {

    
    
    @IBOutlet weak var addressfield: UILabel!
    @IBOutlet weak var timeField: UILabel!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

         contactUs()
    }
    

    
    
    
    @IBAction func backBtnAction(_ sender: Any) {
        
        
           self.dismiss(animated: true, completion: nil)
        
        
    }
    
    
    
    
    func contactUs(){
                       
                                 DispatchQueue.main.async{
                                     //self.hud.show(true)
                                      LoaderManager.shared.showLoader()
                                 }
                  
                                let baseUrl = ApiUrl.shared.baseUrl
                                let query = "contact-us"
                                let finalUrl = "\(baseUrl)\(query)"
                  
                                 let targetURL = URL(string: "\(finalUrl)")
                                 var request = URLRequest(url: targetURL!)
                                 request.httpMethod = "POST"
                                 request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                                // request.setValue("CODEX@123",forHTTPHeaderField: "x-api-key")
                  
                            // var myValue = userEmailField!.text
                            // var myValue2 = userEmailField!.text

                  
           let values = ["token":UserDefaults.standard.string(forKey:"userIdData")!] as [String : Any]
                                 request.httpBody = try! JSONSerialization.data(withJSONObject: values, options: [])
                               
              print(" VAlu >>  \(values)")
                 // 6e5dcc9f224f01dcc68aad0951a71753
                  print(values)
                  
                  
                  
                                 Alamofire.request(request as! URLRequestConvertible).responseJSON {
                                                       response in
                                                       do
                                                       {
                                                           DispatchQueue.main.async{
                                                               LoaderManager.shared.showLoader()
                                                              
                                                           }

                                                        let jsonResponse = try JSONSerialization.jsonObject(with: response.data!, options: .mutableContainers) as! [String:Any]
                                                        // if jsonResponse["message"] as! String == "Password Reset Successfully!"{
                                                                          
          //
                                                          
                                                          
                                                       //   print("update Res >> \(response)")
                                                         
                                                        let contact = jsonResponse["contact"]! as! [[String:Any]]
                                                          
                                                           print("  Contact >> \(contact)")
                                                           
                                                        
                                                        for i in contact {
                                                            
                                                          let sddress = i["address"] as! String
                                                            
                                                        let workingDetail = i["workingDetail"] as! String
                                                           print("  sddress >> \(sddress)")
                                                            self.addressfield.text! = sddress
                                                            self.timeField.text! = workingDetail
                                                          let mobile = i[""]
                                                            
                                                            
                                                        }
                                                        
                                                        
                                                     //   let workingDetail = contact["workingDetail"] as! String
                                                      // print("  workingDetail >> \(workingDetail)")
                                                        
                                                        
                                                        
                                                        
                                                        
                                                        
                                                        
                                                           
                                                      //  self.addressfield.text! = jsonResponse["address"] as! String
                                                        // self.timeField.text! = jsonResponse["workingDetail"]  as! String
                                                           
                                                           
                                                        
                                                           
                                                         
                                                            
                                                          //self.removeSpinner()
                                                       }
                                                       catch let error{
                                                          
                                                           print(error)
                                                          print("\n\n===========Error===========")
                                                          print("Error Code: \(error._code)")
                                                          print("Error Messsage: \(error.localizedDescription)")
                                                         
                                                          
                                                       }
                                                       DispatchQueue.main.async{
                                                           LoaderManager.shared.hideLoader()
                                                       }
                                                   }
                      
                     }
    
    
    
    
    
    
    
    

}
