//
//  EditProfileViewController.swift
//  Afric Ads
//
//  Created by apple on 12/03/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import TextFieldEffects
import iOSDropDown
import Alamofire

class EditProfileViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate {

    
    
    var picker = UIImagePickerController()
    var chosenImage : UIImage!
    
    
    
    
    @IBOutlet weak var prfileImg: UIImageView!
    @IBOutlet weak var updatePrfile: UIButton!
    
    @IBOutlet weak var languageField: DropDown!
    @IBOutlet weak var fullnameField: HoshiTextField!
    @IBOutlet weak var mobileNameField: HoshiTextField!
    @IBOutlet weak var emailField: HoshiTextField!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        mobileNameField.delegate = self
        updatePrfile.layer.cornerRadius = 25
        prfileImg.layer.cornerRadius = prfileImg.frame.height/2
        prfileImg.clipsToBounds = true
        
        languageField.optionArray = ["English","Somalia","Arabic"]
        languageField.tintColor = UIColor.clear
        
        
        
        
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
             if let image = info[.editedImage] as? UIImage{
                 chosenImage = image
                 self.prfileImg.image = chosenImage
                
                
             }
             self.picker.dismiss(animated: false, completion: nil)
        
       
        
        
         }
         func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {
             
             let scale = newWidth / image.size.width
             let newHeight = image.size.height * scale
             UIGraphicsBeginImageContext(CGSize(width:newWidth, height:newHeight))
             image.draw(in: CGRect(x:0, y:0, width:newWidth, height:newHeight))
             let newImage = UIGraphicsGetImageFromCurrentImageContext()
             UIGraphicsEndImageContext()
             return newImage!
         }
    
    
    

   
    
    
    @IBAction func imgpickBtn(_ sender: Any) {
        
        let otherAlert = UIAlertController(title: "Africa Ads", message: "", preferredStyle: .actionSheet)
                let PhotoAction = UIAlertAction(title: "Photo Library", style: .default) { _ in
                    self.picker.allowsEditing = true
                    self.picker.delegate = self
                    self.picker.sourceType = .photoLibrary
                    self.present(self.picker,animated: true,completion: nil)
                }
                let cameraAction = UIAlertAction(title: "Camera", style: .default) { _ in
                    print("We can run a block of code." )
                    self.picker.allowsEditing = true
                    self.picker.delegate = self
                    self.picker.sourceType = UIImagePickerController.SourceType.camera
                    self.picker.cameraCaptureMode = .photo
                    self.picker.modalPresentationStyle = .fullScreen
                    self.present(self.picker,animated: true,completion: nil)
                }
                let dismiss = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                // relate actions to controllers
                otherAlert.addAction(PhotoAction)
                otherAlert.addAction(cameraAction)
                otherAlert.addAction(dismiss)
                self.present(otherAlert,animated: true,completion: nil)
        
        
    }
    
    
    @IBAction func backMethod(_ sender: Any) {
        
        
         self.dismiss(animated: true, completion: nil)
        
        
        
    }
    
    
    
    @IBAction func updateProfileAction(_ sender: Any) {
        
        
      if (languageField.text?.isEmpty == true || fullnameField.text?.isEmpty == true || mobileNameField.text?.isEmpty == true ||  emailField.text?.isEmpty == true){
        
        
         presentAlert(withTitle: "Afric Ads", message: "Please Enter Above Fields")
        
        
        }
        
       profileUpdate()
        
        
        
    }
    
    
    
    
    func profileUpdate(){
                    
                              DispatchQueue.main.async{
                                  //self.hud.show(true)
                                   LoaderManager.shared.showLoader()
                              }
               
                             let baseUrl = ApiUrl.shared.baseUrl
                             let query = "customer/mobile-update"
                             let finalUrl = "\(baseUrl)\(query)"
               
                              let targetURL = URL(string: "\(finalUrl)")
                              var request = URLRequest(url: targetURL!)
                              request.httpMethod = "POST"
                              request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                             // request.setValue("CODEX@123",forHTTPHeaderField: "x-api-key")
               
                         // var myValue = userEmailField!.text
                         // var myValue2 = userEmailField!.text

               
        let values = ["name":fullnameField.text!,"email":emailField.text!,"mobile":mobileNameField.text!,"referenceCode":UserDefaults.standard.string(forKey:"userReferenceCode")!,"token":UserDefaults.standard.string(forKey:"userIdData")!,"profilePicture":""] as [String : Any]
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
                                                     // if jsonResponse["message"] as! String == "Password Reset Successfully!"{
                                                                       
       //
                                                       
                                                       
                                                       print("update Res >> \(response)")
                                                      
                                                        
                                                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "profileViewController") as! profileViewController
                                                                                                                          
                                                      //  vc.image = self.chosenImage
                                                       // vc.namee = self.fullnameField.text!
                                                      //  vc.email = self.emailField.text!
                                                      //  vc.mobile = self.mobileNameField.text!
                                                        
                                                        UserDefaults.standard.set( self.fullnameField.text!, forKey: "nameuser") // saves text field text
                                                                                                               //UserDefaults.standard.synchronize()
                                                        UserDefaults.standard.set( self.emailField.text!, forKey: "emailuser") // saves text field text
                                                                                                              //UserDefaults.standard.synchronize()
                                                        UserDefaults.standard.set( self.mobileNameField.text!, forKey: "mobileuser") // saves text field text
                                                        
                                                        
                                                        //vc.resetLanguageChange = otpReceiveLanguage
                                                       self.present(vc, animated: true, completion: nil)
                                                        
                                                        
                                                        
                                                        
                                                        
                                                        
                                                       
                                                       // UserDefaults.standard.synchronize()
                                                        
                                                      
                                                         
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
       
    
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
         {
             if(textField == mobileNameField)
             {
                 let maxLength = 10
                 let currentString: NSString = mobileNameField.text! as NSString
                 let newString: NSString =
                     currentString.replacingCharacters(in: range, with: string) as NSString
                 return newString.length <= maxLength
             }
             
             return true;
         }
         
    
    
    
}
