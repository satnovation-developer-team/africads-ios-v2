//
//  FaqViewController.swift
//  Afric Ads
//
//  Created by apple on 11/03/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Alamofire


class FaqViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var names = ["FAQ's","Hotel Cancellation charges","Hotel Rescheduling Charges","Check status of Hotel","Payment/Refund","Other"]
    
    
    @IBOutlet weak var tableViw: UITableView!
    
    
    var seleectedIndex1 = -1
    var collapse1 = false
    
    
    var questions = [String]()
    var answers = [String]()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

         faqList()
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
             return questions.count
           }
           
           func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               
             let cell1  = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath as IndexPath) as! faqTableViewCell
             cell1.selectionStyle = .none
          //  cell1.imgBtn.setImage(UIImage(named:(any_boolean_condition ? "checkedImage" : "uncheckedImage")), forState:UIControlState.Normal)
            cell1.questionfield.text = "Qa. \(questions[indexPath.row])"
            cell1.ansrField.text = "Ans. \(answers[indexPath.row])"
            
             cell1.namefield.text = names[indexPath.row]
             
             
             
             return cell1
           }
         
    
    
    
    
         func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            
            
            
            if self.seleectedIndex1 == indexPath.row && collapse1 == true{
                                
                                return 195
                                }else {
                                    return 55
                                }
            
             
         }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
                  tableView.deselectRow(at: indexPath, animated: true)
                           
                           if seleectedIndex1 == indexPath.row {
                               
                               if self.collapse1 == false {
                                   
                                   
                                    self.collapse1 = true
                               }else{
                                
                                   
                                   self.collapse1 = false
                               }
                               
                               
                           }else{
                     self.collapse1 = true
                        
                       }
                         self.seleectedIndex1 = indexPath.row
                              tableView.reloadRows(at: [indexPath], with: .automatic)
                     
                 // let cell = tableView.cellForRow(at: indexPath) as! faqTableViewCell
                     
                           //  cell.newOderRightImg.image = UIImage(named: "downArw")
                  let cell2 = tableView.cellForRow(at: indexPath) as! faqTableViewCell
                  
                        cell2.rightImg.image = UIImage(named: "down")
       
        
        
        
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
           
           
        let cell2 = tableView.cellForRow(at: indexPath) as! faqTableViewCell
                         
                               cell2.rightImg.image = UIImage(named: "right")
        
        

          }
    
    
    
    
    @objc func buttonClick(){
        
        
        
        
    }
    
    
    
    
       
        func faqList(){
               
              DispatchQueue.main.async{
                                          //self.hud.show(true)
               LoaderManager.shared.showLoader()
               
                     }
               
                let baseUrl = ApiUrl.shared.baseUrl
                let query = "fetch-faq"
                let finalUrl = "\(baseUrl)\(query)"
                       
                let targetURL = URL(string: "\(finalUrl)")
                var request = URLRequest(url: targetURL!)
                request.httpMethod = "POST"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                                     // request.setValue("CODEX@123",forHTTPHeaderField: "x-api-key")
                let values = ["token":UserDefaults.standard.string(forKey:"userIdData")!]
                 print(">>>>>>  \(values)")
                request.httpBody = try! JSONSerialization.data(withJSONObject: values, options: [])
                                    
                Alamofire.request(request as! URLRequestConvertible).responseJSON {
                   
                 response in
                       do
                         {
                           
                              DispatchQueue.main.async{
                                              LoaderManager.shared.showLoader()
                                                                   
                                           }

                            let jsonResponse = try JSONSerialization.jsonObject(with: response.data!, options: .mutableContainers) as! [String:Any]
                                                                 
                                   print(">>NearByList>\(jsonResponse)")
                                                               
                             let faqList = jsonResponse["faqList"] as! [[String:Any]]
                             print(faqList)
                                        
                            
                           for i in faqList {
                            
                            let question = i["questions"] as! String
                            self.questions.append(question)
                            print(self.questions)
                            
                            let answer = i["answers"] as! String
                              self.answers.append(answer)
                            print(self.answers)
                            
                            
                            }
//}
//                               let name = i["name"] as! String
//                                self.nameArray.append(name)
//                                print(self.nameArray)
//
//                                let distance = i["distance"] as! Double
//                                self.distanceArray.append(distance)
//                                 print(self.distanceArray)
//
//                                let area = i["area"] as! String
//                                self.areaArray.append(area)
//                                print(self.areaArray)
//
//    //                            let folderName = i["folderName"] as! String
//    //                            self.imgfolderNameArray.append(folderName)
//    //                            print(self.imgfolderNameArray)
//
//                                self.folderName1 = i["folderName"] as! String
//                                self.bannerImage1 = i["bannerImage"] as! String
//
//
//    //                            let bannerImage = i["bannerImage"] as! String
//    //                            self.bannerImageArray.append(bannerImage)
//    //                            print(self.bannerImageArray)
//
//                                self.imagefile = jsonResponse["fileSource"] as! String
//
//                                self.combinedImgArray = "\(self.imagefile!)\(self.folderName1!)/\(self.bannerImage1!)"
//
//                                print(self.combinedImgArray!)
//                                self.total.append(self.combinedImgArray)
//
//
//
//                            }
                         
                        
                               
                          
                                 DispatchQueue.main.async{
                                    
                                self.tableViw.reloadData()
                                   // self.listAllTableViw.reloadData()
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
    
    
    
    
    
    
    @IBAction func backBtn(_ sender: Any) {
        
        
         self.dismiss(animated: true, completion: nil)
        
        
    }
    

}
