//
//  LogInViewController.swift
//  Afric Ads
//
//  Created by apple on 17/02/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import TextFieldEffects
import SkyFloatingLabelTextField
import Alamofire
import FacebookCore
import FacebookLogin
import GoogleSignIn
import iOSDropDown





class LogInViewController: UIViewController,UITextFieldDelegate,GIDSignInDelegate {
    
    
    
    var google = "google"
    var facebook = "facebook"
    var fcEmail: String!
    
    @IBOutlet weak var regLogInBtn: UIButton!
    @IBOutlet weak var signupRegBtn: UIButton!
    @IBOutlet weak var regsimplylbl: UILabel!
    
    var checkClick = true
    var recievedLanguage : String!
    var dataTask:URLSessionDataTask!
    
    @IBOutlet weak var popupRestrLBL: UILabel!
    @IBOutlet weak var userPopupBtn: UILabel!
    
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var logiBtn: UIButton!
    @IBOutlet weak var rememberLbl: UILabel!
    @IBOutlet weak var fogotBtn: UIButton!
    @IBOutlet weak var orsimplyConeectsLbl: UILabel!
    
    
    
    @IBOutlet weak var rmbrBtn: UIButton!
    
    
    
    var referenceCode = String()
    var verificationCode = Int()
    
    @IBOutlet weak var userEmailField: HoshiTextField!
    @IBOutlet weak var userPasswordField: HoshiTextField!
    
    
    @IBOutlet weak var popUpRegisterMainViw: UIView!
    @IBOutlet weak var optionViw: UIView!
    @IBOutlet weak var userBtn: UILabel!
    @IBOutlet weak var vendorBtn: UIButton!
    @IBOutlet weak var userN: UIButton!
    @IBOutlet weak var popVndr: UILabel!
    
    
    
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var nameField: HoshiTextField!
    @IBOutlet weak var mobileField: HoshiTextField!
    @IBOutlet weak var emailField: HoshiTextField!
    @IBOutlet weak var passwordField: HoshiTextField!
    @IBOutlet weak var conformPassword: HoshiTextField!
    @IBOutlet weak var selectCellularField: DropDown!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var loginViw: UIView!
    @IBOutlet weak var registerViw: UIView!
    
    
    var email:String!
    
    var status = 405
   // var error_code = 402
    //var
    
   // var nationalitypickerView = UIPickerView()
  //  var nationalityID = 0
   // var nationalityArray:NSMutableArray = [];
  //  var nationalityIDArray:NSMutableArray = [];
    
    
    
    
//    override func viewWillAppear(_ animated: Bool) {
//        self.navigationController?.isNavigationBarHidden = true
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
          GIDSignIn.sharedInstance()?.delegate = self
        
       // descriptions.font = UIFont.systemFont(ofSize: 22)

        
        
//        if recievedLanguage == "SELECT LANGUAGE / Xulo LUUQADAHA"
//        {
//           loginBtn.setTitle("LogIn".localized(withComment:"so"), for: .normal)
//           logiBtn.setTitle("LogIn".localized(withComment:"so"), for: .normal)
//           registerBtn.setTitle("REGISTER".localized(withComment:"so"), for: .normal)
//           rememberLbl.text = "Remember me".localized(withComment:"so")
//           fogotBtn.setTitle("Forgot Password?".localized(withComment:"so"), for: .normal)
//           orsimplyConeectsLbl.text = "or simply connects with".localized(withComment:"so")
//                          
//            regLogInBtn.setTitle("LogIn".localized(withComment:"so"), for: .normal)
//            signupRegBtn.setTitle("REGISTER".localized(withComment:"so"), for: .normal)
//            regsimplylbl.text = "or simply connects with".localized(withComment:"so")
//            nextBtn.setTitle("Next".localized(withComment:"so"), for: .normal)
//                      
//            
//            userEmailField.placeholder = "Mobile number/Email id"
//            userPasswordField.placeholder = "Password"
//            
//            nameField.placeholder = "Name"
//            mobileField.placeholder = "Mobile Number"
//            emailField.placeholder = "Email id"
//            passwordField.placeholder = "Password"
//            conformPassword.placeholder = "Confirm Password"
//            selectCellularField.placeholder = "Select Cellular Network"
//            
//
//                          
//            popupRestrLBL.text = "Register As".localized(withComment:"so")
//            userBtn.text = "User".localized(withComment:"so")
//            popVndr.text = "Vendor".localized(withComment:"so")
//                   
//        }
//        else
//        {
//            
//            loginBtn.setTitle("Soo gal".localized(withComment:"so"), for: .normal)
//            logiBtn.setTitle("Soo gal".localized(withComment:"so"), for: .normal)
//            registerBtn.setTitle("Diiwaangelinta".localized(withComment:"so"), for: .normal)
//            rememberLbl.text = "i xasuus".localized(withComment:"so")
//            fogotBtn.setTitle("hilmaamay furaha sirta ah?".localized(withComment:"so"), for: .normal)
//            orsimplyConeectsLbl.text = "ama si fudud nala xiriir".localized(withComment:"so")
//                              
//                              
//                              
//            regLogInBtn.setTitle("Soo gal".localized(withComment:"so"), for: .normal)
//            signupRegBtn.setTitle("Diiwaangelinta".localized(withComment:"so"), for: .normal)
//            regsimplylbl.text = "ama si fudud nala xiriir".localized(withComment:"so")
//            nextBtn.setTitle("Xiga".localized(withComment:"so"), for: .normal)
//                         
//            
//            userEmailField.placeholder = "Lambarka guuritaanka / I-maylka Ii-maylka"
//            userPasswordField.placeholder = "Furaha"
//            
//            
//            nameField.placeholder = "Magaca"
//            mobileField.placeholder = "Nambarka taleefonka"
//            emailField.placeholder = "Iimayl id"
//            passwordField.placeholder = "Furaha"
//            conformPassword.placeholder = "Xaqiiji erayga sirta ah"
//            selectCellularField.placeholder = "Xulo shabakada taleefanka gacanta"
//            
//            
//                              
//            popupRestrLBL.text = "Isku diiwaangeli sida".localized(withComment:"so")
//            userBtn.text = "Adeegsi".localized(withComment:"so")
//            popVndr.text = "Ganacsade".localized(withComment:"so")
//            
//            
//        }
//      
//       
        
        
        
        selectCellularField.optionArray = ["Airtel","Vodaphone ","Jio"]
        logiBtn.layer.cornerRadius = 25
        nextBtn.layer.cornerRadius = 25
        optionViw.layer.cornerRadius = 5
        optionViw.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        optionViw.layer.borderWidth = 1
        mobileField.delegate = self
       
        
    }
    
    
    
    @IBAction func bckBtnActn(_ sender: Any) {
        
        
        
        
    }
    
    
    
    
    
    @IBAction func popUpCloseAction(_ sender: Any) {
        
        popUpRegisterMainViw.alpha = 0
        
        
    }
    
  
    @IBAction func backBtnSignup(_ sender: Any) {
        
        mainView.alpha = 0
       // self.dismiss(animated: true, completion: nil)
        
        
    }
    
    
    
    @IBAction func googleLoginBtn(_ sender: Any) {
        
       
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()
      
        
    }
    
    
    
    
    
    @IBAction func faceBookLoginButton(_ sender: Any) {
        
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
    
    
    
    
    
    
    
    @IBAction func selectTypeMethod(sender : UIButton)
      {
          if(sender.tag == 0){
              userN.setImage(UIImage(named: "fill"), for: .normal)
              vendorBtn.setImage(UIImage(named: "empty"), for: .normal)
           // mainView.alpha = 1
             popUpRegisterMainViw.alpha = 0
             // userType = "supplier"
            
             self.performSegue(withIdentifier: "usersign", sender: nil)
            
           // let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "userRegistrationnViewController") as! userRegistrationnViewController
           // loginVC.recievedLanguageSignUPVendor = self.recievedLanguage; self.navigationController?.pushViewController(loginVC, animated: true)
          }
          if(sender.tag == 1){
              vendorBtn.setImage(UIImage(named: "fill"), for: .normal)
              userN.setImage(UIImage(named: "empty"), for: .normal)
            
           // let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "VendorSignUPViewController") as! VendorSignUPViewController
           // loginVC.recievedLanguageSignUPVendor = self.recievedLanguage; self.navigationController?.pushViewController(loginVC, animated: true)
            
           self.performSegue(withIdentifier: "venreg", sender: nil)
            
            
             // userType = "wholesaler"
          }
      }
    
    
    
    @IBAction func remberAction(_ sender: Any) {
        
        
        if(checkClick == true) {
                       rmbrBtn.setImage(#imageLiteral(resourceName: "checkbox72x"), for: .normal)
                      // passwordField.isSecureTextEntry = false
                       } else {
                       rmbrBtn.setImage(#imageLiteral(resourceName: "checked") ,for: .normal)
                       //passwordField.isSecureTextEntry = true
                       }
                   
                       checkClick = !checkClick
        
        
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
                email = user.profile.email
                  print(fullName!)
                  print(email!)
                //  userEmailField.text = email
                // nameField.text = fullName
                  googleLogin()
                
              //let userReferenceCode = jsonResponse["referenceCode"] as! String
               // let defaults = UserDefaults.standard.setValue(userReferenceCode, forKey: "referenceCode")
               
              }
              
          }
    
    
    
    @IBAction func signUpGoogleAction(_ sender: Any) {
        
        
      
        
    }
    
    
    
    
    @IBAction func signFacebookAction(_ sender: Any) {
        
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
            self.fcEmail = userData["email"] as? String
            let firstName = userData["first_name"] as? String
            let lastName = userData["last_name"] as? String
             let name = userData["name"] as? String
            var pictureUrl = ""
            if let picture = userData["picture"] as? NSDictionary, let data = picture["data"] as? NSDictionary, let url = data["url"] as? String {
                pictureUrl = url
                
                print(pictureUrl)
                print(self.fcEmail!)
                print(firstName!)
                print(lastName!)
                print(name!)
                
                
                self.facebookLogin()
               // self.nameField.text = name
            }
         })
         }
    
    
    
    
    
    

    @IBAction func logInAction(_ sender: Any) {
        

        
    }
    
    
    
    @IBAction func registerAction(_ sender: Any) {
        
        

        popUpRegisterMainViw.alpha = 1
    }
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func logAction(_ sender: Any) {
        
        
        if userEmailField.text == "" || userPasswordField.text == "" {
            
            presentAlert(withTitle: "Afric Ads", message: "Fill Required Fields")
 
        }else {
            
             loginMethod()
        }
        
    }
    
    
    
    
    @IBAction func Action(_ sender: Any) {
        
         mainView.alpha = 0
        
    }
    
    
    
    
    
    @IBAction func nextAction(_ sender: Any) {
        
        
    
        
        
    }
    
    
    
    @IBAction func forgotPasswordAction(_ sender: Any) {
        
       self.performSegue(withIdentifier: "forgot", sender: nil)
        
     //   let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as! ForgotPasswordViewController
     //   loginVC.receivedForgotLanguage = self.recievedLanguage; self.navigationController?.pushViewController(loginVC, animated: true)
        
        
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


                                  

                                      print("Sign up RES >>\(response)")

//                           if jsonResponse["message"] as! String == "The email has already Exist"{
//
//                              self.presentAlert(withTitle: "Afric Ads", message: "The mobile has already Exist")
//
//                           }
//                            if jsonResponse["message"] as! String == "The mobile has already Exist" {
//
//                             self.presentAlert(withTitle: "Afric Ads", message: "The email has already Exist")
//
//                           }
                                   
                        //     if jsonResponse["error_code"] as! Int == 405 {


                                 let vc = self.storyboard?.instantiateViewController(withIdentifier: "registerOtpViewController") as! registerOtpViewController
                                 vc.registeOtpLanguage = self.recievedLanguage
                                 vc.refr = self.referenceCode
                                 vc.verfr = self.verificationCode

                                 let userReferenceCode = jsonResponse["referenceCode"] as! String
                                 let defaults = UserDefaults.standard.setValue(userReferenceCode, forKey: "referenceCode")
                                 print(defaults)
                                 let userVerificationCode = jsonResponse["verificationCode"] as! Int
                                 let defaultes = UserDefaults.standard.setValue(userVerificationCode, forKey: "verificationCode")
                                  print(defaults)
                                  self.present(vc, animated: true, completion: nil)
                                
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
    
     func loginMethod(){
             
                       DispatchQueue.main.async{
                           //self.hud.show(true)
                            LoaderManager.shared.showLoader()
                       }
        
                      let baseUrl = ApiUrl.shared.baseUrl
                      let query = "login"
                      let finalUrl = "\(baseUrl)\(query)"
        
                       let targetURL = URL(string: "\(finalUrl)")
                       var request = URLRequest(url: targetURL!)
                       request.httpMethod = "POST"
                       request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                      // request.setValue("CODEX@123",forHTTPHeaderField: "x-api-key")
        
                  // var myValue = userEmailField!.text
                  // var myValue2 = userEmailField!.text

        
        let values = ["username":userEmailField.text!,"password":userPasswordField.text!] as [String : Any]
                       request.httpBody = try! JSONSerialization.data(withJSONObject: values, options: [])
                     
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
                                               if jsonResponse["message"] as! String == "Login Successfully!"{
                                                                
//                                                                let token = jsonResponse["token"] as! String
//                                                               print("------>\(token)")
//                                                                let defaults = UserDefaults.standard.setValue(token, forKey: "token")
                                                            

                                             let id = jsonResponse["token"] as? String ?? ""
                                             UserDefaults.standard.set(id, forKey: "userIdData")
                                             print("token>> \(id)")
                                                           //       self.performSegue(withIdentifier: "homePage", sender: nil)
                                                               // self.performSegue(withIdentifier: "home", sender: nil)
                                                                
                                             if(jsonResponse["type"] as! Int == 2) &&  (jsonResponse["businessProfile"] as! String == "No")
                                             {
                                                           
//                                              if (jsonResponse["businessProfile"] as! String == "NO"){
//                                                self.performSegue(withIdentifier:"buss", sender: nil)
//                                              }else{
//
                                             self.performSegue(withIdentifier:"business", sender: nil)
//                                                }
                                                                                             
                                             }else if (jsonResponse["type"] as! Int == 2) &&  (jsonResponse["businessProfile"] as! String == "Yes") {
                                                
                                                  self.performSegue(withIdentifier:"vendorHome", sender: nil)
                                                
                                             }
                                               else{
                                                                   
                                                self.performSegue(withIdentifier:"home", sender: nil)
                                               }
                                                                

                                                }
                                                 else{
                                               let alertController = UIAlertController(title: "Afric Ads", message:"Please Register first, your are not a User!", preferredStyle: .alert)
                                                let OKAction = UIAlertAction(title: "Ok", style: .default) { (action) in
                                                                 
                                                                    
                                                                       
                                               }
                                               alertController.addAction(OKAction)
                                               self.present(alertController, animated: true) { }
                                               }
                                                
                                                print("LogIn Res >> \(response)")
                                                if jsonResponse["message"] as! String == "Login Successfully!"{
                                                    
                                                    let details = jsonResponse["details"] as! [String:Any]
                                                     print("\(details)")
                                                    let emaill = details["email"]
                                                    let mobile = details["mobile"]
                                                    let name = details["name"]
                                                    let userReferenceCode = details["userReferenceCode"]
                                                   let defaults = UserDefaults.standard.setValue(emaill, forKey: "emailuser")
                                                   let defaultes = UserDefaults.standard.setValue(mobile, forKey: "mobileuser")
                                                   let defaultis1 = UserDefaults.standard.setValue(userReferenceCode, forKey: "userReferenceCode")
                                                  let defaultis = UserDefaults.standard.setValue(name, forKey: "nameuser")
                                                  print(emaill)
                                                  print(mobile)
                                                  print(name)
                                                    
                                                    
                                                    UserDefaults.standard.set( self.userEmailField.text!, forKey: "emailresetPassword") // saves text field text
                                                    UserDefaults.standard.synchronize()
                                                    UserDefaults.standard.set( self.userPasswordField.text!, forKey: "passwordlresetPassword") // saves text field text
                                                    UserDefaults.standard.synchronize()
                                                    
                                                    // let defaults1 = UserDefaults.standard.setValue(emaill, forKey: "userE")
                                                    
                                                 //   userEmailField.text! = defaults1
                                                    
                                                    
                                                    
                                                    
                                                }else{
                                                    
                                                    let alertController = UIAlertController(title: "Afric Ads", message:"Please Register first, your are not a User!", preferredStyle: .alert)
                                                                                                   let OKAction = UIAlertAction(title: "Ok", style: .default) { (action) in
                                                                                                                    
                                                                                                                       
                                                                                                                          
                                                                                                  }
                                                                                                  alertController.addAction(OKAction)
                                                                                                  self.present(alertController, animated: true) { }
                                                    
                                                    
                                                    
                                                    
                                                    
                                                }
                                               
                                                  
                                                
                                                
                                                print(" jsonn>>\(jsonResponse)")
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
    
    
    
    func googleLogin(){
        
        
       DispatchQueue.main.async{
                                   //self.hud.show(true)
        LoaderManager.shared.showLoader()
        
              }
        
        
         let baseUrl = ApiUrl.shared.baseUrl
         let query = "login"
         let finalUrl = "\(baseUrl)\(query)"
                
         let targetURL = URL(string: "\(finalUrl)")
         var request = URLRequest(url: targetURL!)
         request.httpMethod = "POST"
         request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                              // request.setValue("CODEX@123",forHTTPHeaderField: "x-api-key")
        let values = ["username":email!,"loginType":"\(google)"]
          print(values)
         request.httpBody = try! JSONSerialization.data(withJSONObject: values, options: [])
                             
         Alamofire.request(request as! URLRequestConvertible).responseJSON {
            
          response in
                do
                  {
                    
                       DispatchQueue.main.async{
                                       LoaderManager.shared.showLoader()
                                                            
                                    }

                          let jsonResponse = try JSONSerialization.jsonObject(with: response.data!, options: .mutableContainers) as! NSDictionary
                                                          
                            print(">>Google>\(jsonResponse)")
                                                        
                       
                                           
                    if jsonResponse["status"] as! Int == 100{
                        
                        self.performSegue(withIdentifier:"home", sender: nil)
                        
                    }else {
                        
                        let alertController = UIAlertController(title: "Afric Ads", message:"ToLogin First you Have To Register", preferredStyle: .alert)
                         let OKAction = UIAlertAction(title: "Ok", style: .default) { (action) in

                     }
                         alertController.addAction(OKAction)
                          self.present(alertController, animated: true) { }
                        
                        
                    }
                          
                                                          
               

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
    
    
    
    func facebookLogin(){
        
        
        

                       DispatchQueue.main.async{
                           //self.hud.show(true)
                            LoaderManager.shared.showLoader()
                       }
        
        
                    
                      let baseUrl = ApiUrl.shared.baseUrl
                      let query = "login"
                      let finalUrl = "\(baseUrl)\(query)"
        
                       let targetURL = URL(string: "\(finalUrl)")
                       var request = URLRequest(url: targetURL!)
                       request.httpMethod = "POST"
                       request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                      // request.setValue("CODEX@123",forHTTPHeaderField: "x-api-key")
        let values = ["username":fcEmail!, "loginType": "\(facebook)"]
        print(values)
                       request.httpBody = try! JSONSerialization.data(withJSONObject: values, options: [])
                     
                       Alamofire.request(request as! URLRequestConvertible).responseJSON {
                                             response in
                                             do
                                             {
                                                 DispatchQueue.main.async{
                                                     LoaderManager.shared.showLoader()
                                                    
                                                 }

                        let jsonResponse = try JSONSerialization.jsonObject(with: response.data!, options: .mutableContainers) as! NSDictionary
                                                             
                           print(">>>\(jsonResponse)")
                                                
                           // self.userEmailField.text = UserDefaults.standard.string(forKey:"facebbokemail")
                                                    
                         //  let details = jsonResponse["details"] as! [String:Any]
                          // let loginType = details["loginType"]
                                                                                                                                                         
                          
                                                                                                                                                       
                          if(jsonResponse["status"] as! Int == 100){
                                                                                              
                         self.performSegue(withIdentifier:"home", sender: nil)
                                                                                             
                         }else{
                                                                              
                                                                              
                          let alertController = UIAlertController(title: "Afric Ads", message:"ToLogin First you Have To Register", preferredStyle: .alert)
                          let OKAction = UIAlertAction(title: "Ok", style: .default) { (action) in
                                                                                                                                                                                                                              
                           }
                         alertController.addAction(OKAction)
                         self.present(alertController, animated: true) { }
                                                                                                                                                       
                        }
                                                    
                                                    
                                                    let alertController = UIAlertController(title: "Afric Ads", message:"ToLogin First you Register", preferredStyle: .alert)
                                                            let OKAction = UIAlertAction(title: "Ok", style: .default) { (action) in
                                                                                                                                                                                                                                                                                 
                                                                      }
                                                                alertController.addAction(OKAction)
                                                                self.present(alertController, animated: true) { }
                                                    
                                                    
                                                
                                                
                                              
                                             }   catch let error{
                                                
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
    
    
    func validate(email:String) -> Bool {
             
             let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
             let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
             return emailPredicate.evaluate(with: email)
             
         }
    
    
    
    
    
    
    @IBAction func rememberAction(_ sender: Any) {
        
        
        
        
        
        
        
    }
    

    
}



extension UIColor {
    static var themeMoreButton = UIColor.init(red: 231/255, green: 88/255, blue: 27/255, alpha: 1)
}


extension UIViewController {

func presentAlert(withTitle title: String, message : String) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let OKAction = UIAlertAction(title: "OK", style: .default) { action in
        print("You've pressed OK Button")
    }
    alertController.addAction(OKAction)
    self.present(alertController, animated: true, completion: nil)
}
}
