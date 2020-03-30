//
//  HotelSearchResultsViewController.swift
//  Afric Ads
//
//  Created by apple on 12/03/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class HotelSearchResultsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
  
    

    @IBOutlet weak var liastAllTableViw: UIView!
    @IBOutlet weak var nearBybtn: UIButton!
    @IBOutlet weak var listAllBtn: UIButton!
    @IBOutlet weak var btnBackviw: UIView!
    @IBOutlet weak var bck1ViwDropshdw: UIView!
    @IBOutlet weak var bck2ViwDropshdw: UIView!
    @IBOutlet weak var filterBtnViw: UIView!
    @IBOutlet weak var nearByTableViw: UITableView!
    @IBOutlet weak var listAllTablViw: UITableView!
    
    
    
    @IBOutlet weak var bydistanceTableViw: UITableView!
    @IBOutlet weak var citytableViw: UITableView!
    @IBOutlet weak var citytablebackViw: UIView!
    @IBOutlet weak var nameTableViw: UITableView!
    @IBOutlet weak var namebckViw: UIView!
    @IBOutlet weak var applyBtn: UIButton!
    
    
      @IBOutlet weak var filtrViw: UIView!
    
    
     var selectedIndex:Int?
    
    
    
    @IBOutlet weak var bydistanceSideViw: UIView!
    @IBOutlet weak var byDistancebckviw: UIView!
       
       
       
       @IBOutlet weak var bycitySideViw: UIView!
       @IBOutlet weak var bycityBackViw: UIView!
       
       
       
       @IBOutlet weak var bynameSideViw: UIView!
       @IBOutlet weak var byNamebckviw: UIView!
    
    
    
    
    
   
   
    
    
    
      var nameArray = [String]()
      var distanceArray = [Double]()
      var areaArray = [String]()
      var imgfolderNameArray = [String]()
      var bannerImageArray = [String]()
      var imagefile: String!
      var folderName1:String!
      var bannerImage1:String!
      var combinedImgArray:String!
      var total = [String]()
    
    
    var citys = [String]()
    var nameFiltr = [String]()
    
    
       var distnceArray = ["0 to 30Km","30 to 60Km","60 to 90Km","0 to 30Km"]
       var cityeArray = ["Somalia","Hergesia","Berbera","Merca"]
       var nameeArray = ["Archana Mall","Central","Cosmos Mall","DLF Mall"]
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        nearBybtn.layer.cornerRadius = 8
        nearBybtn.layer.borderWidth = 1
        nearBybtn.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        nearBybtn.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        btnBackviw.layer.cornerRadius = 8
        
        bck1ViwDropshdw.layer.shadowColor = UIColor.lightGray.cgColor
        bck1ViwDropshdw.layer.masksToBounds = false
        bck1ViwDropshdw.layer.shadowOffset = CGSize(width: 0.0 , height: 0.5)
        bck1ViwDropshdw.layer.shadowOpacity = 0.5
        bck1ViwDropshdw.layer.shadowRadius = 0.5
        
        bck2ViwDropshdw.layer.shadowColor = UIColor.lightGray.cgColor
        bck2ViwDropshdw.layer.masksToBounds = false
        bck2ViwDropshdw.layer.shadowOffset = CGSize(width: 0.0 , height: 0.5)
        bck2ViwDropshdw.layer.shadowOpacity = 0.5
        bck2ViwDropshdw.layer.shadowRadius = 0.5
        
        
        filterBtnViw.layer.cornerRadius = 10
        filterBtnViw.layer.borderWidth = 1
        filterBtnViw.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        filtrViw.clipsToBounds = true
        filtrViw.layer.cornerRadius = 15
        filtrViw.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        applyBtn.layer.cornerRadius = 7
        
        nearByList()
        
    }
    
    @IBAction func nearByAction(_ sender: Any) {
        
        listAllBtn.layer.cornerRadius = 8
        listAllBtn.layer.borderWidth = 1
        listAllBtn.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        listAllBtn.layer.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        
        nearBybtn.layer.cornerRadius = 8
        nearBybtn.layer.borderWidth = 1
        nearBybtn.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        nearBybtn.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        nearByTableViw.alpha = 1
        liastAllTableViw.alpha = 0
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
         if tableView == nearByTableViw {
                 
                 return nameArray.count
             }else if tableView == listAllTablViw  {
                
                 return nameArray.count
             }else  if tableView == bydistanceTableViw  {
                 
                 
                 
               return distnceArray.count
             }else  if tableView == citytableViw{
                 
                 
                 
                 return citys.count
             }else{
                 
                 
                 
              return nameFiltr.count
             }
             
        
          
      }
      
    
    
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
        
         if tableView == nearByTableViw {
        
        let cell1  = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath as IndexPath) as! HotelSearchResultsNearbyTableViewCell
        cell1.selectionStyle = .none
        
            
            cell1.namefield.text = nameArray[indexPath.row]
            cell1.kilometerLbl.text = "\(distanceArray[indexPath.row])KM"
            cell1.addresslbl.text = areaArray[indexPath.row]
            
            
            
            let url = URL(string: "\(total[indexPath.row])")
                           print("Image url to display in table view is:",url)
                          // cell1.nearbyImg.image.kf.setImage(with: url)
                         
                           
                           cell1.img.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: nil, completionHandler: { image, error, cacheType, imageURL in
                           if (image != nil){
                               cell1.img.image = image
                           }
                           else {
                               cell1.img.image = UIImage.init(named: "placeHolder")
                           }
                           })
                           
            
             return cell1
            
        
       
         }else if  tableView == listAllTablViw  {
            
            
            
            let cell1  = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath as IndexPath) as! HotelSearchResultsListallTableViewCell
                   cell1.selectionStyle = .none
                   
            
            
                     cell1.nameField.text = nameArray[indexPath.row]
                     cell1.kiloMeterField.text = "\(distanceArray[indexPath.row])KM"
                     cell1.addressfield.text = areaArray[indexPath.row]
                     
                     
                     
                     let url = URL(string: "\(total[indexPath.row])")
                                    print("Image url to display in table view is:",url)
                                   // cell1.nearbyImg.image.kf.setImage(with: url)
                                  
                                    
                                    cell1.img1.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: nil, completionHandler: { image, error, cacheType, imageURL in
                                    if (image != nil){
                                        cell1.img1.image = image
                                    }
                                    else {
                                        cell1.img1.image = UIImage.init(named: "placeHolder")
                                    }
                                    })
            
            
            
            
            
                   
                   return cell1
            
            
         }else if tableView == bydistanceTableViw {
         
         
         
         let cell1  = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath as IndexPath) as! byDistanceTableViewCell
         cell1.selectionStyle = .none
         
         
         
         
         cell1.byDistancenamefield.text = distnceArray[indexPath.row]
            
            
             return cell1
            
         }else if tableView == citytableViw {
         
         let cell1  = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath as IndexPath) as! bycityTableViewCell
                       cell1.selectionStyle = .none
                       
                       
            cell1.cityNamefield.text = citys[indexPath.row]
            
            
           
                       
                       
                       
                       return cell1
            
         }else {
            
            
            let cell  = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath as IndexPath) as! bynameTableViewCell
             cell.selectionStyle = .none
                                                       
                                                       
                                                       
                                                       
            cell.byNamefield.text = nameFiltr[indexPath.row]
                                                       
                                                       
                                                       
          return cell
            
        
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
      if tableView == nearByTableViw {
                   
                   
                   return 134
               }else if tableView == listAllTablViw {
                 
                   
                   return 134
               }else  if tableView == bydistanceTableViw{
                   
                   
                   
                   return 50
               }else if tableView == citytableViw{
                   
                   
                   
                   return 50
               }else {
                   
                   
                   
                    return 50
               }
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "restaurentlist", sender: nil)
        
    }
    
    
    @IBAction func listAllAction(_ sender: Any) {
        
        
        listAllBtn.layer.cornerRadius = 8
              listAllBtn.layer.borderWidth = 1
              listAllBtn.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
              listAllBtn.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
              
              nearBybtn.layer.cornerRadius = 8
              nearBybtn.layer.borderWidth = 1
              nearBybtn.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
              nearBybtn.layer.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        
        nearByTableViw.alpha = 0
        liastAllTableViw.alpha = 1
        
        
    }
    
    @IBAction func filterBtnAction(_ sender: Any) {
        
        
         filtrViw.alpha = 1
    //   cityList()
        
    }
    
    
    
    @IBAction func filterClosebtn(_ sender: Any) {
        
        
        
         filtrViw.alpha = 0
        
        
    }
    
    
    
    
    
    
     func nearByList(){
               
              DispatchQueue.main.async{
                                          //self.hud.show(true)
               LoaderManager.shared.showLoader()
               
                     }
               
                let baseUrl = ApiUrl.shared.baseUrl
                let query = "filter-business-listing"
                let finalUrl = "\(baseUrl)\(query)"
                       
                let targetURL = URL(string: "\(finalUrl)")
                var request = URLRequest(url: targetURL!)
                request.httpMethod = "POST"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                                     // request.setValue("CODEX@123",forHTTPHeaderField: "x-api-key")
                let values = ["latitude":"11.230236","longitude":"77.098375","distance":25] as [String : Any]
                 print(values)
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
                                                               
                              let businessListing = jsonResponse["businessListing"] as! [[String:Any]]
                            print(businessListing)
                                        
                            
                            for i in businessListing {
                                
                                let businessReferenceCode = i["businessReferenceCode"]
                                print(" BS\(businessReferenceCode)")
                                
                                
                                let addressReferenceCode = i["addressReferenceCode"]
                                                               print(" BS\(addressReferenceCode)")
                                
                                let defaults = UserDefaults.standard.setValue(businessReferenceCode, forKey: "businessReferenceCode")
                                                                print(defaults)
                                
                                
                                let defaultses = UserDefaults.standard.setValue(addressReferenceCode, forKey: "addressReferenceCode")
                                print(defaults)
                                
                                
                                
                                
                               let name = i["name"] as! String
                                self.nameArray.append(name)
                                print(self.nameArray)
                                
                                let distance = i["distance"] as! Double
                                self.distanceArray.append(distance)
                                 print(self.distanceArray)
                                
                                let area = i["area"] as! String
                                self.areaArray.append(area)
                                print(self.areaArray)
                                
    //                            let folderName = i["folderName"] as! String
    //                            self.imgfolderNameArray.append(folderName)
    //                            print(self.imgfolderNameArray)
                                
                                self.folderName1 = i["folderName"] as! String
                                self.bannerImage1 = i["bannerImage"] as! String
                                
                                
    //                            let bannerImage = i["bannerImage"] as! String
    //                            self.bannerImageArray.append(bannerImage)
    //                            print(self.bannerImageArray)
                                
                                self.imagefile = jsonResponse["fileSource"] as! String
                                
                                self.combinedImgArray = "\(self.imagefile!)\(self.folderName1!)/\(self.bannerImage1!)"
                                
                                print(self.combinedImgArray!)
                                self.total.append(self.combinedImgArray)
                              
                                
                                
                            }
                         
                        
                               
                          
                                 DispatchQueue.main.async{
                                    
                                    self.nearByTableViw.reloadData()
                                    self.listAllTablViw.reloadData()
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
           
    
    
    
    
    
    
    
    
    
        func cityList(){
                  
                 DispatchQueue.main.async{
                                             //self.hud.show(true)
                  LoaderManager.shared.showLoader()
                  
                        }
                  
                   let baseUrl = ApiUrl.shared.baseUrl
                   let query = "get-business-cities"
                   let finalUrl = "\(baseUrl)\(query)"
                          
                   let targetURL = URL(string: "\(finalUrl)")
                   var request = URLRequest(url: targetURL!)
                   request.httpMethod = "POST"
                   request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                                        // request.setValue("CODEX@123",forHTTPHeaderField: "x-api-key")
                   let values = [:] as [String : Any]
                    //print(values)
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
                                                                  
                                 let cities = jsonResponse["cities"] as! [[String:Any]]
                                
                                 print(cities)
                                           
                               
                                for i in cities {
                                    
                                    
                                    let city = i["city"] as! String
                                    self.citys.append(city)
                                    print(self.citys)
                                }
                            
                           
                                  
                             
                                    DispatchQueue.main.async{
                                       
                                       self.citytableViw.reloadData()
                                    //   self.listAllTablViw.reloadData()
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
              
    
    
    
    
    
    
    
        func nameList(){
                  
                 DispatchQueue.main.async{
                                             //self.hud.show(true)
                  LoaderManager.shared.showLoader()
                  
                        }
                  
                   let baseUrl = ApiUrl.shared.baseUrl
                   let query = "get-business-name"
                   let finalUrl = "\(baseUrl)\(query)"
                          
                   let targetURL = URL(string: "\(finalUrl)")
                   var request = URLRequest(url: targetURL!)
                   request.httpMethod = "POST"
                   request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                                        // request.setValue("CODEX@123",forHTTPHeaderField: "x-api-key")
                   let values = [:] as [String : Any]
                    //print(values)
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
                                                                  
                                 let manesAry = jsonResponse["names"] as! [[String:Any]]
                                
                                 print(manesAry)
                                           
                               
                                for i in manesAry {
                                    
                                    
                                    let namesFte = i["name"] as! String
                                    self.nameFiltr.append(namesFte)
                                    print(self.citys)
                                }
                            
                           
                                  
                             
                                    DispatchQueue.main.async{
                                       
                                       self.nameTableViw.reloadData()
                                    //   self.listAllTablViw.reloadData()
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
              
    
    
    
    
    
    
    
    
    
    @IBAction func byDistanceAction(_ sender: Any) {
           
           
           bydistanceSideViw.alpha = 1
           byDistancebckviw.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
           bynameSideViw.alpha = 0
           byNamebckviw.backgroundColor = #colorLiteral(red: 0.9215028286, green: 0.9216353297, blue: 0.9214738607, alpha: 1)
           bycitySideViw.alpha = 0
           bycityBackViw.backgroundColor = #colorLiteral(red: 0.9215028286, green: 0.9216353297, blue: 0.9214738607, alpha: 1)
           
           bydistanceTableViw.alpha = 1
           citytablebackViw.alpha = 0
           namebckViw.alpha = 0
           
           
           
           
       }
       
       
       
       @IBAction func byCityAction(_ sender: Any) {
           
           
           bycitySideViw.alpha = 1
           bycityBackViw.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
           bydistanceSideViw.alpha = 0
           byDistancebckviw.backgroundColor = #colorLiteral(red: 0.9215028286, green: 0.9216353297, blue: 0.9214738607, alpha: 1)
           bynameSideViw.alpha = 0
           byNamebckviw.backgroundColor = #colorLiteral(red: 0.9215028286, green: 0.9216353297, blue: 0.9214738607, alpha: 1)
           
           
           
           bydistanceTableViw.alpha = 0
           citytablebackViw.alpha = 1
           namebckViw.alpha = 0
           
         cityList()
        
       }
       
       
       
       
       @IBAction func byNameAction(_ sender: Any) {
           
         bydistanceSideViw.alpha = 0
         byDistancebckviw.backgroundColor = #colorLiteral(red: 0.9215028286, green: 0.9216353297, blue: 0.9214738607, alpha: 1)
         bycitySideViw.alpha = 0
         bycityBackViw.backgroundColor = #colorLiteral(red: 0.9215028286, green: 0.9216353297, blue: 0.9214738607, alpha: 1)
         bynameSideViw.alpha = 1
         byNamebckviw.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
           
           
           bydistanceTableViw.alpha = 0
           citytablebackViw.alpha = 0
           namebckViw.alpha = 1
           
        nameList()
        
       }
       
       
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
