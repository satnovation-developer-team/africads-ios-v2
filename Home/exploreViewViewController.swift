//
//  exploreViewViewController.swift
//  Afric Ads
//
//  Created by apple on 13/03/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Alamofire
import Auk
import moa

class exploreViewViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
   
    
    @IBOutlet weak var selectroomBackViw: UIView!
    @IBOutlet weak var selectroomBtn: UIButton!
    
    
    
    
    @IBOutlet weak var scrViw: UIScrollView!
    
    
    
    
    
    var eminits = ["w","x","y","w","x","y"]
    var details = ["wifi","swim","res","wifi","swim","res"]
    var images2 = ["du1","du2","du3","du1","du3","du2","du3","du1"]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        selectroomBackViw.layer.borderWidth = 0.5
        selectroomBackViw.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        selectroomBtn.layer.cornerRadius =  10
        
        
    self.scrViw.auk.show(url: "du1")
    self.scrViw.auk.numberOfPages
    self.scrViw.auk.startAutoScroll(delaySeconds: 4)
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return eminits.count
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! exploreCollectionViewCell
        
        cell.img.image = UIImage(named: eminits[indexPath.row])
        cell.name.text = details[indexPath.item]
        return cell
        
       }
 
    @IBAction func backk(_ sender: Any) {
        
        
        
          self.navigationController?.popViewController(animated: true)
      // self.performSegue(withIdentifier: "nnextt", sender: nil)
        
      //  let vc = self.storyboard?.instantiateViewController(withIdentifier: "YourSelectionViewController") as! YourSelectionViewController
               
              // self.present(vc, animated: true, completion: nil)
        
    }
    
    
    
    
    
    @IBAction func selectRoomAction(_ sender: Any) {
        
        
      //  hotelBooking()
        
        
    self.performSegue(withIdentifier: "nnextt", sender: nil)
        
      //  let vc = self.storyboard?.instantiateViewController(withIdentifier: "YourSelectionViewController") as! YourSelectionViewController
               
              // self.present(vc, animated: true, completion: nil)
        
    }
    
    
    
    
    
    
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
