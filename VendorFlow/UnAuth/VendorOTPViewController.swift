//
//  VendorOTPViewController.swift
//  Afric Ads
//
//  Created by apple on 20/02/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import TextFieldEffects
import Alamofire

class VendorOTPViewController: UIViewController {

    
    var refr:String!
     var verfr:Int!
    
    @IBOutlet weak var otp1Field: HoshiTextField!
    @IBOutlet weak var otp2Field: HoshiTextField!
    @IBOutlet weak var otp3Field: HoshiTextField!
    @IBOutlet weak var otp4Field: HoshiTextField!
    
    @IBOutlet weak var verfictionLbl: UILabel!
    @IBOutlet weak var descrptinLbl: UILabel!
    
    
    @IBOutlet weak var mainViw: UIView!
    @IBOutlet weak var apprvlViw: UIView!
    
    @IBOutlet weak var vendorOtpBtn: UIButton!
    @IBOutlet weak var oottplabel: UILabel!
    @IBOutlet weak var otpVsble: UIImageView!
    
    
    var vendorotpLanguageChange:String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        
//        if vendorotpLanguageChange == "SELECT LANGUAGE / Xulo LUUQADAHA"
//        {
//                       
//        vendorOtpBtn.setTitle("Verify OTP".localized(withComment:"so"), for: .normal)
//        verfictionLbl.text = "Verification".localized(withComment:"so")
//        descrptinLbl.text = "Enter the Verification Code which we sent to mobile/email address".localized(withComment:"so")
//        
//        }else{
//            
//            vendorOtpBtn.setTitle("Xaqiiji OTP".localized(withComment:"so"), for: .normal)
//           // resendOtpBtn.setTitle("Dib u gudub OTP?".localized(withComment:"so"), for: .normal)
//            verfictionLbl.text = "Xaqiijinta".localized(withComment:"so")
//            descrptinLbl.text = "Gali nambarka xaqiijinta ee aan u dirnay cinwaanka moobaylka / emaylka".localized(withComment:"so")
//            
//        }
        
        
        oottplabel.text = UserDefaults.standard.string(forKey:"verificationCode")
        
        
        otp1Field.delegate = self
        otp2Field.delegate = self
        otp3Field.delegate = self
        otp4Field.delegate = self
        vendorOtpBtn.layer.cornerRadius = 25
        otp1Field.tag = 1
        otp2Field.tag = 2
        otp3Field.tag = 3
        otp4Field.tag = 4
       
        
    }
    

   
    @IBAction func verifyOTPAction(_ sender: Any) {
        
        
        if (otp1Field.text?.isEmpty == true || otp2Field.text?.isEmpty == true || otp3Field.text?.isEmpty == true ||  otp4Field.text?.isEmpty == true){
                  
        presentAlert(withTitle: "Afric Ads", message: "Please Enter Above OTP")
                  
        }else{
        
     // print("OTp >>\(refr)")
    //  print("verfr >>\(refr)")
        
      postVendorOtp()
        
        }
    }
    
    
    
    @IBAction func backButton(_ sender: Any) {
        
         self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func resendOtpAction(_ sender: Any) {
        
        
        resendOtp()
        
         oottplabel.text = UserDefaults.standard.string(forKey:"verificationCode")
        
    }
    
    
    
    
    
    
    func postVendorOtp(){

            
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
                                            
                                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "VendorBusinessViewController") as! VendorBusinessViewController
                                           // vc.businsslanguageChnge = self.vendorotpLanguageChange
                                            // vc.refr = referenceCode
                                            //  vc.verfr = verificationCode
                                           // postAlomafire()
                                               self.present(vc, animated: true, completion: nil)
                                          // self.performSegue(withIdentifier: "bmk", sender: nil)
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

       
    
    
      func resendOtp(){
          
          
          
          
                          DispatchQueue.main.async{
                              //self.hud.show(true)
                               LoaderManager.shared.showLoader()
                          }
                          

                          let parameters  = ["referenceCode":UserDefaults.standard.string(forKey:"referenceCode")]
                           
                  
                  let baseUrl = ApiUrl.shared.baseUrl
                  let query = "vendor/resend-verify-vendor-register"
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



extension VendorOTPViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return textField.shouldChangeCustomOtp(textField: textField, string: string)

    }
}


