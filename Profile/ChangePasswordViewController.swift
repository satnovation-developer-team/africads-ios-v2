//
//  ChangePasswordViewController.swift
//  Afric Ads
//
//  Created by apple on 11/03/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import TextFieldEffects
import Alamofire

class ChangePasswordViewController: UIViewController {

    
    @IBOutlet weak var currentPasswrd: HoshiTextField!
    @IBOutlet weak var newPasswrd: HoshiTextField!
    @IBOutlet weak var confirmPasswrd: HoshiTextField!
    
    
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nextBtn.layer.cornerRadius = 25
    }
    

    
    
    
    
     func resetUser(){
                 
                           DispatchQueue.main.async{
                               //self.hud.show(true)
                                LoaderManager.shared.showLoader()
                           }
            
                          let baseUrl = ApiUrl.shared.baseUrl
                          let query = "user-reset-password"
                          let finalUrl = "\(baseUrl)\(query)"
            
                           let targetURL = URL(string: "\(finalUrl)")
                           var request = URLRequest(url: targetURL!)
                           request.httpMethod = "POST"
                           request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                          // request.setValue("CODEX@123",forHTTPHeaderField: "x-api-key")
            
                      // var myValue = userEmailField!.text
                      // var myValue2 = userEmailField!.text

            
        let values = ["username":UserDefaults.standard.string(forKey:"emailresetPassword")!,"newPassword":newPasswrd.text!,"currentPassword":currentPasswrd.text!] as [String : Any]
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

                                                    let jsonResponse = try JSONSerialization.jsonObject(with: response.data!, options: .mutableContainers) as! NSDictionary
                                                   if jsonResponse["message"] as! String == "Password Reset Successfully!"{
                                                                    
    //
                                                     let otpcode = jsonResponse["token"] as! Int
                                                    let defaults = UserDefaults.standard.setValue(otpcode, forKey:"otpreset")
                                                      
                                                    
                                                     self.performSegue(withIdentifier: "verfyotp", sender: nil)

                                                   }
                                                    
                                                     if jsonResponse["status"] as! Int == 127{
                                                    
                                                    self.presentAlert(withTitle: "Afric Ads", message: "Invalid Current Password!")
                                                    
                                                    
                                                    }
                                                    
                                                    
                                                    print("LogIn Res >> \(response)")
                                                   
                                                   
                                                      
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
    
    
    
    
    
    
    
    @IBAction func nextBtnAction(_ sender: Any) {
        
      
        
        if currentPasswrd.text == "" || newPasswrd.text == "" || confirmPasswrd.text == "" {
                           
                presentAlert(withTitle: "Afric Ads", message: "Fill Required Fields")
                           
        }else if  newPasswrd.text != confirmPasswrd.text {
            
             presentAlert(withTitle: "Afric Ads", message: "NewPassword & Confirm Password Mismatch")
             
        }else{
            
            
             resetUser()
            
        }
        
    }
    
    
    @IBAction func backBtn(_ sender: Any) {
        
           self.dismiss(animated: true, completion: nil)
        
        
    }
    
  

}
