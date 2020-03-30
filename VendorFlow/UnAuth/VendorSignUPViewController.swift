//
//  VendorSignUPViewController.swift
//  Afric Ads
//
//  Created by apple on 20/02/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import TextFieldEffects
import SkyFloatingLabelTextField
import Alamofire
import iOSDropDown
import FacebookCore
import FacebookLogin
import GoogleSignIn


class VendorSignUPViewController: UIViewController,UITextFieldDelegate,GIDSignInDelegate {
    
    
    
    
    
    @IBOutlet weak var registerLbl: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var cellNetwrkViw: UIView!
    
    @IBOutlet weak var nameField: HoshiTextField!
    @IBOutlet weak var emailID: HoshiTextField!
    @IBOutlet weak var selectCellularField: DropDown!
    @IBOutlet weak var mobileNumberField: HoshiTextField!
    @IBOutlet weak var passwordField: HoshiTextField!
    
    
    var referenceCode:String!
    var verificationCode = Int()
    
    var a = String()
    var b = String()
    var c = String()
    var email:String!
    var fcEmail: String!
    var google = "google"
    var facebook = "facebook"
    
    
    //    var nationalitypickerView = UIPickerView()
    //    var nationalityID = 0
    
    
    
    
    //    var nationalityArray:NSMutableArray = [];
    //    var nationalityIDArray:NSMutableArray = [];
    
    var recievedLanguageSignUPVendor : String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //  getCellularNetwork()
        // showOccupation()
        GIDSignIn.sharedInstance()?.delegate = self
        // mobileField.delegate = self
        selectCellularField.tintColor = UIColor.clear
        
        
        //              if recievedLanguageSignUPVendor == "SELECT LANGUAGE / Xulo LUUQADAHA"
        //              {
        //
        //                 nextBtn.setTitle("Next".localized(withComment:"so"), for: .normal)
        //                 registerLbl.text = "REGISTER".localized(withComment:"so")
        //
        //                nameField.placeholder = "Name"
        //                emailID.placeholder = "E-mail id"
        //                selectCellularField.placeholder = "Select Cellular Network"
        //                 mobileNumberField.placeholder = "Mobile Number"
        //                 passwordField.placeholder = "Password"
        //
        //
        //              }else{
        //
        //
        //                nextBtn.setTitle("Xiga".localized(withComment:"so"), for: .normal)
        //                registerLbl.text = "Diiwaangelinta".localized(withComment:"so")
        //
        //
        //                nameField.placeholder = "Magaca"
        //                emailID.placeholder = "Iimayl id"
        //                selectCellularField.placeholder = "Xulo shabakada taleefanka gacanta"
        //                mobileNumberField.placeholder = "Nambarka taleefonka"
        //                passwordField.placeholder = "Furaha"
        //
        //        }
        //
        
        
        
        //  nextBtn.setTitle("Next".localized(withComment:"so"), for: .normal)
        //registerLbl.text = "REGISTER".localized(withComment:"so")
        
        selectCellularField.optionArray = ["Airtel","Vodaphone ","Jio"]
        nextBtn.layer.cornerRadius = 5
        // selectCellularField.inputView = nationalitypickerView
        selectCellularField.delegate = self
        
        mobileNumberField.delegate = self
        selectCellularField.layer.backgroundColor = UIColor.white.cgColor
        selectCellularField.layer.borderColor = UIColor.lightGray.cgColor
        selectCellularField.layer.borderWidth = 0
        selectCellularField.layer.cornerRadius = 1
        selectCellularField.layer.masksToBounds = false
        selectCellularField.layer.shadowRadius = 0
        //selectCellularField.layer.shadowColor = UIColor.blackColor().CGColor
        // selectCellularField.layer.shadowOffset = CGSizeMake(1.0, 1.0)
        selectCellularField.layer.shadowOpacity = 0
        selectCellularField.layer.shadowRadius = 0
        
        //        var bottomLine = CALayer()
        //        bottomLine.frame = CGRect(x: 0.0, y: selectCellularField.frame.height - 1, width: selectCellularField.frame.width, height: 1.0)
        //        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        //        selectCellularField.borderStyle = UITextField.BorderStyle.none
        //        selectCellularField.layer.addSublayer(bottomLine)
        
        selectCellularField.seetBottomBorder()
        
        
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        if(textField == mobileNumberField)
        {
            let maxLength = 10
            let currentString: NSString = mobileNumberField.text! as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        }
        
        return true;
    }
    
    
    
    
    
    //    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    //
    //
    //           return 1
    //       }
    //       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    //
    //
    //           nationalityArray.count
    //       }
    //       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    //
    //          let array = nationalityArray[row] as! NSMutableDictionary
    //                     return (array["name"] as! String)
    //       }
    //       func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    //
    //           selectCellularField.tag = row
    //
    //
    //       }
    
    
    //
    //     func showOccupation(){
    //                  let toolbar = UIToolbar();
    //                  toolbar.sizeToFit()
    //                  let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker))
    //                  let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
    //                  let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneOccupationPicker))
    //                  toolbar.setItems([cancelButton,spaceButton,doneButton], animated: false)
    //                  // add toolbar to textField
    //                  selectCellularField.inputAccessoryView = toolbar
    //                  selectCellularField.inputView = nationalitypickerView
    //              }
    //              @objc func doneOccupationPicker()
    //              {
    //                  let array = nationalityArray[selectCellularField.tag] as! NSMutableDictionary
    //                  selectCellularField.text = (array["name"] as! String)
    //                  nationalityID = (array["id"] as! Int)
    //                  self.view.endEditing(true)
    //              }
    //
    //        @objc func cancelDatePicker()
    //                {
    //                    self.view.endEditing(true)
    //                }
    
    
    
    
    @IBAction func backButton(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
        
        //  self.navigationController?.popViewController(animated: true)
        
        
    }
    
    
    
    func postAlomafire(){
        
        
        DispatchQueue.main.async{
            //self.hud.show(true)
            LoaderManager.shared.showLoader()
        }
        
        
        let parameters: Parameters = [ "name" : nameField.text!, "email" : emailID.text!,"mobile" : mobileNumberField.text!,"password" : passwordField.text!,"cellularNetwork":1,"type":1]
        
        
        let baseUrl = ApiUrl.shared.baseUrl
        let query = "vendor/mobile-insert"
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
                
                let jsonResponse = try JSONSerialization.jsonObject(with: response.data!, options: .mutableContainers) as! [String:Any]
                
                
                
               if (jsonResponse["error_code"] as? Int) == 302
                              {
               self.presentAlert(withTitle: "Afric Ads", message: "The email has already Exist")
                              }
                else if (jsonResponse["error_code"] as? Int) == 303
                              {
                self.presentAlert(withTitle: "Afric Ads", message: "The mobile has already Exist")
                              }
                              else if jsonResponse["status"] as? Int == 304
                              {
                                
                                
                               
                                                                      
                                                                      
                          let vc = self.storyboard?.instantiateViewController(withIdentifier: "VendorOTPViewController") as! VendorOTPViewController
                                                                      //vc.vendorotpLanguageChange = self.recievedLanguageSignUPVendor
                          let referenceCode = jsonResponse["referenceCode"] as! String
                          let defaults = UserDefaults.standard.setValue(referenceCode, forKey: "referenceCode")
                          let verificationCode = jsonResponse["verificationCode"] as! Int
                         let defaultes = UserDefaults.standard.setValue(verificationCode, forKey: "verificationCode")
                                
                            vc.refr = self.referenceCode
                            vc.verfr = verificationCode
                            self.present(vc, animated: true, completion: nil)
                                
                                
                                
                                
                                
                                
                                
                                
                                
//
//                                  let vc = self.storyboard?.instantiateViewController(withIdentifier: "registerOtpViewController") as! registerOtpViewController
//                                  vc.registeOtpLanguage = self.recievedLanguageSignUPVendor
//                                  vc.refr = self.referenceCode
//                                  vc.verfr = self.verificationCode
//
//                                  let userReferenceCode = jsonResponse["referenceCode"] as! String
//                                  let defaults = UserDefaults.standard.setValue(userReferenceCode, forKey: "referenceCode")
//                                  print(defaults)
//                                  let userVerificationCode = jsonResponse["verificationCode"] as! Int
//                                  let defaultes = UserDefaults.standard.setValue(userVerificationCode, forKey: "verificationCode")
//                                  print(defaults)
//                                  self.present(vc, animated: true, completion: nil)
                              }
                              else
                              {
                                  let message = jsonResponse["message"] as? String ?? "Please check details."
                                  self.presentAlert(withTitle: "Afric Ads", message: message)
                              }
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                print("REF>>\(self.referenceCode)")
                print("VER>>\(self.verificationCode)")
                
                print("VendorRegistration >>\(response)")
                // self.performSegue(withIdentifier: "sign", sender: nil)
            }
            catch let error{
                print(error)
            }
            DispatchQueue.main.async{
                
                LoaderManager.shared.hideLoader()
            }
        }
        
    }
    
    
    
    //    func getCellularNetwork()
    //               {
    //
    //
    //
    //                let baseUrl = ApiUrl.shared.baseUrl
    //                let query = "cellular-network"
    //                let finalUrl = "\(baseUrl)\(query)"
    //
    //
    //                var todoEndpoint: String =  NSString(format:"\(finalUrl)" as NSString)as String
    //                   todoEndpoint = todoEndpoint.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
    //                   let requestURL : NSURL = NSURL(string: todoEndpoint)!
    //                   let session = URLSession.shared
    //                   let urlRequest: NSMutableURLRequest = NSMutableURLRequest(url: requestURL as URL)
    //                   let task = session.dataTask(with: urlRequest as URLRequest) { (data, response, error) -> Void in
    //                       if(data != nil)
    //                       {
    //                           let httpResponse = response as! HTTPURLResponse
    //                           let statusCode = httpResponse.statusCode
    //                           if(statusCode == 200)
    //                           {
    //                               do
    //                               {
    //                                   let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! NSDictionary
    //                                   print(jsonResponse)
    //
    //                                       self.nationalityArray = jsonResponse["cellularList"] as! NSMutableArray
    //                                       DispatchQueue.main.async
    //                                           {
    //                                               self.nationalitypickerView.dataSource = self
    //                                               self.nationalitypickerView.delegate = self
    //                                           }
    //
    //
    //                               }
    //                               catch let error
    //                               {
    //                                   print(error)
    //                               }
    //                           }
    //                       }
    //                   }
    //                   task.resume()
    //               }
    //
    
    
    
    
    
    
    
    @IBAction func vendorSignUPAction(_ sender: Any) {
        
        
        if nameField.text == "" && emailID.text == "" && selectCellularField.text == "" && mobileNumberField.text == "" && passwordField.text == ""    {
            
            presentAlert(withTitle: "Afric Ads", message: "Fields cannote be empty")
            
        }else if  nameField.text == "" || emailID.text == "" || selectCellularField.text == "" || mobileNumberField.text == "" || passwordField.text == ""   {
            
            presentAlert(withTitle: "Afric Ads", message: "Fill Required Fieldsy")
            
            
            
            
        } else if   validate(email: emailID.text!) == false  {
            
            presentAlert(withTitle: "Afric Ads", message: "Enter Valid E-mail")
            
        }else {
            
            
            if a == "Google" {
                
                googleSignUp()
                
            }else if b == "Facebook" {
                
                facebbokSignUp()
                
            }else {
                
                postAlomafire()
                
            }
            
            
            
        }
        
        
    }
    
    
    
    
    
    
    func validate(email:String) -> Bool {
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: email)
        
    }
    
    
    
    
    
    
    @IBAction func vendorgoogleAction(_ sender: Any) {
        
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
            let email = user.profile.email
            print(fullName!)
            print(email!)
            let defaults = UserDefaults.standard.setValue(email, forKey: "googleemail")
            emailID.text = email
            nameField.text = fullName
            //let userReferenceCode = jsonResponse["referenceCode"] as! String
            // let defaults = UserDefaults.standard.setValue(userReferenceCode, forKey: "referenceCode")
            
        }
        
    }
    
    
    
    
    func googleSignUp(){
        
        
        DispatchQueue.main.async{
            //self.hud.show(true)
            LoaderManager.shared.showLoader()
        }
        
        
        
        
        
        
        
        let parameters: Parameters = ["name":nameField.text ?? "re","email":emailID.text ?? "er","mobile":mobileNumberField.text ?? "trt","password":passwordField.text ?? "rt","cellularNetwork":"\(1)","type":"\(2)"]
        
        
        let baseUrl = ApiUrl.shared.baseUrl
        let query = "vendor/mobile-insert"
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
                
                if (jsonResponse["error_code"] as? Int) == 302
                              {
                                  self.presentAlert(withTitle: "Afric Ads", message: "The email has already Exist")
                              }
                              else if (jsonResponse["error_code"] as? Int) == 303
                              {
                                  self.presentAlert(withTitle: "Afric Ads", message: "The mobile has already Exist")
                              }
                              else if jsonResponse["status"] as? Int == 304
                              {
                                 let vc = self.storyboard?.instantiateViewController(withIdentifier: "VendorOTPViewController") as! VendorOTPViewController
                                                                               //vc.vendorotpLanguageChange = self.recievedLanguageSignUPVendor
                                   let referenceCode = jsonResponse["referenceCode"] as! String
                                   let defaults = UserDefaults.standard.setValue(referenceCode, forKey: "referenceCode")
                                   let verificationCode = jsonResponse["verificationCode"] as! Int
                                  let defaultes = UserDefaults.standard.setValue(verificationCode, forKey: "verificationCode")
                                         
                                     vc.refr = self.referenceCode
                                     vc.verfr = verificationCode
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
    
    
    
    
    
    
    
    @IBAction func vendorFaceBookAction(_ sender: Any) {
        
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
                self.emailID.text = email
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
    
    
    
    func facebbokSignUp(){
        
        
        DispatchQueue.main.async{
            //self.hud.show(true)
            LoaderManager.shared.showLoader()
        }
        
        
        let parameters: Parameters = ["name":nameField.text ?? "re","email":emailID.text ?? "er","mobile":mobileNumberField.text ?? "trt","password":passwordField.text ?? "rt","cellularNetwork":"\(1)","type":"\(3)"]
        
        
        let baseUrl = ApiUrl.shared.baseUrl
        let query = "vendor/mobile-insert"
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
                
                if (jsonResponse["error_code"] as? Int) == 302
                {
                    self.presentAlert(withTitle: "Afric Ads", message: "The email has already Exist")
                }
                else if (jsonResponse["error_code"] as? Int) == 303
                {
                    self.presentAlert(withTitle: "Afric Ads", message: "The mobile has already Exist")
                }
                else if jsonResponse["status"] as? Int == 304
                {
                   let vc = self.storyboard?.instantiateViewController(withIdentifier: "VendorOTPViewController") as! VendorOTPViewController
                                                                 //vc.vendorotpLanguageChange = self.recievedLanguageSignUPVendor
                     let referenceCode = jsonResponse["referenceCode"] as! String
                     let defaults = UserDefaults.standard.setValue(referenceCode, forKey: "referenceCode")
                     let verificationCode = jsonResponse["verificationCode"] as! Int
                    let defaultes = UserDefaults.standard.setValue(verificationCode, forKey: "verificationCode")
                           
                       vc.refr = self.referenceCode
                       vc.verfr = verificationCode
                       self.present(vc, animated: true, completion: nil)
                }
                else
                {
                    let message = jsonResponse["message"] as? String ?? "Please check details."
                    self.presentAlert(withTitle: "Afric Ads", message: message)
                }
                
//                if jsonResponse["message"] as! String == "The email has already Exist"{
//
//                    self.presentAlert(withTitle: "Afric Ads", message: "The email has already Exist")
//
//                }
//                else if jsonResponse["message"] as! String == "The mobile has already Exist" {
//
//                    self.presentAlert(withTitle: "Afric Ads", message: "The mobile has already Exist")
//
//                }
//                else if (jsonResponse["status"] as? Int) == 305
//                {
//                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "registerOtpViewController") as! registerOtpViewController
//                    vc.registeOtpLanguage = self.recievedLanguageSignUPVendor
//                    vc.refr = self.referenceCode
//                    vc.verfr = self.verificationCode
//
//                    let userReferenceCode = jsonResponse["referenceCode"] as! String
//                    let defaults = UserDefaults.standard.setValue(userReferenceCode, forKey: "referenceCode")
//                    print(defaults)
//                    let userVerificationCode = jsonResponse["verificationCode"] as! Int
//                    let defaultes = UserDefaults.standard.setValue(userVerificationCode, forKey: "verificationCode")
//                    print(defaults)
//                    self.present(vc, animated: true, completion: nil)
//                }
                
//                if jsonResponse["status"] as! Int == 305 {
//
//
//                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "registerOtpViewController") as! registerOtpViewController
//                    vc.registeOtpLanguage = self.recievedLanguageSignUPVendor
//                    vc.refr = self.referenceCode
//                    vc.verfr = self.verificationCode
//
//                    let userReferenceCode = jsonResponse["referenceCode"] as! String
//                    let defaults = UserDefaults.standard.setValue(userReferenceCode, forKey: "referenceCode")
//                    print(defaults)
//                    let userVerificationCode = jsonResponse["verificationCode"] as! Int
//                    let defaultes = UserDefaults.standard.setValue(userVerificationCode, forKey: "verificationCode")
//                    print(defaults)
//                    self.present(vc, animated: true, completion: nil)

//                }
                
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
    
    
    
    
    
}
extension UITextField {
    func seetBottomBorder() {
        self.borderStyle = .none
        // self.layer.backgroundColor = UIColor.white.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}
