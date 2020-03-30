//
//  LoaderManager.swift
//  HomeBuy
//
//  Created by admin on 9/28/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
//import SwiftyGif
import JGProgressHUD

class LoaderManager: UIView {
    
    
    static let shared = LoaderManager()
  
    
    lazy var transparentView: UIView = {
        let transparentView = UIView(frame: UIScreen.main.bounds)
        transparentView.backgroundColor = UIColor.clear //UIColor.black.withAlphaComponent(0.0)
        DispatchQueue.main.async {
            transparentView.isUserInteractionEnabled = false
        }
        return transparentView
    }()
    
    lazy var hud: JGProgressHUD = {
        let hud = JGProgressHUD(style: .dark)
        hud.vibrancyEnabled = true
        hud.cornerRadius = 10
        return hud
    }()
    
    /*
    lazy var gifImage: UIImageView = {
        let gif = UIImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        gif.contentMode = .scaleToFill
        gif.center = transparentView.center
        DispatchQueue.main.async {
            gif.isUserInteractionEnabled = false
        }
        let gifImg = UIImage(gifName: "Loader.gif")
        gif.setGifImage(gifImg)
        return gif
    }()
    */
    func showLoader() {
        DispatchQueue.main.async {
            /*
            self.addSubview(self.transparentView)
            //self.transparentView.addSubview(self.gifImage)
            self.transparentView.addSubview(self.spinner)
            self.transparentView.bringSubviewToFront(self.spinner)
            self.spinner.startAnimating()
            UIApplication.shared.keyWindow?.addSubview(self.transparentView)
 */
            UIApplication.shared.keyWindow?.addSubview(self.transparentView)
            self.hud.show(in: self.transparentView, animated: true)
        }
    }
    
    func hideLoader() {
        DispatchQueue.main.async {
            self.transparentView.isUserInteractionEnabled = true
//            self.spinner.stopAnimating()
            self.hud.dismiss(animated: true)
            self.transparentView.removeFromSuperview()
        }
    }
}
