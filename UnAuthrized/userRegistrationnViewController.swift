//
//  userRegistrationnViewController.swift
//  Afric Ads
//
//  Created by apple on 07/03/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import TextFieldEffects
import iOSDropDown
import Alamofire
import FacebookCore
import FacebookLogin
import GoogleSignIn

class userRegistrationnViewController: UIViewController,GIDSignInDelegate,UITextFieldDelegate {

    
    @IBOutlet weak var nameField: HoshiTextField!
    @IBOutlet weak var mobileField: HoshiTextField!
    @IBOutlet weak var emailField: HoshiTextField!
    @IBOutlet weak var passwordField: HoshiTextField!
    @IBOutlet weak var conformPassword: HoshiTextField!
    @IBOutlet weak var selectCellularField: DropDown!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var orsimplyConeectsLbl: UILabel!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var registrnBtn: UIButton!
    var recievedLanguageSignUPVendor:String!
   // var recievedLanguage : String!
    
    
     var referenceCode = String()
      var verificationCode = Int()
    var registeOtpLanguage:String!
    
    
    
    var a = String()
    var b = String()
    var c = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
         GIDSignIn.sharedInstance()?.delegate = self
        mobileField.delegate = self
        selectCellularField.tintColor = UIColor.clear

        
       
//        if recievedLanguageSignUPVendor == "SELECT LANGUAGE / Xulo LUUQADAHA"
//        {
//
//
//            nameField.placeholder = "Name"
//            mobileField.placeholder = "Mobile Number"
//            emailField.placeholder = "Email id"
//            passwordField.placeholder = "Password"
//            conformPassword.placeholder = "Confirm Password"
//            selectCellularField.placeholder = "Select Cellular Network"
//            loginBtn.setTitle("LogIn".localized(withComment:"so"), for: .normal)
//            registrnBtn.setTitle("REGISTER".localized(withComment:"so"), for: .normal)
//
//        }else{
//
//            nameField.placeholder = "Magaca"
//            mobileField.placeholder = "Nambarka taleefonka"
//            emailField.placeholder = "Iimayl id"
//            passwordField.placeholder = "Furaha"
//            conformPassword.placeholder = "Xaqiiji erayga sirta ah"
//            selectCellularField.placeholder = "Xulo shabakada taleefanka gacanta"
//            loginBtn.setTitle("Soo gal".localized(withComment:"so"), for: .normal)
//            registrnBtn.setTitle("Diiwaangelinta".localized(withComment:"so"), for: .normal)
//
//
//
//        }
        
        selectCellularField.optionArray = ["Airtel","Vodaphone ","Jio"]
       // logiBtn.layer.cornerRadius = 25
        nextBtn.layer.cornerRadius = 25
        
        
    }
    

    
    @IBAction func bckActn(_ sender: Any) {
        
        
         self.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    
    @IBAction func loginAction(_ sender: Any) {
        
   navigationController?.popViewController(animated: true)

    }
    
    
    
    
    
    @IBAction func nextAction(_ sender: UIButton) {
        

        
             if (nameField.text?.isEmpty == true && mobileField.text?.isEmpty == true && emailField.text?.isEmpty == true && passwordField.text?.isEmpty == true  && conformPassword.text?.isEmpty == true )
                   {
                      presentAlert(withTitle: "Afric Ads", message: "Fields cannot be empty")
                   }
                       if (nameField.text?.isEmpty == true || mobileField.text?.isEmpty == true || emailField.text?.isEmpty == true ||  passwordField.text?.isEmpty == true ||  conformPassword.text?.isEmpty == true)
                  {
                       presentAlert(withTitle: "Afric Ads", message: "please fill remaning fields")
                  }

                  if(mobileField.text!.count < 10)
                  {
                       presentAlert(withTitle: "Afric Ads", message: "please enter ten digit mobile number")
             }
             if  nameField.text!.count < 2 {

                  presentAlert(withTitle: "Afric Ads", message: "userName Should be minimum 6 Characters")


             }
             if  passwordField.text!.count < 6  {

                  presentAlert(withTitle: "Afric Ads", message: "Password Should be minimum 6 Characters")


             }
             if  conformPassword.text!.count < 6  {

                  presentAlert(withTitle: "Afric Ads", message: "ConfirmPassword Should be minimum 6 Characters")


             }
               if   validate(email: emailField.text!) == false  {

                     presentAlert(withTitle: "Afric Ads", message: "Enter Valid E-mail")

                  }

             if passwordField.text == conformPassword.text {

                if a == "Google" {
                                         
               googleSignUp()
                                         
                }else if b == "Facebook" {
                                         
             facebbokSignUp()
                                         
             }else {
                    
          userSignUpPOSt()
                                       
            }
                
               
                  }
             else{

                  presentAlert(withTitle: "Afric Ads", message: "Password & Confirm Password Mismatch")


             }
                 
    }
    
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
      {
          if(textField == mobileField)
          {
              let maxLength = 10
              let currentString: NSString = mobileField.text! as NSString
              let newString: NSString =
                  currentString.replacingCharacters(in: range, with: string) as NSString
              return newString.length <= maxLength
          }
          
          return true;
      }
      
    
    
    
    

    func userSignUpPOSt(){

               DispatchQueue.main.async{
                   //self.hud.show(true)
                    LoaderManager.shared.showLoader()
               }

            let parameters: Parameters = ["name":nameField.text ?? "re","email":emailField.text ?? "er","mobile":mobileField.text ?? "trt","password":passwordField.text ?? "rt","password_confirm": conformPassword.text ?? "56","cellularNetwork":"\(1)","type":"\(1)"]
            let baseUrl = ApiUrl.shared.baseUrl
                   let query = "customer/mobile-insert"
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

                                        //let jsonResponse = try JSONSerialization.jsonObject(with: response.data!, options: .mutableContainers) as! [String:Any]
                                         let jsonResponse = try JSONSerialization.jsonObject(with: response.data!, options: .mutableContainers) as! NSDictionary


                                      

                                          print("Sign up RES >>\(jsonResponse)")
                                        
                                        
                                       if (jsonResponse["error_code"] as? Int) == 402
                                         {
                                         self.presentAlert(withTitle: "Afric Ads", message: "The email has already Exist")
                                    }
                                else if (jsonResponse["error_code"] as? Int) == 403
                              {
                                 self.presentAlert(withTitle: "Afric Ads", message: "The mobile has already Exist")
                                }
                             else if jsonResponse["status"] as? Int == 405
                               {
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "registerOtpViewController") as! registerOtpViewController
                            vc.registeOtpLanguage = self.recievedLanguageSignUPVendor
                            vc.refr = self.referenceCode
                            vc.verfr = self.verificationCode
                            let userReferenceCode = jsonResponse["referenceCode"] as! String
                           let defaults = UserDefaults.standard.setValue(userReferenceCode, forKey: "verificationCode")
                            print(defaults)
                            let userVerificationCode = jsonResponse["verificationCode"] as! Int
                            let defaultes = UserDefaults.standard.setValue(userVerificationCode, forKey: "verificationCode")
                              print(defaults)
                           self.present(vc, animated: true, completion: nil)
                             }
                            else
                              {
                            let message = jsonResponse["message"] as? String ?? "Please check details."
                           self.presentAlert(withTitle: "Afric Ads", message: message)
                          }
                                        
                                        
                                        
////
//                               if jsonResponse["message"] as? String == "The email has already Exist"{
//
//                                  self.presentAlert(withTitle: "Afric Ads", message: "The email has already Exist")
//
//                               }
//                                if jsonResponse["message"] as? String == "The mobile has already Exist" {
//
//                                 self.presentAlert(withTitle: "Afric Ads", message: "The mobile has already Exist")
//
//                               }
//
//
////                              if jsonResponse["error_code"] as! Int == 402 &&  jsonResponse["error_code"] as! Int == 403{
////
////                               self.presentAlert(withTitle: "Afric Ads", message: "The mobile&E-mail has already Exist")
////
////                              }
//
//
//
//
//                                if jsonResponse["status"] as! Int == 405 {
//
//
//                                     let vc = self.storyboard?.instantiateViewController(withIdentifier: "registerOtpViewController") as! registerOtpViewController
//                                    vc.registeOtpLanguage = self.recievedLanguageSignUPVendor
//                                    vc.refr = self.referenceCode
//                                    vc.verfr = self.verificationCode
//
//                                    let userReferenceCode = jsonResponse["referenceCode"] as? String
//                                    let defaults = UserDefaults.standard.setValue(userReferenceCode, forKey: "referenceCode")
//                                    print(defaults)
//                                    let userVerificationCode = jsonResponse["verificationCode"] as? Int
//                                    let defaultes = UserDefaults.standard.setValue(userVerificationCode, forKey: "verificationCode")
//                                     print(defaults)
//                                    self.present(vc, animated: true, completion: nil)
//
//                                   }
                                        
                                        
                                        

                                           DispatchQueue.main.async{

                                          LoaderManager.shared.hideLoader()
                                        }


                                        //self.performSegue(withIdentifier: "rotp", sender: nil)
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
        
    
    
    
    
    
    
    func googleSignUp(){
        
        
         DispatchQueue.main.async{
                       //self.hud.show(true)
                        LoaderManager.shared.showLoader()
                   }


                let parameters: Parameters = ["name":nameField.text ?? "re","email":emailField.text ?? "er","mobile":mobileField.text ?? "trt","password":passwordField.text ?? "rt","password_confirm": conformPassword.text ?? "56","cellularNetwork":"\(1)","type":"\(2)"]


                      let baseUrl = ApiUrl.shared.baseUrl
                       let query = "customer/mobile-insert"
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

                                            //let jsonResponse = try JSONSerialization.jsonObject(with: response.data!, options: .mutableContainers) as! [String:Any]
                                             let jsonResponse = try JSONSerialization.jsonObject(with: response.data!, options: .mutableContainers) as! NSDictionary


                                          

                                              print("Sign up RES >>\(response)")

                                            
                                            //if jsonResponse["status"] as! Int == 405 {
                                            
                                   if (jsonResponse["error_code"] as? Int) == 402
                                    {
                                                                                      self.presentAlert(withTitle: "Afric Ads", message: "The email has already Exist")
                                                                                  }
                                                                                  else if (jsonResponse["error_code"] as? Int) == 403
                                                                                  {
                                                                                      self.presentAlert(withTitle: "Afric Ads", message: "The mobile has already Exist")
                                                                                  }
                                                                                  else if jsonResponse["status"] as? Int == 405
                                                                                  {
                                                                                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "registerOtpViewController") as! registerOtpViewController
                                                                                           vc.registeOtpLanguage = self.recievedLanguageSignUPVendor
                                                                                        vc.refr = self.referenceCode
                                                                                       vc.verfr = self.verificationCode
                                                                                             let userReferenceCode = jsonResponse["referenceCode"] as! String
                                                                                            let defaults = UserDefaults.standard.setValue(userReferenceCode, forKey: "referenceCode")
                                                                                             print(defaults)
                                                                                             let userVerificationCode = jsonResponse["verificationCode"] as! Int
                                                                                            let defaultes = UserDefaults.standard.setValue(userVerificationCode, forKey: "verificationCode")
                                                                                            print(defaults)
                                                                                            self.present(vc, animated: true, completion: nil)
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                      let message = jsonResponse["message"] as? String ?? "Please check details."
                                                                                      self.presentAlert(withTitle: "Afric Ads", message: message)
                                                                                  }
                                            
                                           // }else {
                                                
                                                
                                              //  self.presentAlert(withTitle: "Afric Ads", message: "problem")
                                                
                                                
                                           // }
                                          


                                               DispatchQueue.main.async{

                                              LoaderManager.shared.hideLoader()
                                            }


                                            //self.performSegue(withIdentifier: "rotp", sender: nil)
                                        // }
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
    
    
    @IBAction func googleSignUpAction(_ sender: Any) {
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()
        a = "Google"
        
    }
    
    
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if let error = error {
            
            print("\(error.localizedDescription)")
            
            
        }else{
            
            // Perform any operations on signed in user here.
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            var email = user.profile.email
            print(fullName!)
            print(email!)
            let defaults = UserDefaults.standard.setValue(email, forKey: "googleemail")
            emailField.text = email
            nameField.text = fullName
            print(" Google Email \(defaults)")
        //let userReferenceCode = jsonResponse["referenceCode"] as! String
         // let defaults = UserDefaults.standard.setValue(userReferenceCode, forKey: "referenceCode")
         
        }
        
    }
    
    
    
     
        func facebbokSignUp(){
            
            
             DispatchQueue.main.async{
                           //self.hud.show(true)
                            LoaderManager.shared.showLoader()
                       }


                    let parameters: Parameters = ["name":nameField.text ?? "re","email":emailField.text ?? "er","mobile":mobileField.text ?? "trt","password":passwordField.text ?? "rt","password_confirm": conformPassword.text ?? "56","cellularNetwork":"\(1)","type":"\(3)"]


                          let baseUrl = ApiUrl.shared.baseUrl
                           let query = "customer/mobile-insert"
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

                                                //let jsonResponse = try JSONSerialization.jsonObject(with: response.data!, options: .mutableContainers) as! [String:Any]
                                                 let jsonResponse = try JSONSerialization.jsonObject(with: response.data!, options: .mutableContainers) as! NSDictionary


                                              

                                                  print("Sign up RES >>\(jsonResponse)")



                                                if (jsonResponse["error_code"] as? Int) == 402
                                                {
                                                    self.presentAlert(withTitle: "Afric Ads", message: "The email has already Exist")
                                                }
                                                else if (jsonResponse["error_code"] as? Int) == 403
                                                {
                                                    self.presentAlert(withTitle: "Afric Ads", message: "The mobile has already Exist")
                                                }
                                                else if jsonResponse["status"] as? Int == 405
                                                {
                                                      let vc = self.storyboard?.instantiateViewController(withIdentifier: "registerOtpViewController") as! registerOtpViewController
                                                         vc.registeOtpLanguage = self.recievedLanguageSignUPVendor
                                                      vc.refr = self.referenceCode
                                                     vc.verfr = self.verificationCode
                                                           let userReferenceCode = jsonResponse["referenceCode"] as! String
                                                          let defaults = UserDefaults.standard.setValue(userReferenceCode, forKey: "referenceCode")
                                                           print(defaults)
                                                           let userVerificationCode = jsonResponse["verificationCode"] as! Int
                                                          let defaultes = UserDefaults.standard.setValue(userVerificationCode, forKey: "verificationCode")
                                                          print(defaults)
                                                          self.present(vc, animated: true, completion: nil)
                                                }
                                                else
                                                {
                                                    let message = jsonResponse["message"] as? String ?? "Please check details."
                                                    self.presentAlert(withTitle: "Afric Ads", message: message)
                                                }
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                

                                          
                                            
                                             //  }
                                                
                                                   DispatchQueue.main.async{

                                                  LoaderManager.shared.hideLoader()
                                                }


                                                //self.performSegue(withIdentifier: "rotp", sender: nil)
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
    
    
    
    
    
    
    
    
    
    
    @IBAction func faceBookAction(_ sender: Any) {
        
        b = "Facebook"
        let manager = LoginManager()
                          manager.logOut()
                          manager.logIn(permissions: [.publicProfile, .email], viewController:self) {(result) in
                              
                              switch result {
                                  
                              case .cancelled:
                                  
                                  print("User Cancelled Login Process")
                                  
                                break
                                  
                              case .failed(let error) :
                                  print("login Failed")
                                  break
                                  
                              case .success (let grantedPermissions, let declinedPermissions ,let accessToken):
                                  
                                  print("\(accessToken)")
                                  self.fetchProfile()
                                  
                              }
                              
                              
                          }
        
        
        
    }
    
    
    
    func fetchProfile() {
          let parameters = ["fields": "name,first_name, email, last_name, picture,id"]
       //let parameters = ["fields": "id,name,first_name,last_name,email,link,gender,birthday,location"]
           GraphRequest(graphPath: "me", parameters: parameters).start(completionHandler: { (connection, user, requestError) -> Void in

               if requestError != nil {
                   print("----------ERROR-----------")
                   print(requestError)
                   return
               }
               let userData = user as! NSDictionary
               let email = userData["email"] as? String
               let firstName = userData["first_name"] as? String
               let lastName = userData["last_name"] as? String
               let name = userData["name"] as? String
              // let defaults = UserDefaults.standard.setValue(name, forKey: "facebbok")
               var pictureUrl = ""
               if let picture = userData["picture"] as? NSDictionary, let data = picture["data"] as? NSDictionary, let url = data["url"] as? String {
                   pictureUrl = url
                   print(pictureUrl)
                  print(email!)
                    print(firstName!)
                    print(lastName!)
                    print(name!)
                  //let defaults = UserDefaults.standard.setValue(email, forKey: "googleemail")
                self.nameField.text = name
                self.emailField.text = email
                let defaults = UserDefaults.standard.setValue(email, forKey: "facebbokemail")
                
                
//                let alertController = UIAlertController(title: "Afric Ads", message:"Enter Email Manually", preferredStyle: .alert)
//                 let OKAction = UIAlertAction(title: "Ok", style: .default) { (action) in
//
//
//
//                }
//                alertController.addAction(OKAction)
//                self.present(alertController, animated: true) { }
                
                
                
               }
            })
            }
    
    
    
    
    
    func validate(email:String) -> Bool {
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: email)
        
    }
    
    
  

}
