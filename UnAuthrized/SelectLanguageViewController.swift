//
//  SelectLanguageViewController.swift
//  Afric Ads
//
//  Created by apple on 17/02/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class SelectLanguageViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var viw: UIView!
    @IBOutlet weak var selectLanguageLbl: UILabel!
    @IBOutlet weak var languaegf: UITextField!
    @IBOutlet weak var selectLanguageButton: UIButton!
    var selectedLanguage : String!
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationController?.isNavigationBarHidden = true
        
        
        selectLanguageLbl.text = "SELECT LANGUAGE / Xulo LUUQADAHA"
        //  selectLanguageLbl.text = "select_language".localized(withComment: "en")
        
        getLanguage()
        viw.layer.cornerRadius = 25
        viw.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        viw.layer.borderWidth = 1
        languaegf.tintColor = UIColor.clear
        selectedLanguage = selectLanguageLbl.text
        print ("selectedLanguage is :  \(String(describing: selectedLanguage))")
        //        "select_language" = "Test";
        //        "select_language" = "Xulo LUUQADAHA";
        
        
    
        
        let selectedLanguage = UserDefaults.standard.string(forKey: "Language")
    
        // button click chai gane home ki going bro
            //Malli run chesthanu nuvvem clisck cheyaku just emscreen vasthundo cheppu
        
        
        if selectedLanguage != nil
        {
            self.performSegue(withIdentifier: "loginn", sender: nil)
        }
        else
        {
            if selectedLanguage == "English" || selectedLanguage == "Somalia"
            {
                self.performSegue(withIdentifier: "loginn", sender: nil)
                
            }
            else
            {
                print("No language selected.")
                languageChange()
            }
        }
        
        

    }
    
    @IBAction func selectLanguageButtonAction(_ sender: Any) {
        

        let selectedLanguage = UserDefaults.standard.string(forKey: "Language")
        
        if selectedLanguage != nil
        {
            //self.performSegue(withIdentifier: "loginn", sender: nil)
            
            let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LogInViewController") as! LogInViewController
            loginVC.recievedLanguage = self.selectLanguageLbl.text; self.navigationController?.pushViewController(loginVC, animated: true)
        }
        else
        {
            if selectedLanguage == "English" || selectedLanguage == "Somalia"
            {
                //Here performe segue to move to home screen
                //Move to next screen
                
                self.performSegue(withIdentifier: "loginn", sender: nil)
                
            }
            else
            {
                print("No language selected.")
              languageChange()
            }
        }

    }
    
    
    @IBAction func nextAction(_ sender: Any) {
        
        
        
        
    }
    
    
    
    func languageChange()
    {
     
        UserDefaults.standard.set("First", forKey: "LoginCount")
        // create an actionSheet
        let actionSheetController: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        // create an action
        
        let firstAction: UIAlertAction = UIAlertAction(title: "English", style: .default) { action -> Void in
            
            
            
            //        if Language.language.rawValue == "ar"
            //         {
            self.selectLanguageLbl.text = "SELECT LANGUAGE / Xulo LUUQADAHA"
            print("English pressed")
            
            UserDefaults.standard.set("English", forKey: "Language")
            self.showAlert()
            //                                              LocalizationSystem.sharedInstance.setLanguage(languageCode: "en")
            //                                           self.showAlert()
            //                                                   } else {
            //                                           print("click arabic");
            //                                           LocalizationSystem.sharedInstance.setLanguage(languageCode: "en")
            //                                               }
            //
        }
        
        let secondAction: UIAlertAction = UIAlertAction(title: "Somalia", style: .default) { action -> Void in
            
            
            //          if Language.language.rawValue == "en"
            //            {
            //
            //           LocalizationSystem.sharedInstance.setLanguage(languageCode: "ar")
            //           self.showAlert()
            //
            //          } else {
            //           print("click english");
            //          LocalizationSystem.sharedInstance.setLanguage(languageCode: "ar")
            //
            //                                                                                  }
            self.selectLanguageLbl.text = "Xulo LUUQADAHA / SELECT LANGUAGE "
            print("somaliya Action pressed")
            
            UserDefaults.standard.set("Somalia", forKey: "Language")
            
            self.showAlert()
            
        }
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in }
        
        // add actions
        actionSheetController.addAction(firstAction)
        actionSheetController.addAction(secondAction)
        actionSheetController.addAction(cancelAction)
        
        
        // present an actionSheet...
        // present(actionSheetController, animated: true, completion: nil)
        // doesn't work for iPad
        
        
        
        present(actionSheetController, animated: true) {
            print("option menu presented")
        }
        
        
    }
    
    
    
    
    func showAlert() {
        
        let alert = UIAlertController(title: " Change Language  to other", message: "In order to change the Language the app changed the language. ", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { _ in
            //Cancel Action
            
            print ("fgfdgd")
            
            UserDefaults.standard.set("", forKey: "Language")
            
            //         if Language.language.rawValue == "ar"{
            //         print("English pressed")
            //
            //         LocalizationSystem.sharedInstance.setLanguage(languageCode: "en")} else {
            //         print("click arabic");
            //         LocalizationSystem.sharedInstance.setLanguage(languageCode: "ar")
            //         print ("fgfdgd")
            //                                                                                                                 }
            
        }))
        alert.addAction(UIAlertAction(title: "OK",
                                      style: UIAlertAction.Style.default,
                                      handler: {(_: UIAlertAction!) in
                                        
                                        print ("action ok")
                                        
                                        print("Selected app language is:",UserDefaults.standard.string(forKey: "Language") ?? "Unable to get selected language.")
                                        
                                        //Sign out action
                                        
                                        //let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LogInViewController") as! LogInViewController
                                        //loginVC.recievedLanguage = self.selectLanguageLbl.text; self.navigationController?.pushViewController(loginVC, animated: true)
                                        
                                        self.performSegue(withIdentifier: "loginn", sender: nil)
                                        
                                        
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    
    func getLanguage()
    {
        
        
        let baseUrl = ApiUrl.shared.baseUrl
        let query = "language"
        let finalUrl = "\(baseUrl)\(query)"
        
        
        var todoEndpoint: String =  NSString(format:"\(finalUrl)" as NSString)as String
        todoEndpoint = todoEndpoint.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let requestURL : NSURL = NSURL(string: todoEndpoint)!
        let session = URLSession.shared
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(url: requestURL as URL)
        let task = session.dataTask(with: urlRequest as URLRequest) { (data, response, error) -> Void in
            if(data != nil)
            {
                let httpResponse = response as! HTTPURLResponse
                let statusCode = httpResponse.statusCode
                if(statusCode == 200)
                {
                    do
                    {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! NSDictionary
                        print("jsonResponse is \(jsonResponse)")
                        
                        // self.nationalityArray = jsonResponse["languageList"] as! NSMutableArray
                        DispatchQueue.main.async
                            {
                                //  self.nationalitypickerView.dataSource = self
                                //  self.nationalitypickerView.delegate = self
                        }
                        
                        
                    }
                    catch let error
                    {
                        print(error)
                    }
                }
            }
        }
        task.resume()
    }
    
    
    
    
}






//extension String {
//
//    func localized(loc:String) -> String {
//
//        let pathh = Bundle.main.path(forResource:loc,ofType :"lpro")
//        let bundle = Bundle(path: pathh!)
//        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
//    }
//
//
//}
