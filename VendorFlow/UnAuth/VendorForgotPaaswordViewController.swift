//
//  VendorForgotPaaswordViewController.swift
//  Afric Ads
//
//  Created by apple on 20/02/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import TextFieldEffects
import Alamofire


class VendorForgotPaaswordViewController: UIViewController {

    
    
    @IBOutlet weak var restLbl: UILabel!
    @IBOutlet weak var entermblinmrLl: UILabel!
    @IBOutlet weak var emaiFieldTF: HoshiTextField!
    @IBOutlet weak var submit: UIButton!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        submit.layer.cornerRadius = 25
        submit.setTitle("Submit".localized(withComment:"so"), for: .normal)
        restLbl.text = "Reset Your Password".localized(withComment:"so")
        entermblinmrLl.text = "Enter a Mobile Number to Reset your password".localized(withComment:"so")
        
    }
    
    
    
    
    
    
    @IBAction func submitActin(_ sender: Any) {
           
        
        if emaiFieldTF.text == ""  {
                           
         presentAlert(withTitle: "Afric Ads", message: "Fill Required Fields")
                           
               
     }else {
                   
      let vc = self.storyboard?.instantiateViewController(withIdentifier: "vendrOtp2ViewController") as! vendrOtp2ViewController
      forgotPasswordMethod()
       vc.otp = emaiFieldTF.text
                        //  //emailfield.text = email
      self.present(vc, animated: true, completion: nil)
                   
               }
        
           
       }
    
    
    
    
    
       func forgotPasswordMethod(){
         
                   DispatchQueue.main.async{
                       //self.hud.show(true)
                        LoaderManager.shared.showLoader()
                   }
           
           
           let baseUrl = ApiUrl.shared.baseUrl
                        let query = "user-forgot-password"
                        let finalUrl = "\(baseUrl)\(query)"
           
           
                   let targetURL = URL(string: "\(finalUrl)")
                   var request = URLRequest(url: targetURL!)
                   request.httpMethod = "POST"
                   request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                  // request.setValue("CODEX@123",forHTTPHeaderField: "x-api-key")
                   let values = ["username": emaiFieldTF.text!]
                   request.httpBody = try! JSONSerialization.data(withJSONObject: values, options: [])
                 
                   Alamofire.request(request as! URLRequestConvertible).responseJSON {
                                         response in
                                         do
                                         {
                                             DispatchQueue.main.async{
                                                 LoaderManager.shared.showLoader()
                                             }
                                           let jsonResponse = try JSONSerialization.jsonObject(with: response.data!, options: .mutableContainers) as! NSDictionary
                                           if jsonResponse["message"] as! String == "Password Reset Token!"{}

                                           
                                          // let token = jsonResponse["otp"]
                                           //print("User--->\(token)")
                                           
                                           
                                            print("Forget Vendor ----->\(response)")
                                           
                                        let otpcode = jsonResponse["otp"] as! Int
                                        let defaults = UserDefaults.standard.setValue(otpcode, forKey: "otp")
                                           
                                           
                                          //  self.performSegue(withIdentifier: "otp", sender: nil)
                                            // self.performSegue(withIdentifier: "reset", sender: nil)
                                            //self.removeSpinner()
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
