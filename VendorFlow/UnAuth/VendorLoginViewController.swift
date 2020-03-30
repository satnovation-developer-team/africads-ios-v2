//
//  VendorLoginViewController.swift
//  Afric Ads
//
//  Created by apple on 20/02/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import TextFieldEffects
import Alamofire

class VendorLoginViewController: UIViewController {

    
    @IBOutlet weak var logInVw: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var signBtn: UIButton!
    
    @IBOutlet weak var logInTF: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        signBtn.layer.cornerRadius = 5
       // logInTF.setBottomBorder()
       //  passwordTf.setBottomBorder()
        
    }
    

    @IBAction func forgotPasswordAction(_ sender: Any) {
        
        
        self.performSegue(withIdentifier: "forgt", sender: nil)
        
        
    }
    
    
    
    
    @IBAction func signUpaction(_ sender: Any) {
        
        
        self.performSegue(withIdentifier: "signup", sender: nil)
        
    }
    
    
    
    
    @IBAction func loginAction(_ sender: Any) {
        
        
        
        vendorLoginMethod()
        
        
    }
    
    
    
    
    
    
    
     func vendorLoginMethod(){
                 
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
                           let values = ["username": logInTF.text!, "password": passwordTf.text!]
                           request.httpBody = try! JSONSerialization.data(withJSONObject: values, options: [])
                         
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
                                                                
                                                                    print("VenLogin\(response)")

                                                                   let id = jsonResponse["token"] as? String ?? ""
                                                                      UserDefaults.standard.set("userid", forKey: "userIdData")
                                                                    print(id)
                                                               //       self.performSegue(withIdentifier: "homePage", sender: nil)
                                                                    self.performSegue(withIdentifier: "vHome", sender: nil)

                                                                   }
                                                                   else{
                                                                       let alertController = UIAlertController(title: "Afric Ads", message:"Wrong Credentials", preferredStyle: .alert)
                                                                       let OKAction = UIAlertAction(title: "Ok", style: .default) { (action) in
                                                                     
                                                                        
                                                                           
                                                                       }
                                                                       alertController.addAction(OKAction)
                                                                       self.present(alertController, animated: true) { }
                                                                   }
                                                    
                                                    print("LogIn Res >> \(response)")
                                                      
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




//bottom line for textfield
extension UITextField {
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}
