//
//  VendorResetPasswordViewController.swift
//  Afric Ads
//
//  Created by apple on 20/02/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import TextFieldEffects
import Alamofire


class VendorResetPasswordViewController: UIViewController {

     var reset:String!
    
    
    @IBOutlet weak var newPasswordTF: HoshiTextField!
    @IBOutlet weak var confirmPasswordTF: HoshiTextField!
    @IBOutlet weak var resetBtn: UIButton!
    @IBOutlet weak var restLbl: UILabel!
    @IBOutlet weak var newpswrdlbl: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resetBtn.layer.cornerRadius = 25
        
        
        resetBtn.setTitle("Reset Password".localized(withComment:"so"), for: .normal)
        restLbl.text = "Reset  Your Password".localized(withComment:"so")
        confirmPasswordTF.text = "Enter a New Password to Reset".localized(withComment:"so")
        
        
     
               print("---->Val\(reset)")
    }
    

    @IBAction func resetBtnAction(_ sender: Any) {
        
        if newPasswordTF.text == "" || confirmPasswordTF.text == "" {
                          
      presentAlert(withTitle: "Afric Ads", message: "Fill Required Fields")
                          
              
      }else if   newPasswordTF.text == "" && confirmPasswordTF.text == ""  {
                          
    presentAlert(withTitle: "Afric Ads", message: "Fill Remaining Fields")
            
      } else if newPasswordTF.text != confirmPasswordTF.text {
        
                
       presentAlert(withTitle: "Afric Ads", message: "NewPassword Mismatch")
                
       }
         else{
                  
          postReset()
                  
        }
            
    }
   
    
    
     func postReset(){

     
            DispatchQueue.main.async{
                //self.hud.show(true)
                 LoaderManager.shared.showLoader()
            }
            

            let parameters: Parameters = [ "username" : reset, "otpToken" :UserDefaults.standard.string(forKey:"otp"),"newPassword" : newPasswordTF.text!]
             
         
         let baseUrl = ApiUrl.shared.baseUrl
                             let query = "user-reset-password"
                             let finalUrl = "\(baseUrl)\(query)"
                
         
            
            let ulr =  NSURL(string:"\(finalUrl)" as String)
          var request = URLRequest(url: ulr! as URL)
                       request.httpMethod = "POST"
                       request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            let data = try! JSONSerialization.data(withJSONObject: parameters, options: JSONSerialization.WritingOptions.prettyPrinted)

                       let json = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
                       if let json = json {
                           print(json)
                       }
                       request.httpBody = json!.data(using: String.Encoding.utf8.rawValue);


            Alamofire.request(request as! URLRequestConvertible).responseJSON {
                                  response in
                                  do
                                  {
                                      DispatchQueue.main.async{
                                        
                                          LoaderManager.shared.showLoader()
                                      }

                                     print(response)
                                    self.performSegue(withIdentifier: "bck", sender: nil)
                                  }
                                  catch let error{
                                      print(error)
                                  }
                                  DispatchQueue.main.async{
                                    
                                      LoaderManager.shared.hideLoader()
                                  }
                              }

        }

        
    
    
    
    
}
