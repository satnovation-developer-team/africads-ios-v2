//
//  ChangePasswordOtpViewController.swift
//  Afric Ads
//
//  Created by apple on 12/03/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import TextFieldEffects
import Alamofire

class ChangePasswordOtpViewController: UIViewController {

    
    
    
    @IBOutlet weak var verfyotpBtn: UIButton!
    
    @IBOutlet weak var otp1Field: HoshiTextField!
    @IBOutlet weak var otp2Field: HoshiTextField!
    @IBOutlet weak var otp3Field: HoshiTextField!
    @IBOutlet weak var otp4Field: HoshiTextField!
    
    
    @IBOutlet weak var otpFiled: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        verfyotpBtn.layer.cornerRadius = 25
        
        
        otp1Field.delegate = self
        otp2Field.delegate = self
        otp3Field.delegate = self
        otp4Field.delegate = self
        
        
        otp1Field.tag = 1
        otp2Field.tag = 2
        otp3Field.tag = 3
        otp4Field.tag = 4
        
        otpFiled.text = UserDefaults.standard.string(forKey:"otpreset")
        
    }
    

    
    @IBAction func backbtn(_ sender: Any) {
        
          self.dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func verifyOtpAction(_ sender: Any) {
        
        
        
        if (otp1Field.text?.isEmpty == true || otp2Field.text?.isEmpty == true || otp3Field.text?.isEmpty == true ||  otp4Field.text?.isEmpty == true){
                          
                presentAlert(withTitle: "Afric Ads", message: "Please Enter Above OTP")
                          
                }else{
        
        
        resetOtp()
        
        }
        
    }
    
    
    
    func resetOtp(){
                    
                              DispatchQueue.main.async{
                                  //self.hud.show(true)
                                   LoaderManager.shared.showLoader()
                              }
               
                             let baseUrl = ApiUrl.shared.baseUrl
                             let query = "verify-user-otp"
                             let finalUrl = "\(baseUrl)\(query)"
               
                              let targetURL = URL(string: "\(finalUrl)")
                              var request = URLRequest(url: targetURL!)
                              request.httpMethod = "POST"
                              request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                             // request.setValue("CODEX@123",forHTTPHeaderField: "x-api-key")
               
                         // var myValue = userEmailField!.text
                         // var myValue2 = userEmailField!.text

               
               let values = ["username":UserDefaults.standard.string(forKey:"emailresetPassword")!,"otpToken":UserDefaults.standard.string(forKey:"otpreset")!] as [String : Any]
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
                                                   
                                                       
                                                       
                                                       print("LogIn Res >> \(response)")
                                                      
                                                        
                                                        
                                                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "profileViewController") as! profileViewController
                                                                   
                                                                  // vc.reset = otp
                                                                  //vc.resetLanguageChange = otpReceiveLanguage
                                                                  self.present(vc, animated: true, completion: nil)
                                                      
                                                         
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


extension ChangePasswordOtpViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return textField.shouldChangeCustomOtp(textField: textField, string: string)

    }
}
