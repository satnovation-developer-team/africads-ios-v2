//
//  VendorBusinessViewController.swift
//  Afric Ads
//
//  Created by apple on 20/02/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import TextFieldEffects
import Alamofire
import MobileCoreServices



class VendorBusinessViewController: UIViewController,UITextFieldDelegate,UIDocumentMenuDelegate,UIDocumentPickerDelegate,UINavigationControllerDelegate {

    
    @IBOutlet weak var uploadViw: UIView!
    @IBOutlet weak var uploadviw: UIView!
    @IBOutlet weak var submitBtn: UIButton!
    
    @IBOutlet weak var businessPopMainViw: UIView!
    @IBOutlet weak var businessPopviwww: UIView!
    @IBOutlet weak var adminReviwlabl: UILabel!
    
    @IBOutlet weak var businessField: HoshiTextField!
    @IBOutlet weak var managerField: HoshiTextField!
    @IBOutlet weak var addressFiedl: HoshiTextField!
    @IBOutlet weak var cellPhoneField: HoshiTextField!
    @IBOutlet weak var landLineField: HoshiTextField!
    @IBOutlet weak var emailIdFiedl: HoshiTextField!
    @IBOutlet weak var govtTaxField: HoshiTextField!
    @IBOutlet weak var officialRegistrationField: HoshiTextField!
   
    
    
    
    @IBOutlet weak var choosefilelbl: UIButton!
    @IBOutlet weak var fileTf: HoshiTextField!
    @IBOutlet weak var uploadlblTxt: UILabel!
    
    @IBOutlet weak var cellphone2Field: HoshiTextField!
    @IBOutlet weak var cell2HeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var cellStarlbl: UILabel!
    @IBOutlet weak var cell2Btn: UIButton!
    @IBOutlet weak var vwii1HeightConstraint: NSLayoutConstraint!
    
    
    
    @IBOutlet weak var landLineHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var land2TF: HoshiTextField!
    @IBOutlet weak var land2Star: UILabel!
    @IBOutlet weak var land2minus: UIButton!
    
    
    
    @IBOutlet weak var popupLoginAftrApprovalField: UILabel!
    @IBOutlet weak var popupnotificationField: UILabel!
    @IBOutlet weak var popupUnableField: UILabel!
    @IBOutlet weak var popupContactField: UIButton!
    
    
    
    
    
    @IBOutlet weak var businessStar: UILabel!
    @IBOutlet weak var managerStar: UILabel!
    @IBOutlet weak var addressstar: UILabel!
    @IBOutlet weak var phoneStar: UILabel!
    @IBOutlet weak var landnmberStar: UILabel!
    @IBOutlet weak var emailStar: UILabel!
    @IBOutlet weak var govtStar: UILabel!
    @IBOutlet weak var registartionStar: UILabel!
    
    
    
    var businsslanguageChnge:String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
//        if businsslanguageChnge == "SELECT LANGUAGE / Xulo LUUQADAHA"
//               {
//                
//                
//              
//                
//                
//                 navigationController?.navigationBar.topItem?.title = "Business Profile"
//               // self.title = "Business Profile"
//                submitBtn.setTitle("Submit".localized(withComment:"so"), for: .normal)
//                businessField.placeholder = "Business Name"
//                managerField.placeholder = "Manager/Owner Name"
//                addressFiedl.placeholder = "Address"
//                cellPhoneField.placeholder = "Cell Phone Number"
//                landLineField.placeholder = "Land Line Number"
//                emailIdFiedl.placeholder = "E-mail id"
//                govtTaxField.placeholder = "Govt. Tax Number"
//                officialRegistrationField.placeholder = "Offical Registration Number"
//                fileTf.placeholder = "File"
//                choosefilelbl.setTitle("Choose File".localized(withComment:"so"), for: .normal)
//                uploadlblTxt.text = "Upload photo/PDF Docx".localized(withComment:"so")
//                
//                
//
//                popupLoginAftrApprovalField.text = "You can Login after Approval".localized(withComment:"so")
//                popupnotificationField.text = "A notification will be sent via e-mail/Text message upon your profile acceptance or rejection".localized(withComment:"so")
//                popupUnableField.text = "if unable to login please".localized(withComment:"so")
//                popupContactField.setTitle("Contact US".localized(withComment:"so"), for: .normal)
//        
//        }else{
//            
//            
//            
//            submitBtn.setTitle("Gudbi".localized(withComment:"so"), for: .normal)
//           // self.title = "Astaanta Ganacsiga"
//            navigationController?.navigationBar.topItem?.title = "Astaanta Ganacsiga"
//            businessField.placeholder = "magaca ganacsiga"
//            managerField.placeholder = "Magaca Maamulaha / Mulkiilaha"
//            addressFiedl.placeholder = "Cinwaanka"
//            cellPhoneField.placeholder = "Lambarka Taleefanka Gacanta"
//            landLineField.placeholder = "Lambarka Land Line Number"
//            emailIdFiedl.placeholder = "E-mayl id"
//            govtTaxField.placeholder = "Govt. Lambarka Canshuuraha"
//            officialRegistrationField.placeholder = "Nambarka Diiwaangelinta Rasmiga ah"
//            fileTf.placeholder = "Fayl"
//            choosefilelbl.setTitle("Xulo Fayl".localized(withComment:"so"), for: .normal)
//            uploadlblTxt.text = " Ku dhaji sawir / PDF Docx".localized(withComment:"so")
//            popupLoginAftrApprovalField.text = "Waad Soo Bixin Kartaa Ansixitaanka Kadib".localized(withComment:"so")
//            popupnotificationField.text = "Ogeysiis waxaa laguugu soo diri doonaa e-mayl ama farriin qoraal ah markii la aqbalo ama la diido astaantaada".localized(withComment:"so")
//            popupUnableField.text = "hadaadan gali karin fadlan".localized(withComment:"so")
//            popupContactField.setTitle("Nala soo xiriir".localized(withComment:"so"), for: .normal)
//            
//            
//        }
        
        
        
        uploadViw.layer.cornerRadius = 5
        submitBtn.layer.cornerRadius = 10
        uploadviw.layer.cornerRadius = 12.5
        businessField.delegate = self
        managerField.delegate = self
        addressFiedl.delegate = self
        cellPhoneField.delegate = self
        landLineField.delegate = self
        emailIdFiedl.delegate = self
        govtTaxField.delegate = self
        cellphone2Field.delegate = self
        land2TF.delegate = self
        officialRegistrationField .delegate = self
        businessPopviwww.layer.cornerRadius = 5
        
    }
    
    
    

 func textFieldDidBeginEditing(_ textField: UITextField) {
     if textField == self.businessField {
         print("TextField did begin editing method called")
        businessStar.alpha = 0
    //    if businessField.text == ""{
//
//            businessStar.alpha = 1
//        }
         // Do your Validate for first text field
     } else if  textField == self.managerField {
          managerStar.alpha = 0

     }else if  textField == self.addressFiedl {

         addressstar.alpha = 0
     }else if  textField == self.cellPhoneField {
           phoneStar.alpha = 0

     }else if  textField == self.landLineField {

         landnmberStar.alpha = 0
     }else if  textField == self.emailIdFiedl {

         emailStar.alpha = 0
     }else if  textField == self.govtTaxField {
          govtStar.alpha = 0

     }else if  textField == self.cellphone2Field {
          cellStarlbl.alpha = 0

     }else if  textField == self.land2TF {
          land2Star.alpha = 0

     }
     else{
         registartionStar.alpha = 0
    }
 }
  
    
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("TextField should clear method called")
        
         if textField == self.businessField {
        
          //   businessStar.alpha = 1
            
        }
        
        
        
        return true;
    }
    
    
    
    
    
    
    
    
    @IBAction func backAction(_ sender: Any) {
        
        //self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    
    
    
    
    @IBAction func uploadFielBtnAction(_ sender: Any) {
        
        
        let importMenu = UIDocumentMenuViewController(documentTypes: [String(kUTTypePDF)], in: .import)
               importMenu.delegate = self
               importMenu.modalPresentationStyle = .formSheet
               self.present(importMenu, animated: true, completion: nil)
        
        
        
        
        
        
        
    }
    
    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
                     guard let myURL = urls.first else {
                          return
                     }
                     print("import result : \(myURL)")
           }


       public func documentMenu(_ documentMenu:UIDocumentMenuViewController, didPickDocumentPicker documentPicker: UIDocumentPickerViewController) {
               documentPicker.delegate = self
               present(documentPicker, animated: true, completion: nil)
           }


       func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
                   print("view was cancelled")
                   dismiss(animated: true, completion: nil)
           }
    
    
    
    
    
    
    
    


    
    @IBAction func submitBtnAction(_ sender: Any) {
        
       
        
        
        if businessField.text == "" || managerField.text == "" || addressFiedl.text == "" || cellPhoneField.text == "" || landLineField.text == "" || emailIdFiedl.text == "" || govtTaxField.text == ""  ||  officialRegistrationField.text == "" ||  land2TF.text == "" ||  cellphone2Field.text == "" || fileTf.text == "" {
                    
                    presentAlert(withTitle: "Afric Ads", message: "Fill Required Fields")
                     
                }else {
            
             businessInfo()
            
            
        }
        
    }
    
    
    @IBAction func popUpCloseBtn(_ sender: Any) {
        
        
       
        //self.performSegue(withIdentifier: "logn", sender: nil)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LogInViewController") as! LogInViewController
                                                 //  vc.recievedLanguage = self.businsslanguageChnge
                                                   // vc.refr = referenceCode
        businessPopMainViw.alpha = 0
                                                   //  vc.verfr = verificationCode
                                                  // postAlomafire()
                                                      self.present(vc, animated: true, completion: nil)
        
        
        
//        let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LogInViewController") as! LogInViewController
//        loginVC.recievedLanguage = self.recievedLanguage; self.navigationController?.pushViewController(loginVC, animated: true)
        
        
    }
    
    
    
    
    @IBAction func addTwoAction(_ sender: Any) {
        
        
        
        cellphone2Field.alpha = 1
       land2Star.alpha = 1
        cell2Btn.alpha = 1
        vwii1HeightConstraint.constant = 42
        
        
    }
    
    
    
    
    @IBAction func removeTwo(_ sender: Any) {
        
        cellphone2Field.alpha = 0
        cellStarlbl.alpha = 0
        cell2Btn.alpha = 0
        vwii1HeightConstraint.constant = 0
        
    }
    
    @IBAction func landLineAction(_ sender: Any) {
        
        land2TF.alpha = 1
        land2Star.alpha = 1
        land2minus.alpha = 1
        landLineHeightConstraint.constant = 42
        
    }
    
    
    
    
    
    
    
    @IBAction func land2BtnRemiveAction(_ sender: Any) {
        
        
        land2TF.alpha = 0
       land2Star.alpha = 0
        land2minus.alpha = 0
        landLineHeightConstraint.constant = 0
        
    }
    
    
    
    
    
    

    func businessInfo(){

       
              DispatchQueue.main.async{
                  //self.hud.show(true)
                   LoaderManager.shared.showLoader()
              }
              

        let parameters: Parameters = [ "businessName" : businessField.text!, "managerName" : managerField.text!,"address" : addressFiedl.text!,"vendorReferenceCode" : UserDefaults.standard.string(forKey:"referenceCode"),"governmentTaxNumber":govtTaxField.text!,"registrationNumber":officialRegistrationField.text,"email":emailIdFiedl.text!,"mobileList":[["mobile":cellPhoneField.text!]] ,"landlineList":[["landline":landLineField.text!]] ,"licenceCertificate":""]
               
       // let parameters: Parameters = [ "businessName" : "Mall", "managerName" :"Ramesh","address" :"NO:2, LGP NAGAR,PROZONE MALL, R S Puram, Tamil Nadu 641035","vendorReferenceCode" : UserDefaults.standard.string(forKey:"referenceCode"),"governmentTaxNumber":"Tn 1021","registrationNumber":"Tn 125456858","email":"navin@gmail.com","mobileList":[["mobile":"9874563210"]] ,"landlineList":[["landline":"9874563210"]] ,"licenceCertificate":""]
        
        
        
        
              
                 let baseUrl = ApiUrl.shared.baseUrl
                  let query = "business-profile"
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
                                       
                                      
                                    
                                     
                                        print(">>>>RES\(response)")
                                        
                                        let mobile = jsonResponse["message"] as! String
                                          
                                         print("LIST >>\(mobile)")
                                                                               
                                        self.self.adminReviwlabl.text! = mobile 
                                        
                                        
                                        
                                        DispatchQueue.main.async{
                                          
                                            LoaderManager.shared.showLoader()
                                        }
                                        self.businessPopMainViw.alpha = 1
                                      // print("VendorRegistration >>\(response)")
                                 //   self.performSegue(withIdentifier: "aproval", sender: nil)
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
