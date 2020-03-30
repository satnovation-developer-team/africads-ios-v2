//
//  YourDetailsViewController.swift
//  Afric Ads
//
//  Created by apple on 13/03/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import TextFieldEffects
import Alamofire

class YourDetailsViewController: UIViewController {

    
    
    
    
    @IBOutlet weak var nxtBtn: UIButton!
    @IBOutlet weak var bckViw: UIView!
    
    
    
    @IBOutlet weak var chsefileViw: UIView!
    
    
    @IBOutlet weak var nametf: HoshiTextField!
    @IBOutlet weak var addressTf: HoshiTextField!
    @IBOutlet weak var mobiletf: HoshiTextField!
    @IBOutlet weak var emailtf: HoshiTextField!
    @IBOutlet weak var chooseFieldtf: HoshiTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        chsefileViw.layer.cornerRadius =  10
        bckViw.layer.borderWidth = 0.5
        bckViw.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        nxtBtn.layer.cornerRadius =  10
       
    }
    
    
    
    
    
    
    
    @IBAction func backMethod(_ sender: Any) {
        
         //self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
        
        
    }
    
    
    @IBAction func makepaymentAction(_ sender: Any) {
        
        
        if (nametf.text?.isEmpty == true && addressTf.text?.isEmpty == true && mobiletf.text?.isEmpty == true && emailtf.text?.isEmpty == true  && chooseFieldtf.text?.isEmpty == true )
        {
            
         presentAlert(withTitle: "Afric Ads", message: "Fields cannot be empty")
        
        }else{
            
            
             hotelBooking()
        }
        
        
        
        
      
      
        
    }
    

    
    func hotelBooking(){

                  
                         DispatchQueue.main.async{
                             //self.hud.show(true)
                              LoaderManager.shared.showLoader()
                         }
                         

        let parameters  = ["name":nametf.text!,"email":emailtf.text!,"mobile":mobiletf.text!,"address":addressTf.text!,"adults":2,"childs":2,"checkIn":"2020-04-15 18:00:00","checkOut":"2020-04-18 18:00:00","type":1,"token":UserDefaults.standard.string(forKey:"userIdData"), "addressReferenceCode":UserDefaults.standard.string(forKey:"AddressreferenceCode"),"serviceReferenceCode":UserDefaults.standard.string(forKey:"ServicereferenceCode")] as [String : Any]
                          
                 
                 let baseUrl = ApiUrl.shared.baseUrl
                 let query = "booking/mobile-insert"
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
                                                 
                                           print("HotelBooking \(jsonResponse)")
                        
                                                 self.performSegue(withIdentifier: "payment", sender: nil)
                                                 
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
