//
//  ButtonStyling.swift
//  Laas
//
//  Created by admin on 12/10/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
import UIKit

class ViewStyling: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
       // self.layer.cornerRadius = self.frame.height/2
//        self.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
//        self.layer.borderWidth = 0.7
//        self.layer.shadowColor = UIColor.black.cgColor
//        self.layer.shadowOffset = CGSize(width: 0, height: 0)
//        self.layer.shadowRadius = 0
//        self.layer.shadowOpacity = 0
        
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 1.0
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowOpacity = 1.0
        self.layer.cornerRadius = 5
        
    }
}
