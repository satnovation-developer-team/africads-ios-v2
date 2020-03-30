//
//  findHotelsViewController.swift
//  Afric Ads
//
//  Created by apple on 11/03/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class findHotelsViewController: UIViewController,UITextFieldDelegate {

    
    
    
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var navgtionViw: UIView!
    
    @IBOutlet weak var fromtf: UITextField!
    @IBOutlet weak var toTf: UITextField!
    
    
     let datePicker = UIDatePicker()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
       showDatePicker()
        showDatePicker1()
        
        
        searchBtn.layer.cornerRadius = 10
        
        navgtionViw.layer.shadowColor = UIColor.lightGray.cgColor
        navgtionViw.layer.masksToBounds = false
        navgtionViw.layer.shadowOffset = CGSize(width: 0.0 , height: 0.5)
        navgtionViw.layer.shadowOpacity = 0.5
        navgtionViw.layer.shadowRadius = 0.5
        
        
        
    }
    
    func showDatePicker(){
        //Formate Date
        datePicker.datePickerMode = .date

       //ToolBar
       let toolbar = UIToolbar();
       toolbar.sizeToFit()
       let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
      let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));

     toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)

      fromtf.inputAccessoryView = toolbar
      fromtf.inputView = datePicker
        
        

     }
    
    func showDatePicker1(){
           //Formate Date
           datePicker.datePickerMode = .date

          //ToolBar
          let toolbar = UIToolbar();
          toolbar.sizeToFit()
          let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker1));
           let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
         let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker1));

        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)

        
           
           toTf.inputAccessoryView = toolbar
           toTf.inputView = datePicker

        }
    
    
    
    
    
    
    
    @objc func donedatePicker(){

       let formatter = DateFormatter()
       formatter.dateFormat = "dd/MM/yyyy"
       fromtf.text = formatter.string(from: datePicker.date)
       
       self.view.endEditing(true)
     }

     @objc func cancelDatePicker(){
        self.view.endEditing(true)
      }
   
    
    @objc func donedatePicker1(){

          let formatter = DateFormatter()
          formatter.dateFormat = "dd/MM/yyyy"
          
          toTf.text = formatter.string(from: datePicker.date)
          self.view.endEditing(true)
        }

        @objc func cancelDatePicker1(){
           self.view.endEditing(true)
         }
    
    
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
      
      
    }
    
    
    @objc func doneButtonTapped() {
       
    }
    
    
    
    @IBAction func searchAction(_ sender: Any) {
        
        
        self.performSegue(withIdentifier: "nearby", sender: nil)
        
        
        
    }
    
    
    
    @IBAction func back(_ sender: Any) {
        
        
      self.dismiss(animated: true, completion: nil)
        
        
    }
    
    
    
    


}
