//
//  vendorHomeSideMenuViewController.swift
//  Afric Ads
//
//  Created by apple on 24/02/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class vendorHomeSideMenuViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
   
    

    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profilePhoneNumberField: UILabel!
    @IBOutlet weak var profileEmailField: UILabel!
    
    
    var names = ["Business Listing","My Subscription","Sub Admin-Management","Booking Management","Business Profile","Payment Details","Notifications","Contact US","FAQ","Logout"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profileImg.layer.cornerRadius = profileImg.frame.height/2
        profileImg.clipsToBounds = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
        
              let cell1  = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath as IndexPath) as! vendorHomeSideMenuTableViewCell
              cell1.selectionStyle = .none
              
              cell1.nameListField.text = names[indexPath.row]
              
              return cell1
        
       }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
             
             
                   
                   switch (indexPath.row)
                          {
                          case 0:
                              //self.performSegue(withIdentifier: "neworders", sender: nil)
                              break;
                          case 1:
                            self.performSegue(withIdentifier: "subscription", sender: nil)
                              break;
                          case 2:
                              //self.performSegue(withIdentifier: "Menu", sender: nil)
                              break;
                          case 3:
                             // self.performSegue(withIdentifier: "college", sender: nil)
                              break;
                          case 4:
                             self.performSegue(withIdentifier: "businessProfile", sender: nil)
                            break;
                         case 5:
                         self.performSegue(withIdentifier: "payment", sender: nil)
                            break;
                        case 6:
                           // self.performSegue(withIdentifier: "offer", sender: nil)
                           break;
                     case 7:
                         self.performSegue(withIdentifier: "contactuss", sender: nil)
                          break;
                    case 8:
                       self.performSegue(withIdentifier: "faq", sender: nil)
                         break;
                    case 9:
                        logoutMethod()
                 break;
              
                                      
                  default:
                   break;
                     
                     
                          }
        
         }
    
    
    func logoutMethod(){
           DispatchQueue.main.async{

           let alertController = UIAlertController(title: "", message:"Are you sure do you want to logout?" , preferredStyle: .alert)
           let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
               //UserDefaults.standard.set(nil, forKey: "userfacInfo") //setObject
               DispatchQueue.main.async{
                
                
                 self.performSegue(withIdentifier: "vendorout", sender: nil)
                
                //let vc = self.storyboard?.instantiateViewController(withIdentifier: "SelectLanguageViewController") as! SelectLanguageViewController
                //self.present(vc, animated: true, completion: nil)
                
               }
           }
           let CancelAction = UIAlertAction(title: "Cancel", style: .default) { (action) in
           }
           alertController.addAction(OKAction)
           alertController.addAction(CancelAction)
           self.present(alertController, animated: true)
           {
           }
           }
       }
    
    
    
    
    
    
    

}
