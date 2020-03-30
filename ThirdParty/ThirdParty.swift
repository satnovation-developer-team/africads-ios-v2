//
//  ThirdParty.swift
//  Afric Ads
//
//  Created by apple on 20/02/20.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation
import UIKit


//bottom line for textfield

//extension String {
//    func localized(lang:String) ->String {
//
//        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
//        //let bundle = Bundle(path: path!)
//let bundle = Bundle(path: path!)
//        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
//    }
//}

extension String {
    func localized(withComment:String) -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: withComment)
    }
}
