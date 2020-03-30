//
//  profileViewController.swift
//  Afric Ads
//
//  Created by apple on 28/02/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class profileViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var emailField: UILabel!
    @IBOutlet weak var mobilefield: UILabel!
    @IBOutlet weak var prfileImg: UIImageView!
    
    
    
    var img = ["11-1","22-1","33-1","44-1","11-1"]
    var names = ["Payment Details","Change Password","Contact US","FAQ","Logout"]
    var subNames = ["wanna to peek on your payment details or wanna do changes of your saved cards? tap here!!","to change the password click here!","To reach Us tap here!!","do you have any doubts? tap here!!",""]
    
     var image : UIImage!
     var namee:String!
     var email:String!
     var mobile:String!
    
    var selectLnguage:String!
    override func viewDidLoad() {
        super.viewDidLoad()

        name.text = UserDefaults.standard.string(forKey:"nameuser")
        emailField.text = UserDefaults.standard.string(forKey:"emailuser")
        mobilefield.text = UserDefaults.standard.string(forKey:"mobileuser")
        
       
       // prfileImg.image = UIImage(named: "\(image)")
        
       // name.text = namee
       // emailField.text = email
      //  mobilefield.text = mobile
        
        
        
        
        
        if selectLnguage == "SELECT LANGUAGE / Xulo LUUQADAHA"
        {
           
          //  name.text = "Remember me".localized(withComment:"so")
            
        }else{
            
            
        //  name.text = "Xln bfh".localized(withComment:"so")
            
        }
        
        prfileImg.setRounded()

        
      //  update()
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return img.count
         }
         
         func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
             
           let cell1  = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath as IndexPath) as! profileTableViewCell
           cell1.selectionStyle = .none
           
            cell1.img.image = UIImage(named: "\(img[indexPath.row])")
           cell1.nameField.text = names[indexPath.row]
            cell1.subNameField.text = subNames[indexPath.row]
           
           
           return cell1
         }
       
       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 65
       }

    
    func update(){
        
        
       // name.text?.removeAll()
        //emailField.text?.removeAll()
       // mobilefield.text?.removeAll()
        
      //  name.text        = UserDefaults.standard.string(forKey:"nameupdate")
      //  emailField.text  = UserDefaults.standard.string(forKey:"emailUpdate")
       // mobilefield.text = UserDefaults.standard.string(forKey:"mobileupdate")
        
        
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         
         
               
               switch (indexPath.row)
                      {
                      case 0:
                          //self.performSegue(withIdentifier: "neworders", sender: nil)
                          break;
                case 1:
                   self.performSegue(withIdentifier: "changePasswod", sender: nil)
                          break;
                case 2:
                    self.performSegue(withIdentifier: "contact", sender: nil)
                          break;
                case 3:
                self.performSegue(withIdentifier: "faq", sender: nil)
                break;
                     
                case 4:
                    
                   // let vc = self.storyboard?.instantiateViewController(withIdentifier: "SelectLanguageViewController") as! SelectLanguageViewController
                    //vc.recievedLanguage = self.selectLnguage;
                        //    self.present(vc, animated: true, completion: nil)
                    
                  // let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LogInViewController") as! LogInViewController
                  //  loginVC.recievedLanguage = self.selectLnguage; self.navigationController?.pushViewController(loginVC, animated: true)
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
                   
                  // let vc = self.storyboard?.instantiateViewController(withIdentifier: "LogInViewController") as! LogInViewController
                  // self.present(vc, animated: true, completion: nil)
                   
                    self.performSegue(withIdentifier: "out", sender: nil)
                    
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
       
    
    
    @IBAction func editPrfileAction(_ sender: Any) {
        
        
        self.performSegue(withIdentifier: "editPrfile", sender: nil)
        
        
        
    }
    
    
    
    
    
    
    
    
}


extension UIImageView {

   func setRounded() {
    let radius = self.frame.width / 2
      self.layer.cornerRadius = radius
      self.layer.masksToBounds = true
   }
}
