//
//  HotelDetailedViewViewController.swift
//  Afric Ads
//
//  Created by apple on 12/03/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Alamofire
import Auk
import moa
import Kingfisher


struct Service {
    var blockLists = [String]()
    var referalCodes = [String]()
}

class HotelDetailedViewViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate{
    
    
    
    
    
    @IBOutlet weak var scrViw: UIScrollView!
    
    
    
    
    
    @IBOutlet weak var recommdCollectionViw: UICollectionView!
    
    
    
    @IBOutlet weak var heightCnstrint: NSLayoutConstraint!
    @IBOutlet weak var callHeight: NSLayoutConstraint!
    @IBOutlet weak var txtViw: UITextView!
    @IBOutlet weak var btn: UIButton!
    
    var checkClick = true
    var checClick = true
    
    
    
    
    
    var block1Img:String!
    
    var  blockNameArray = [String]()
    var  blockImageList = [String]()
    var servicenameArray = [String]()
    
    var s1 = [String]()
    var s2 = [String]()
    var s3 = [String]()
    var s4 = [String]()
    
    var recomendedFileSource:String!
    var extendBannrImg:String!
    var combinedImg:String!
    var fullImage = [String]()
    var recommenNAmeArray = [String()]
    
    @IBOutlet weak var roomTypeCollectionViw: UICollectionView!
    @IBOutlet weak var roomtypeTittle: UILabel!
    
    @IBOutlet weak var roomType2CollectionViw: UICollectionView!
    @IBOutlet weak var roomType2Labl: UILabel!
    
    
    @IBOutlet weak var roomType3CollectionViw: UICollectionView!
    @IBOutlet weak var roomType3Labl: UILabel!
    
    
    @IBOutlet weak var roomType4CollectionViw: UICollectionView!
    @IBOutlet weak var roomType4Labl: UILabel!
    
    
    
    @IBOutlet weak var eminitiesCollectionViw: UICollectionView!
    
    @IBOutlet weak var exploreCollectioViwCell: UICollectionView!
    
    
    
    
    
    
    
    @IBOutlet weak var hotelNameField: UILabel!
    @IBOutlet weak var addressfield: UITextView!
    @IBOutlet weak var timeFiedl: UILabel!
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var callucBtn: UIButton!
    
    var bannerImage:String!
    
    var bannerImageArray = [String]()
    
    var eminits = ["w","x","y","w","x","y"]
    var details = ["wifi","swim","res","wifi","swim","res"]
    
    
    
    var images    = ["du1","du2","du3","du1","du3","du2","du3","du1"]
    var itemNames = ["Duplex","Duplex","Duplex","Duplex","Duplex","Duplex","Duplex","Duplex"]
    var roomtypes = ["Room1","Room2","Room3","Room1","Room2","Room3"]
    var roomtypes1 = ["Room1A","Room2B"]
    var roomtypes22 = ["Room3A","Room3B"]
    var rms = ["Party Hall"]
    
    
    var images2 = ["du1","du2","du3","du1","du3","du2","du3","du1"]
    var itemNames2 = ["Sports","Restaurant","Dining","Sports","Dining","Sports","Dining","Sports"]
    var roomtypes2 = ["Explore",""]
    
    
    var pOneBlockList = [String]()
    var pReferalCods = [String]()
    var pServices = [Service]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrViw.delegate = self
        
        nearByList()
    }
    
    
    
    
    
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == roomTypeCollectionViw{
            
           return s1.count
        }else if collectionView == roomType2CollectionViw{
            
            
           return s2.count
        }else if  collectionView == roomType3CollectionViw{
         
         
        return s3.count
        }else if  collectionView == roomType4CollectionViw {
            
            
           return s4.count
        }else if collectionView == eminitiesCollectionViw {
            
            
            
            return  details.count
        }else{
            
            
            
            
            
          return  fullImage.count
        }
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
         if collectionView == roomTypeCollectionViw{
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! RoomType1CollectionViewCell
        
        cell.img.roundCorners([.topLeft, .topRight], radius: 10)
        
        let url = URL(string: "\(s1[indexPath.item])")
        print("Image url to display in table view is:",url)
        
        cell.bckViw.layer.cornerRadius = 10;
        cell.bckViw.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        cell.bckViw.layer.borderWidth = 0.5
        
        cell.img.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: nil, completionHandler: { image, error, cacheType, imageURL in
            if (image != nil){
                cell.img.image = image
            }
            else {
                cell.img.image = UIImage.init(named: "placeHolder")
            }
        })
        
       cell.lbl.text = roomtypes[indexPath.item]
        return cell
        
         }else if collectionView == roomType2CollectionViw {
            
            
            
                  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! RoomType1CollectionViewCell
                  
                  cell.cell2Img.roundCorners([.topLeft, .topRight], radius: 10)
                  
                  let url = URL(string: "\(s2[indexPath.item])")
                  print("Image url to display in table view is:",url)
                  
                  cell.cell2bckViw.layer.cornerRadius = 10;
                  cell.cell2bckViw.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                  cell.cell2bckViw.layer.borderWidth = 0.5
                  
                  cell.cell2Img.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: nil, completionHandler: { image, error, cacheType, imageURL in
                      if (image != nil){
                          cell.cell2Img.image = image
                      }
                      else {
                          cell.cell2Img.image = UIImage.init(named: "placeHolder")
                      }
                  })
                  
                  
                 //cell.img.image = UIImage(named: eminits[indexPath.row])
                cell.cell2lbl.text = roomtypes1[indexPath.item]
            
            
            
            
                  return cell
            
            
        }else if collectionView == roomType3CollectionViw {
            
            
            
                  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath) as! RoomType1CollectionViewCell
                  
                  cell.cell3Img.roundCorners([.topLeft, .topRight], radius: 10)
                  
                  let url = URL(string: "\(s3[indexPath.item])")
                  print("Image url to display in table view is:",url)
                  
                  cell.cell3bckViw.layer.cornerRadius = 10;
                  cell.cell3bckViw.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                  cell.cell3bckViw.layer.borderWidth = 0.5
                  
                  cell.cell3Img.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: nil, completionHandler: { image, error, cacheType, imageURL in
                      if (image != nil){
                          cell.cell3Img.image = image
                      }
                      else {
                          cell.cell3Img.image = UIImage.init(named: "placeHolder")
                      }
                  })
                  
                  
                 //cell.img.image = UIImage(named: eminits[indexPath.row])
                cell.cell3lbl.text = roomtypes22[indexPath.item]
            
                  return cell
            
            
         }else if collectionView == roomType4CollectionViw  {
            
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell4", for: indexPath) as! RoomType1CollectionViewCell
                             
                             cell.cell4Img.roundCorners([.topLeft, .topRight], radius: 10)
                             
                             let url = URL(string: "\(s4[indexPath.item])")
                             print("Image url to display in table view is:",url)
                             
                             cell.cell4bckViw.layer.cornerRadius = 10;
                             cell.cell4bckViw.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                             cell.cell4bckViw.layer.borderWidth = 0.5
                             
                             cell.cell4Img.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: nil, completionHandler: { image, error, cacheType, imageURL in
                                 if (image != nil){
                                     cell.cell4Img.image = image
                                 }
                                 else {
                                     cell.cell4Img.image = UIImage.init(named: "placeHolder")
                                 }
                             })
                             
                             
                            //cell.img.image = UIImage(named: eminits[indexPath.row])
                          cell.cell4lbl.text = rms[indexPath.item]
                             return cell
            
            
            
         }else if collectionView == eminitiesCollectionViw {
            
            
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! eminitiesCollectionViewCell
            
            cell.img.image = UIImage(named: "\(eminits[indexPath.item])")
             cell.lbl.text = details[indexPath.item]
            
            return cell
            
            
         }else{
            
            
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! RecommenedCollectionViewCell
                       
                cell.img.roundCorners([.topLeft, .topRight], radius: 10)
                                               
                                               let url = URL(string: "\(fullImage[indexPath.item])")
                                               print("Image url to display in table view is:",url)
                                               
                                               cell.viw.layer.cornerRadius = 10;
                                               cell.viw.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                                               cell.viw.layer.borderWidth = 0.5
                                               
                                               cell.img.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: nil, completionHandler: { image, error, cacheType, imageURL in
                                                   if (image != nil){
                                                       cell.img.image = image
                                                   }
                                                   else {
                                                       cell.img.image = UIImage.init(named: "placeHolder")
                                                   }
                                               })
                                               
                                               
                                              //cell.img.image = UIImage(named: eminits[indexPath.row])
                                            cell.lbl.text = recommenNAmeArray[indexPath.item]
                                               return cell
            
        }
        
    }
    
    
    
    func selectedItem() {
        // here you can perform segue
        performSegue(withIdentifier: "next", sender: self)
    }
    
    
    
    
    
    
    
    
    
    @IBAction func btnAction(_ sender: Any) {
        
        if(checkClick == true) {
            btn.setImage(#imageLiteral(resourceName: "down"), for: .normal)
            heightCnstrint.constant = 40
            txtViw.alpha = 0
            // passwordField.isSecureTextEntry = false
        } else {
            btn.setImage(#imageLiteral(resourceName: "up") ,for: .normal)
            heightCnstrint.constant = 167
            txtViw.alpha = 1
            //passwordField.isSecureTextEntry = true
        }
        
        checkClick = !checkClick
        
        
        
    }
    
    
    
    
    
    @IBAction func callusBtn(_ sender: Any) {
        
        
        if(checClick == true) {
            callucBtn.setImage(#imageLiteral(resourceName: "down"), for: .normal)
            callHeight.constant = 40
            lbl1.alpha = 0
            lbl2.alpha = 0
            lbl3.alpha = 0
            // passwordField.isSecureTextEntry = false
        } else {
            callucBtn.setImage(#imageLiteral(resourceName: "up") ,for: .normal)
            callHeight.constant = 167
            
            lbl1.alpha = 1
            lbl2.alpha = 1
            lbl3.alpha = 1
            //passwordField.isSecureTextEntry = true
        }
        
        checClick = !checClick
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    func nearByList(){
        
        DispatchQueue.main.async{
            //self.hud.show(true)
            LoaderManager.shared.showLoader()
            
        }
        
        let baseUrl = ApiUrl.shared.baseUrl
        let query = "particular-detail-view-business-listing"
        let finalUrl = "\(baseUrl)\(query)"
        
        let targetURL = URL(string: "\(finalUrl)")
        var request = URLRequest(url: targetURL!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        // request.setValue("CODEX@123",forHTTPHeaderField: "x-api-key")
        let values = ["businessReferenceCode":UserDefaults.standard.string(forKey:"businessReferenceCode"),"addressReferenceCode":UserDefaults.standard.string(forKey:"addressReferenceCode"),"latitude":11.230236,"longitude":77.098375] as [String : Any]
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
                
                //print(">>NearByList>\(jsonResponse)")
                
                //Yashwanth
                
                var imageUrlsDict = [String:Any]()
                var urls = [String]()
                
                if (jsonResponse["businessListing"] as? [[String:Any]]) != nil
                {
                    let BusinessListing = jsonResponse["businessListing"] as! [[String:Any]]
                    
                    if (BusinessListing[0]["serviceList"] as? [[String:Any]]) != nil
                    {
                        let ServiceList = BusinessListing[0]["serviceList"] as! [[String:Any]]
                        self.pServices.removeAll()
                        for i in 0...(ServiceList.count - 1)
                        {
                            let oneService = ServiceList[i]
                            
                            if (oneService["blockList"] as? [[String:Any]]) != nil
                            {
                                let oneBlockListData = oneService["blockList"] as! [[String:Any]]
                                self.pOneBlockList.removeAll()
                                self.pReferalCods.removeAll()
                                for oneList in oneBlockListData
                                {
                                    if (oneList["blockImageList"] as? [[String:Any]]) != nil
                                    {
                                        let oneListData = oneList["blockImageList"] as! [[String:Any]]
                                        let imageUrl = oneListData[0]["images"] as? String ?? "No image url found."
                                        let referalCode = oneListData[0]["referenceCode"] as? String ?? "No referal code found."
                                        self.pOneBlockList.append(imageUrl)
                                        self.pReferalCods.append(referalCode)
                                        print("Image url is:",imageUrl)
                                        urls.append(imageUrl)
                                    }
                                    else
                                    {
                                        print("Unalbe to get blockImageList .")
                                    }
                                }
                                self.pServices.append(Service(blockLists: self.pOneBlockList,referalCodes: self.pReferalCods))
                            }
                            else
                            {
                                print("Unalbe to get block list.")
                            }
                        }
                    }
                    else
                    {
                        print("Unalbe to getbusiness listing.")
                    }
                }
                else
                {
                    print("Unable to get businessListing.")
                }
                
                for i in 0...(self.pServices.count - 1)
                {
                    let firstService = self.pServices[i]
                    
                    print("Service \(i) Images: ",firstService.blockLists)
                    print("Service \(i) Referal Codes: ",firstService.referalCodes)
                }
                
                
                    
                 self.s1 = self.pServices[0].blockLists
                 self.s2 = self.pServices[1].blockLists
                 self.s3 = self.pServices[2].blockLists
                 self.s4 = self.pServices[3].blockLists
                    
                print("S4 >>>",self.s4)
                    //
                    
                    
                    
                    
                    
                    
                    
//
                   let businessListing = jsonResponse["bannnerImageList"] as! [[String:Any]]
                   print(businessListing)
//
//
                    for i in businessListing {

                        self.bannerImage = i["bannerImage"]as? String
                        //self.bannerImageArray.append(bannerImage)
                        print(">>>>>\(self.bannerImage)")


                        self.scrViw.auk.show(url: self.bannerImage)
                        self.scrViw.auk.numberOfPages
                        self.scrViw.auk.startAutoScroll(delaySeconds: 4)


                    }

                 
                let recommendedList = jsonResponse["recommendedList"] as! [[String:Any]]
                
                print(">>>\(recommendedList)")
                
                
                for i in recommendedList{
                    
                    
                    let name = recommendedList[0]["name"] as! String
                    self.recommenNAmeArray.append(name)
                    
                   self.recomendedFileSource = recommendedList[0]["fileSource"] as! String
                    self.extendBannrImg = recommendedList[0]["bannerImage"] as! String
                    self.combinedImg = "\(self.recomendedFileSource!)/\(self.extendBannrImg!)"
                    print(" >>>>>F\(self.recomendedFileSource)")
                    print(" >>>>>B\(self.extendBannrImg)")
                    print(" >>>>>C\(self.combinedImg)")
                    self.fullImage.append(self.combinedImg)
                    
                }
                
                
                let addressCode = jsonResponse["businessListing"] as! [[String:Any]]
                
                var ad = addressCode[0]["addressReferenceCode"] as! String
                print(">>>>\(ad)")
                
                //let name = ad[0]["name"] as! String
              //  self.hotelNameField.text! = name
                
                let defaults = UserDefaults.standard.setValue(ad, forKey: "AddressreferenceCode")
                print(defaults)
                
                let  srvceList = addressCode[0]["serviceList"] as! [[String:Any]]
                
                 print(srvceList)
                
                var srvc = srvceList[0]["referenceCode"] as! String
               
                print("SRVCRCode\(srvc)")
               
                let defaultss = UserDefaults.standard.setValue(srvc, forKey: "ServicereferenceCode")
                print(defaults)
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                //
                
                
                
                
                
                
                if (jsonResponse["businessListing"] as? [[String:Any]]) != nil{
                    
                    
                    
                     let BusinessListing1 = jsonResponse["businessListing"] as! [[String:Any]]
                    
                    
                    
                    if (BusinessListing1[0]["exploreList"] as? [[String:Any]]) != nil
                                       {
                    
                                        
                   let exploreList = BusinessListing1[0]["exploreList"] as! [[String:Any]]
                                        
                            
                          let exploreImageList = exploreList[0]["exploreImageList"] as! [[String:Any]]
                                
                               
                               let imageUrl = exploreImageList[0]["images"] as? String ?? "No image url found."
                                        
                                         
                    }else{
                        
                         print("Unable to fetch exploreList")
                        
                    }
                    
                }else {
                    
                    
                    print("unable to fetch BusinessListing")
                    
                    
                    
                }
                
                
                
                
                
                
                
                    let businessListing1 = jsonResponse["businessListing"] as! [[String:Any]]
                    print(businessListing1)

                    let name = businessListing1[0]["name"] as! String
                    self.hotelNameField.text! = name
                    let address = businessListing1[0]["address"] as! String
                    self.addressfield.text! = address
                    let openningClosingDay = businessListing1[0]["openningClosingDay"] as! String
                    self.timeFiedl.text! = openningClosingDay
//
                    let serviceList = businessListing1[0]["serviceList"] as! [[String:Any]]
                    print("ServiceLst\(serviceList)")
                    let servicename = serviceList[0]["serviceName"] as! String
                   print(servicename)
                    let blockList = serviceList[0]["blockList"] as! [[String:Any]]
                    print(blockList)
                    let blockName = blockList[0]["blockName"] as! String
                    print(blockName)
                    let blockImageList = blockList[0]["blockImageList"] as! [[String:Any]]
                    print(blockImageList)
                    self.block1Img = blockImageList[0]["images"] as! String
                    print(self.block1Img)

//
//
//
//
//
//
 //                   self.roomtypeTittle.text! = servicename
//                    // For BlockName
//
//
//                    // self.blockNameArray.removeAll()
//
//                    for j in blockList{
//
//                        self.blockNameArray.removeAll()
//
//                        let blockName = j["blockName"]
//                        self.blockNameArray.append(blockName as! String)
//                        print(self.blockNameArray)
//
//                    }

//
//                    for k in blockImageList {
//
//                        //   For BlockImg
//
//
//                        let block1Imgg  = k["images"] as! String
//
//                        self.blockImageList.append(block1Imgg as! String)
//                        print(self.blockImageList)
//
//
//                    }
//
//
//
//                    // for ServiceList Img
//
//
//                    for l in serviceList {
//
//                        let servicename = l["serviceName"] as! String
//                        self.servicenameArray.append(servicename)
//                        print(self.servicenameArray)
//
//                    }
//
//
//
//
//
//
//
                    DispatchQueue.main.async{

                        self.roomTypeCollectionViw.reloadData()
                        self.roomType2CollectionViw.reloadData()
                         self.roomType3CollectionViw.reloadData()
                         self.roomType4CollectionViw.reloadData()
                        self.recommdCollectionViw.reloadData()
                        //  self.roomType2CollectionViw.reloadData()

                        //self.listAllTableViw.reloadData()
                    }
//
//
                    
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
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "next", sender: nil)
        
    }
    
    
    
    
    
    
    
}


extension UIImageView {
    public func roundedCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
    }
}
