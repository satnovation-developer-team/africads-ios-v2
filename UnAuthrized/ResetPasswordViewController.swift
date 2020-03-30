//
//  ResetPasswordViewController.swift
//  Afric Ads
//
//  Created by apple on 17/02/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import TextFieldEffects
import Alamofire

class ResetPasswordViewController: UIViewController {

    var reset:String!
    
    
    @IBOutlet weak var resetBtn: UIButton!
    @IBOutlet weak var newpasswrd: HoshiTextField!
    @IBOutlet weak var confirmpasswrd: HoshiTextField!
    @IBOutlet weak var restLbl: UILabel!
    @IBOutlet weak var newPswrdLbl: UILabel!
    
    
    var resetLanguageChange:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
//        if resetLanguageChange == "SELECT LANGUAGE / Xulo LUUQADAHA"
//                     {
//                                    
//                      
//     resetBtn.setTitle("Reset Password".localized(withComment:"so"), for: .normal)
//    restLbl.text = "Reset  Your Password".localized(withComment:"so")
//    newPswrdLbl.text = "Enter a New Password to Reset".localized(withComment:"so")
//    newpasswrd.placeholder = "New Password"
//    confirmpasswrd.placeholder = "Confirm Password"
//                        
//                        
//        }else{
//            
//            
//            resetBtn.setTitle("Dib u dejinta erayga sirta ah".localized(withComment:"so"), for: .normal)
//            restLbl.text = "Dib u dejiso lambarkaaga sirta ah".localized(withComment:"so")
//            newPswrdLbl.text = "Gali eray cusub si aad dib ugu dejiso".localized(withComment:"so")
//            newpasswrd.placeholder = "Sirta cusub"
//            confirmpasswrd.placeholder = "Xaqiiji erayga sirta ah"
//            
//        }
        
        
        resetBtn.layer.cornerRadius = 25
        print("---->Val\(reset)")
       // resetBtn.setTitle("Reset Password".localized(withComment:"so"), for: .normal)
       // restLbl.text = "Reset  Your Password".localized(withComment:"so")
       // newPswrdLbl.text = "Enter a New Password to Reset".localized(withComment:"so")
                      
    }
    
    
    
    @IBAction func backButton(_ sender: Any) {
        
         self.dismiss(animated: true, completion: nil)
        
    }
    
          func postReset(){

    
           DispatchQueue.main.async{
               //self.hud.show(true)
                LoaderManager.shared.showLoader()
           }
           

           let parameters: Parameters = [ "username" : reset, "otpToken" :UserDefaults.standard.string(forKey:"otp"),"newPassword" : newpasswrd.text!]
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
            self.performSegue(withIdentifier: "back", sender: nil)
                
            }
            catch let error{
            print(error)
            }
            DispatchQueue.main.async{
                                   
            LoaderManager.shared.hideLoader()
            }
            }

       }

       
    
    
    
    
    
    @IBAction func resetAction(_ sender: Any) {
        
        
        
         if newpasswrd.text == "" || confirmpasswrd.text == "" {
                    
         presentAlert(withTitle: "Afric Ads", message: "Fill Required Fields")
                    
          }else if   newpasswrd.text == "" && confirmpasswrd.text == ""  {
                       presentAlert(withTitle: "Afric Ads", message: "Fill Remaining Fields")
         }else if newpasswrd.text != confirmpasswrd.text {
          
                  
         presentAlert(withTitle: "Afric Ads", message: "NewPassword & Confirm Password Mismatch")
                  
         }
         else{
            
            postReset()
            
        }
        
        
    }
    
    
    
    
    @IBAction func backAction(_ sender: Any) {
        
        
        
    }
    

}
