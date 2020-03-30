//
//  vendrOtp2ViewController.swift
//  Afric Ads
//
//  Created by apple on 22/02/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import TextFieldEffects
import Alamofire

class vendrOtp2ViewController: UIViewController {

    
    
     var otp:String!
    
    @IBOutlet weak var otp1Field: HoshiTextField!
    @IBOutlet weak var otp2Field: HoshiTextField!
    @IBOutlet weak var otp3Field: HoshiTextField!
    @IBOutlet weak var otp4Field: HoshiTextField!
    
    
    @IBOutlet weak var otpBtn: UIButton!
    @IBOutlet weak var verfcationlbl: UILabel!
    @IBOutlet weak var descrptinLbl: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        otp1Field.delegate = self
        otp2Field.delegate = self
        otp3Field.delegate = self
        otp4Field.delegate = self
        otpBtn.layer.cornerRadius = 25
        otp1Field.tag = 1
        otp2Field.tag = 2
        otp3Field.tag = 3
        otp4Field.tag = 4
        otpBtn.setTitle("Verify OTP".localized(withComment:"so"), for: .normal)
        verfcationlbl.text = "Verification".localized(withComment:"so")
        descrptinLbl.text = "Enter the Verification Code which we sent to mobile/email address".localized(withComment:"so")
        
        
    }
    

    @IBAction func verifyOtpAction(_ sender: Any) {
        
        
            postReset()
           
             
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
                                    
                                    print("---->US\(self.otp!)")
                                               let vc = self.storyboard?.instantiateViewController(withIdentifier: "VendorResetPasswordViewController") as! VendorResetPasswordViewController
                                             vc.reset = self.otp
                                               //emailfield.text = email
                                              // postReset()
                                               self.present(vc, animated: true, completion: nil)
                                    
                                    
                                    
                                     
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
extension vendrOtp2ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return textField.shouldChangeCustomOtp(textField: textField, string: string)

    }
}
