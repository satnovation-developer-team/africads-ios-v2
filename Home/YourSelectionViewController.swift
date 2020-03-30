//
//  YourSelectionViewController.swift
//  Afric Ads
//
//  Created by apple on 13/03/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class YourSelectionViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
   
    
 var images = ["res","di","res","di","res","di","res","di"]
    
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var backviw: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
               backviw.layer.borderWidth = 0.5
               backviw.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
               nextBtn.layer.cornerRadius =  10
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! YourSelectionCollectionViewCell
          
          cell.img.image = UIImage(named: images[indexPath.item])
          //cell.name.text = details[indexPath.item]
        
        cell.img.layer.masksToBounds = true
        cell.img.layer.cornerRadius = 8
          return cell
        
        
       }
   
    
    
    @IBAction func nextBtnAction(_ sender: Any) {
        
        
        self.performSegue(withIdentifier: "details", sender: nil)
        
        
    }
    
    

    
    
    @IBAction func back(_ sender: Any) {
        
        
          self.navigationController?.popViewController(animated: true)
        
    }
    
    
    
}
