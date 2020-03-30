//
//  HomeViewController.swift
//  Afric Ads
//
//  Created by apple on 18/02/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Alamofire
import Auk
import moa






class HomeViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,UITextFieldDelegate,UISearchBarDelegate {
  
    
    @IBOutlet weak var scrllvw: UIScrollView!
    @IBOutlet weak var seachViw: UIView!
    @IBOutlet weak var tabelViw: UITableView!
    
    
    
    @IBOutlet weak var searchbr: UISearchBar!
    
    var searchActive : Bool = false

    
    var combined2 :String!
    var a = [String]()
    var nameArray = [String]()
    var uploadFiles: String!
    var imagefile: String!
    var language:String!
    var name = [String]()
    
    var list = ["1","2","3","4","5","6","7","8","9","10","11","12"]
    var filtered:[String] = []
    var nmeArray = ["Lodge","Hotel","Restaurant","Mall","Theatre","Play Station","Tours & Travels","Department Store","Sports Academy","Education Institution","Spa","Car & Bike Rental"]

     //var name = ["Hotels and Restaurants","Coffee","Shopping malls and SuperMarkets","Clothes and Perfumes","Services and Insurance"]
    
    @IBOutlet  var sliderviw: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        scrllvw.delegate = self
        searchbr.delegate = self
        
        filtered = nameArray
        
       // searchTf.delegate = self
        //scrllvw.auk.numberOfPages
        //scrllvw.auk.startAutoScroll(delaySeconds: 1)

      //  self.scrllvw.auk.show(url: self.combined2)
//        scrllvw.auk.numberOfPages
//        scrllvw.auk.startAutoScroll(delaySeconds: 1)
        scrllvw.layer.cornerRadius =  5

        
        seachViw.layer.borderWidth =  0.3
        seachViw.layer.borderColor =  #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        seachViw.layer.cornerRadius =  5
       // sliderviw.layer.cornerRadius =  10
            homeMethod()
            
        }
    
    private func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
       searchActive = true;
   }

    private func searchBarTextDidEndEditing(searchBar: UISearchBar) {
       searchActive = false;
   }

    private func searchBarCancelButtonClicked(searchBar: UISearchBar) {
       searchActive = false;
   }

    private func searchBarSearchButtonClicked(searchBar: UISearchBar) {
       searchActive = false;
   }

    private func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {

       filtered = nameArray.filter({ (text) -> Bool in
        let tmp: NSString = text as NSString
        let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
           return range.location != NSNotFound
       })
       if(filtered.count == 0){
           searchActive = false;
       } else {
           searchActive = true;
       }
    
     DispatchQueue.main.async {
       self.tabelViw.reloadData()
    }
   }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        if(searchActive) {
                return filtered.count
            }
            return nameArray.count;
        }
        
       
      
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
        let cell1  = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath as IndexPath) as! HomeListTableViewCell
        cell1.selectionStyle = .none
        
        cell1.snoField.text = list[indexPath.row]
       // cell1.nameField.text = nameArray[indexPath.row]
        
        if(searchActive){
                   cell1.nameField.text = filtered[indexPath.row]
               } else {
                   cell1.nameField.text = nameArray[indexPath.row];
               }
        
        return cell1
      }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        
        return 45
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if   indexPath.row == 1 {
            
             self.performSegue(withIdentifier: "search", sender: nil)
            
        }else{
            
            
            self.performSegue(withIdentifier: "Catrgrysearch", sender: nil)
            
        }
        
       
        
    }
    
    
    
      func homeMethod(){
                 
                           DispatchQueue.main.async{
                               //self.hud.show(true)
                                LoaderManager.shared.showLoader()
                           }
            
            
                        
                          let baseUrl = ApiUrl.shared.baseUrl
                          let query = "category"
                          let finalUrl = "\(baseUrl)\(query)"
            
                           let targetURL = URL(string: "\(finalUrl)")
                           var request = URLRequest(url: targetURL!)
                           request.httpMethod = "POST"
                           request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                          // request.setValue("CODEX@123",forHTTPHeaderField: "x-api-key")
                           let values = ["languageKey":"en"]
                           request.httpBody = try! JSONSerialization.data(withJSONObject: values, options: [])
                         
                           Alamofire.request(request as! URLRequestConvertible).responseJSON {
                                                 response in
                                                 do
                             {
                                DispatchQueue.main.async{
                                LoaderManager.shared.showLoader()
                                  }

                         let jsonResponse = try JSONSerialization.jsonObject(with: response.data!, options: .mutableContainers) as! NSDictionary
                                
                        self.imagefile = jsonResponse["fileSource"] as! String
                         let cateogrylist = jsonResponse["categoryList"] as! Array<Any>
                        // print(cateogrylist)
                           for i in 0..<cateogrylist.count
                                                    {
                                                        
                                                        let x = cateogrylist[i] as! [String:AnyObject]
                                                     //   let categoryId = x["cateogryId"] as! Int
                                                     //   print(categoryId)
                                                        let name = x["name"] as! String
                                                        self.nameArray.append(name)

                                                        let categoryUploadFileList = x["categoryUploadFileList"] as! Array<Any>
                                                        for j in 0..<categoryUploadFileList.count
                                                       {
                                                      let y = categoryUploadFileList[j] as! [String:AnyObject]
                                                       // print("UUU>>\(y)")
                                                         self.uploadFiles = y["uploadFiles"] as! String
                                                        // print("UUUP>>\(self.uploadFiles)")
                                                         self.imagefile = jsonResponse["fileSource"] as! String
                                                        self.combined2 = "\(self.imagefile!)\(self.uploadFiles!)"
                                                        print("TOTAl  >> \(self.combined2)")
                                                        
                                                        self.scrllvw.auk.show(url: self.combined2)
                                                        self.scrllvw.auk.numberOfPages
                                                        self.scrllvw.auk.startAutoScroll(delaySeconds: 4)
                                                        
                                                        
                                                 }
                           }
                                  
                     
//                                for i in 0..<self.uploadFiles.count{
//
//
//                                    self.a.append(self.fileImageSource+self.uploadFiles[i])
//
//
//                                }
                                                     
                                print(" BLOOD >> \(self.a.count)")
                                
                                
                                
//                                                    }
                                                    
                                                     DispatchQueue.main.async{
                                                    
                                                    print("HOME-->\(response)")
                                                    self.tabelViw.reloadData()
                                                    
                                                    }
                                                    
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
