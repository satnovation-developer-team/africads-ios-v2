//
//  SearchSuggegtionsViewController.swift
//  Afric Ads
//
//  Created by apple on 03/03/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class SearchSuggegtionsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    
    @IBOutlet weak var bottomShdw: UIView!
    @IBOutlet weak var nearByBtn: UIButton!
    @IBOutlet weak var listAllBtn: UIButton!
    @IBOutlet weak var btnbackViw: UIView!
    
    
    @IBOutlet weak var bydistanceTableViw: UITableView!
    @IBOutlet weak var citytableViw: UITableView!
    @IBOutlet weak var citytablebackViw: UIView!
    @IBOutlet weak var nameTableViw: UITableView!
    @IBOutlet weak var namebckViw: UIView!
    @IBOutlet weak var applyBtn: UIButton!
    
    
    
    
    
    @IBOutlet weak var bydistanceSideViw: UIView!
    @IBOutlet weak var byDistancebckviw: UIView!
    
    
    
    @IBOutlet weak var bycitySideViw: UIView!
    @IBOutlet weak var bycityBackViw: UIView!
    
    
    
    @IBOutlet weak var bynameSideViw: UIView!
    @IBOutlet weak var byNamebckviw: UIView!
    
    
    @IBOutlet weak var nearbyTablviw: UITableView!
    @IBOutlet weak var filterViw: UIView!
    @IBOutlet weak var listAllTableViw: UITableView!
    @IBOutlet weak var nearByBackviw: UIView!
    @IBOutlet weak var filtrViw: UIView!
    
    
    
    var distnceArray = ["0 to 30Km","30 to 60Km","60 to 90Km","0 to 30Km"]
    var cityeArray = ["Somalia","Hergesia","Berbera","Merca"]
    var nameeArray = ["Archana Mall","Central","Cosmos Mall","DLF Mall"]
    
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        nearByBtn.layer.cornerRadius = 8
        nearByBtn.layer.borderWidth = 1
        nearByBtn.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        nearByBtn.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        btnbackViw.layer.cornerRadius = 8
        
       bottomShdw.layer.shadowColor = UIColor.lightGray.cgColor
        bottomShdw.layer.masksToBounds = false
        bottomShdw.layer.shadowOffset = CGSize(width: 0.0 , height: 0.5)
        bottomShdw.layer.shadowOpacity = 0.5
        bottomShdw.layer.shadowRadius = 0.5
        
        filterViw.layer.cornerRadius = 10
        filterViw.layer.borderWidth = 1
        filterViw.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
      //  filtrViw.roundCorners([.topLeft, .topRight], radius: 20)

        
        filtrViw.clipsToBounds = true
        filtrViw.layer.cornerRadius = 15
        filtrViw.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        applyBtn.layer.cornerRadius = 10
      
        
       nearByList()
       
        
    }
    

    @IBAction func nearbyAction(_ sender: Any) {
        
        listAllBtn.layer.cornerRadius = 8
        listAllBtn.layer.borderWidth = 1
        listAllBtn.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        listAllBtn.layer.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        
        nearByBtn.layer.cornerRadius = 8
        nearByBtn.layer.borderWidth = 1
        nearByBtn.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        nearByBtn.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        nearByBackviw.alpha = 0
        nearbyTablviw.alpha = 1
        
    }
    
    
    
    @IBAction func listAllAction(_ sender: Any) {
        
        listAllBtn.layer.cornerRadius = 8
        listAllBtn.layer.borderWidth = 1
        listAllBtn.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        listAllBtn.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        nearByBtn.layer.cornerRadius = 8
        nearByBtn.layer.borderWidth = 1
        nearByBtn.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        nearByBtn.layer.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        
        nearByBackviw.alpha = 1
        nearbyTablviw.alpha = 0
        
    }
    
    
    
    @IBAction func filterCloseButton(_ sender: Any) {
        
        filtrViw.alpha = 0
        
    }
    
    
    @IBAction func filterBtnAction(_ sender: Any) {
        
         filtrViw.alpha = 1
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == nearbyTablviw {
            
            return nameArray.count
        }else if tableView == listAllTableViw  {
           
            return nameArray.count
        }else  if tableView == bydistanceTableViw  {
            
            
            
          return distnceArray.count
        }else  if tableView == citytableViw{
            
            
            
            return cityeArray.count
        }else{
            
            
            
         return nameeArray.count
        }
        
         }
         
         func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
             
            if tableView == nearbyTablviw {
                
                let cell1  = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath as IndexPath) as! NearByTableViewCell
                         cell1.selectionStyle = .none
                         
                cell1.nearByMallField.text = nameArray[indexPath.row]
                cell1.nearByKilomtrField.text = "\(distanceArray[indexPath.row])KM"
                cell1.nearByRoadField.text = areaArray[indexPath.row]
                
               // cell1.nearbyImg.image = UIImage(named:total[indexPath.row])
                         
                let url = URL(string: "\(total[indexPath.row])")
                print("Image url to display in table view is:",url)
               // cell1.nearbyImg.image.kf.setImage(with: url)
              
                
                cell1.nearbyImg.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: nil, completionHandler: { image, error, cacheType, imageURL in
                if (image != nil){
                    cell1.nearbyImg.image = image
                }
                else {
                    cell1.nearbyImg.image = UIImage.init(named: "user")
                }
                })
                
                
                     
                
                         return cell1
                
            }else if tableView == listAllTableViw  {
                
                
                let cell1  = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath as IndexPath) as! ListAllTableViewCell
                                        cell1.selectionStyle = .none
                                        
                
                
                                        cell1.mallNameField.text = nameArray[indexPath.row]
                                        cell1.kiloMtrField.text = "\(distanceArray[indexPath.row])KM"
                                        cell1.addressField.text = areaArray[indexPath.row]
                                        //cell1.snoField.text = list[indexPath.row]
                                        //cell1.nameField.text = nameArray[indexPath.row]
                                        
                
                       let url = URL(string: "\(total[indexPath.row])")
                               print("Image url to display in table view is:",url)
                              // cell1.nearbyImg.image.kf.setImage(with: url)
                             
                               
                               cell1.listAllimg.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: nil, completionHandler: { image, error, cacheType, imageURL in
                               if (image != nil){
                                   cell1.listAllimg.image = image
                               }
                               else {
                                   cell1.listAllimg.image = UIImage.init(named: "user")
                               }
                               })
                
                
                
                
                
                
                                        
                                        return cell1
                
                
                
            }else  if tableView == bydistanceTableViw {
                
                
                
                let cell1  = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath as IndexPath) as! byDistanceTableViewCell
                cell1.selectionStyle = .none
                
                
                
                
                cell1.byDistancenamefield.text = distnceArray[indexPath.row]
                
                
                
                
                
                
                
                
                
                
                
                
                return cell1
                
                
            }else if tableView == citytableViw {
                
                let cell1  = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath as IndexPath) as! bycityTableViewCell
                              cell1.selectionStyle = .none
                              
                              
                              
                              
                              cell1.cityNamefield.text = cityeArray[indexPath.row]
                              
                              
                              
                              return cell1
                
                
                
                
                
            }else {
                
                
                
                let cell1  = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath as IndexPath) as! bynameTableViewCell
                                             cell1.selectionStyle = .none
                                             
                                             
                                             
                                             
                                             cell1.byNamefield.text = nameeArray[indexPath.row]
                                             
                                             
                                             
                                             return cell1
                
                
                
                
                
            }
            
         
         }
       
       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if tableView == nearbyTablviw {
            
            
            return 134
        }else if tableView == listAllTableViw {
          
            
            return 134
        }else  if tableView == bydistanceTableViw{
            
            
            
            return 50
        }else if tableView == citytableViw{
            
            
            
            return 50
        }else {
            
            
            
             return 50
        }
        
           
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
                                
                                self.nearbyTablviw.reloadData()
                                self.listAllTableViw.reloadData()
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
        
    }
    
    
    
    
    @IBAction func applyBtnAction(_ sender: Any) {
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
}



extension UIView {

    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         self.layer.mask = mask
    }

}
