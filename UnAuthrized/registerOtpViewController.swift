//
//  registerOtpViewController.swift
//  Afric Ads
//
//  Created by apple on 22/02/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Alamofire
import TextFieldEffects
import SkyFloatingLabelTextField

class registerOtpViewController: UIViewController {

    var refr:String!
    var verfr:Int!
    
    @IBOutlet weak var verfyLbl: UILabel!
    @IBOutlet weak var entrVerftnLblField: UILabel!
    
    @IBOutlet weak var verfyOtpBtn: UIButton!
    
    @IBOutlet weak var resendOtpBtn: UIButton!
    @IBOutlet weak var ootpLbl: UILabel!
    
    @IBOutlet weak var otp1field: HoshiTextField!
    @IBOutlet weak var otp2Field: HoshiTextField!
    @IBOutlet weak var otp3Field: HoshiTextField!
    @IBOutlet weak var otp4Field: HoshiTextField!
    
    var registeOtpLanguage:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
//        if registeOtpLanguage == "SELECT LANGUAGE / Xulo LUUQADAHA"
//              {
//                verfyOtpBtn.setTitle("Verify OTP".localized(withComment:"so"), for: .normal)
//                 resendOtpBtn.setTitle("Resend OTP?".localized(withComment:"so"), for: .normal)
//                verfyLbl.text = "Verification".localized(withComment:"so")
//                entrVerftnLblField.text = "Enter the Verification Code which we sent to mobile/email address".localized(withComment:"so")
//
//        }else {
//
//            verfyOtpBtn.setTitle("Xaqiiji OTP".localized(withComment:"so"), for: .normal)
//            resendOtpBtn.setTitle("Dib u gudub OTP?".localized(withComment:"so"), for: .normal)
//            verfyLbl.text = "Xaqiijinta".localized(withComment:"so")
//            entrVerftnLblField.text = "Gali nambarka xaqiijinta ee aan u dirnay cinwaanka moobaylka / emaylka".localized(withComment:"so")
//
//        }
        
      
        ootpLbl.text = UserDefaults.standard.string(forKey:"verificationCode")
        
        otp1field.delegate = self
        otp2Field.delegate = self
        otp3Field.delegate = self
        otp4Field.delegate = self
               
        otp1field.tag = 1
        otp2Field.tag = 2
        otp3Field.tag = 3
        otp4Field.tag = 4
        
       
         verfyOtpBtn.layer.cornerRadius = 25
        
    }
    
    
    
    @IBAction func verifyotpActtion(_ sender: Any) {
        
        if (otp1field.text?.isEmpty == true || otp2Field.text?.isEmpty == true || otp3Field.text?.isEmpty == true ||  otp4Field.text?.isEmpty == true){
            
            presentAlert(withTitle: "Afric Ads", message: "Please Enter Above OTP")
            
            
        }else{
            
             postVendorOtp()
            
        }
        
        
    }
    
    
    
    @IBAction func backButton(_ sender: Any) {
        
      self.dismiss(animated: true, completion: nil)
        
        
    }
    
    
    
    @IBAction func resendOtpAction(_ sender: Any) {
        
        
        resendOtp()
       ootpLbl.text = UserDefaults.standard.string(forKey:"verificationCode")
        
    }
    
    
    
    
    
    
     func postVendorOtp(){

             
                    DispatchQueue.main.async{
                        //self.hud.show(true)
                         LoaderManager.shared.showLoader()
                    }
                    

                    let parameters  = [ "referenceCode":UserDefaults.standard.string(forKey:"referenceCode"),"verificationCode":UserDefaults.standard.string(forKey:"verificationCode")]
                     
            
            let baseUrl = ApiUrl.shared.baseUrl
            let query = "customer/verify-customer-register"
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
                                            
                                           // let vc = self.storyboard?.instantiateViewController(withIdentifier: "LogInViewController") as! LogInViewController
                                                                                           //  vc.recievedLanguage = self.registeOtpLanguage
                                                                                             // vc.refr = referenceCode
                                               //   businessPopMainViw.alpha = 0
                                                                                             //  vc.verfr = verificationCode
                                                                                            // postAlomafire()
                                                                                               // self.present(vc, animated: true, completion: nil)
                                            
                                            
                                            
                    self.performSegue(withIdentifier: "sign", sender: nil)
                                             print("USEREGi >>> OTP\(response)")
                                            
                                          }
                                          catch let error{
                                              print(error)
                                          }
                                          DispatchQueue.main.async{
                                            
                                              LoaderManager.shared.hideLoader()
                                          }
                                      }

                }
    
    
    
    
    
    func resendOtp(){
        
        
        
        
                        DispatchQueue.main.async{
                            //self.hud.show(true)
                             LoaderManager.shared.showLoader()
                        }
                        

                        let parameters  = ["referenceCode":UserDefaults.standard.string(forKey:"referenceCode")]
                         
                
                let baseUrl = ApiUrl.shared.baseUrl
                let query = "customer/resend-verify-customer-register"
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
                                                
                                                
                                                
                                                
                                  let jsonResponse = try JSONSerialization.jsonObject(with: response.data!, options: .mutableContainers) as! NSDictionary
                      
                                                
                                                
                                                let userReferenceCode = jsonResponse["verificationCode"] as! Int
                                                let defaults = UserDefaults.standard.setValue(userReferenceCode, forKey: "verificationCode")
                                                                print(defaults)
                                                
                                                
                                                
                                                
                                                 print("USEREGi >>> OTP\(jsonResponse)")
                                                
                                                
                                                
                                                
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
extension registerOtpViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return textField.shouldChangeCustomOtp(textField: textField, string: string)

    }
}
