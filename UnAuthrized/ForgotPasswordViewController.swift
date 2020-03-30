//
//  ForgotPasswordViewController.swift
//  Afric Ads
//
//  Created by apple on 17/02/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import TextFieldEffects
import Alamofire

class ForgotPasswordViewController: UIViewController {

    
    var email :String!
    
    var receivedForgotLanguage:String!
    
    static var userName = String()
    
    @IBOutlet weak var emailfield: HoshiTextField!
    @IBOutlet weak var submit: UIButton!
    
    @IBOutlet weak var resetpswrdlbl: UILabel!
    @IBOutlet weak var enterMblePhnlbl: UILabel!
    
    var msg = "Invalid Username!"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        submit.layer.cornerRadius = 25
        
        
        
//        if receivedForgotLanguage == "SELECT LANGUAGE / Xulo LUUQADAHA"
//        {
//                       
//         submit.setTitle("Submit".localized(withComment:"so"), for: .normal)
//          resetpswrdlbl.text = "Reset Your Password".localized(withComment:"so")
//          enterMblePhnlbl.text = "Enter a Mobile Number to Reset your password".localized(withComment:"so")
//            emailfield.placeholder = "Mobile Number/Email-id"
//            
//            
//        }else{
//            
//            submit.setTitle("Gudbi".localized(withComment:"so"), for: .normal)
//            resetpswrdlbl.text = "Dib u dejiso lambarkaaga sirta ah".localized(withComment:"so")
//            enterMblePhnlbl.text = "Gali nambarka mobilada si aad u furato eraygaaga sirta ah".localized(withComment:"so")
//             emailfield.placeholder = "Lambarka guuritaanka/I-maylka Ii-maylka"
//        }
        
        
        
       
        
        
        
    }
    
    @IBAction func submitAction(_ sender: Any) {
        
        
        forgotPasswordMethod()
        
        
        
//        if emailfield.text == ""  {
//
//                    presentAlert(withTitle: "Afric Ads", message: "Fill Required Fields")
//
//
//        }else if emailfield.text == msg {
//
//
//            presentAlert(withTitle: "Afric Ads", message: "Invalid User")
//
////            let vc = self.storyboard?.instantiateViewController(withIdentifier: "otpVerficationViewController") as! otpVerficationViewController
////                   forgotPasswordMethod()
////                   vc.otp = emailfield.text
////                 //  //emailfield.text = email
////                   self.present(vc, animated: true, completion: nil)
//
//        }else{
//
//
//
//
//        }
        
        
    }
    
    
    
    @IBAction func backButton(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
        // self.navigationController?.popViewController(animated: true)
        
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
                let values = ["username": emailfield.text!]
                request.httpBody = try! JSONSerialization.data(withJSONObject: values, options: [])
              
                Alamofire.request(request as! URLRequestConvertible).responseJSON {
                                      response in
                                      do
                                      {
                                          DispatchQueue.main.async{
                                              LoaderManager.shared.showLoader()
                                          }
                                        let jsonResponse = try JSONSerialization.jsonObject(with: response.data!, options: .mutableContainers) as! NSDictionary
                                        if jsonResponse["message"] as! String == "Password Reset Token!"{
                                            
                                            
                                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "otpVerficationViewController") as! otpVerficationViewController
                                            vc.otp = self.emailfield.text
                                            
                                            vc.otpReceiveLanguage = self.receivedForgotLanguage
                                            let otpcode = jsonResponse["otp"] as! Int
                                            let defaults = UserDefaults.standard.setValue(otpcode, forKey: "otp")
                                            self.present(vc, animated: true, completion: nil)
                                            
                                            UserDefaults.standard.set( self.emailfield.text!, forKey: "emailresetPassword") // saves text field text
                                            UserDefaults.standard.synchronize()
                                            
                                            
                                        }else{
                                            
                                            self.presentAlert(withTitle: "Afric Ads", message: "Invalid User")
                                            
                                        }
                                        
                                         print("Forget User ----->\(response)")
                                    
                                      }
                                      catch let error{
                                          print(error)
                                      }
                                      DispatchQueue.main.async{
                                          LoaderManager.shared.hideLoader()
                                      }
                                  }
     
    }
    
    
    func validate(email:String) -> Bool {
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: email)
        
    }
    
    
    
}
