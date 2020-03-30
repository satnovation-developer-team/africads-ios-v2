//
//  otpVerficationViewController.swift
//  Afric Ads
//
//  Created by apple on 18/02/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import TextFieldEffects
import Alamofire


class otpVerficationViewController: UIViewController {

    
    var otp:String!
    
    @IBOutlet weak var verifyOtp: UIButton!
    @IBOutlet weak var verfictinLbl: UILabel!
    @IBOutlet weak var verfyDescLbl: UILabel!
    @IBOutlet weak var otp1Field: HoshiTextField!
    @IBOutlet weak var otp2Field: HoshiTextField!
    @IBOutlet weak var otp3Field: HoshiTextField!
    @IBOutlet weak var otp4Field: HoshiTextField!
    
    
    @IBOutlet weak var otpdslyField: UILabel!
    
    var otpReceiveLanguage:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("LLL > \(otpReceiveLanguage)")
        
        
//        if otpReceiveLanguage == "SELECT LANGUAGE / Xulo LUUQADAHA"
//               {
//                              
//                
//            verfictinLbl.text = "Verification".localized(withComment:"so")
//            verfyDescLbl.text = "Enter the Verification Code which we sent to mobile/email address".localized(withComment:"so")
//            verifyOtp.setTitle("Verify OTP".localized(withComment:"so"), for: .normal)
//                
//        
//        }else{
//            
//            verfictinLbl.text = "Xaqiijinta".localized(withComment:"so")
//            verfyDescLbl.text = "Gali nambarka xaqiijinta ee aan u dirnay cinwaanka moobaylka / emaylka".localized(withComment:"so")
//             verifyOtp.setTitle("Xaqiiji OTP".localized(withComment:"so"), for: .normal)
//            
//        }
        
        otp1Field.delegate = self
        otp2Field.delegate = self
        otp3Field.delegate = self
        otp4Field.delegate = self
        
        
      otpdslyField.text = UserDefaults.standard.string(forKey:"otp")
        
        
        otp1Field.tag = 1
        otp2Field.tag = 2
        otp3Field.tag = 3
        otp4Field.tag = 4
        
       // verifyOtp.setTitle("Verify OTP".localized(withComment:"so"), for: .normal)
       // verfictinLbl.text = "Verification".localized(withComment:"so")
       // verfyDescLbl.text = "Enter the Verification Code which we sent to mobile/email address".localized(withComment:"so")
        
        verifyOtp.layer.cornerRadius = 25
        
        
    }
    

    @IBAction func verifyOTPAction(_ sender: Any) {
        
        if (otp1Field.text?.isEmpty == true || otp2Field.text?.isEmpty == true || otp3Field.text?.isEmpty == true ||  otp4Field.text?.isEmpty == true){
                   
         presentAlert(withTitle: "Afric Ads", message: "Please Enter Above OTP")
                   
         }else{
            
        postReset()
        
        
        print("---->US\(otp!)")
         let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResetPasswordViewController") as! ResetPasswordViewController
             
             vc.reset = otp
            vc.resetLanguageChange = otpReceiveLanguage
            self.present(vc, animated: true, completion: nil)
        
        }
        
    }
    
    
    
    @IBAction func backButton(_ sender: Any) {
        
         self.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    
    
    
       func postReset(){

         
                DispatchQueue.main.async{
                    //self.hud.show(true)
                     LoaderManager.shared.showLoader()
                }
                

                let parameters  = [ "username":otp,"otpToken":UserDefaults.standard.string(forKey:"otp")]
                let baseUrl = ApiUrl.shared.baseUrl
                let query = "verify-user-otp"
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
                   // self.performSegue(withIdentifier: "otp", sender: nil)
                                         print("User verfy OTP >>\(response)")
                                        
                                      }
                                      catch let error{
                                          print(error)
                                      }
                                      DispatchQueue.main.async{
                                        
                                          LoaderManager.shared.hideLoader()
                                      }
                                  }

            }

    
    
    
    
       func postUserrOtp(){

               
                      DispatchQueue.main.async{
                          //self.hud.show(true)
                           LoaderManager.shared.showLoader()
                      }
                      

                      let parameters  = [ "referenceCode":UserDefaults.standard.string(forKey:"referenceCode"),"verificationCode":UserDefaults.standard.string(forKey:"verificationCode")]
                       
              
              let baseUrl = ApiUrl.shared.baseUrl
                                         let query = "vendor/verify-vendor-register"
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
                        self.performSegue(withIdentifier: "otpp", sender: nil)
                                               print(">>> OTP\(response)")
                                              
                                            }
                                            catch let error{
                                                print(error)
                                            }
                                            DispatchQueue.main.async{
                                              
                                                LoaderManager.shared.hideLoader()
                                            }
                                        }

                  }

          
    
    
    
    @IBAction func resendOtpAction(_ sender: Any) {
        
        
        resendotp()
         otpdslyField.text = UserDefaults.standard.string(forKey:"otp")
    }
    
    
    
    
    
    
    
    func resendotp(){
      
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
                let values = ["username":UserDefaults.standard.string(forKey:"emailresetPassword")!]
                request.httpBody = try! JSONSerialization.data(withJSONObject: values, options: [])
              
                Alamofire.request(request as! URLRequestConvertible).responseJSON {
                                      response in
                                      do
                                      {
                                          DispatchQueue.main.async{
                                              LoaderManager.shared.showLoader()
                                          }
                                        let jsonResponse = try JSONSerialization.jsonObject(with: response.data!, options: .mutableContainers) as! NSDictionary
                                      
                                        
                                         print("Forget User ----->\(jsonResponse)")
                                        
                                   let userReferenceCode = jsonResponse["otp"] as! Int
                                   let defaults = UserDefaults.standard.setValue(userReferenceCode, forKey: "otp")
                                   print(defaults)
                                        
                                        
                                    
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
























extension otpVerficationViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return textField.shouldChangeCustomOtp(textField: textField, string: string)

    }
}



extension UITextField {
    func shouldChangeCustomOtp(textField:UITextField, string: String) ->Bool {

        //Check if textField has two chacraters
        if ((textField.text?.count)! == 0  && string.count > 0) {
            let nextTag = textField.tag + 1;
            // get next responder
            var nextResponder = textField.superview?.viewWithTag(nextTag);
            if (nextResponder == nil) {
                nextResponder = textField.superview?.viewWithTag(1);
            }

            textField.text = textField.text! + string;
            //write here your last textfield tag
            if textField.tag == 4 {
                //Dissmiss keyboard on last entry
                textField.resignFirstResponder()
            }
            else {
                ///Appear keyboard
                nextResponder?.becomeFirstResponder();
            }
            return false;
        } else if ((textField.text?.count)! == 1  && string.count == 0) {// on deleteing value from Textfield

            let previousTag = textField.tag - 1;
            // get prev responder
            var previousResponder = textField.superview?.viewWithTag(previousTag);
            if (previousResponder == nil) {
                previousResponder = textField.superview?.viewWithTag(1);
            }
            textField.text = "";
            previousResponder?.becomeFirstResponder();
            return false
        }
        return true

    }

}

