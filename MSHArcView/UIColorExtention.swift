//
//  UIColorExtensions.swift
//  Worklist
//
//  Created by Sharma, Manu - Manu on 7/6/15.
//  Copyright (c) 2015 Manu Sharma. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        let redf: CGFloat = max(0, min(255, CGFloat(red)))
        let greenf: CGFloat = max(0, min(255, CGFloat(green)))
        let bluef: CGFloat = max(0, min(255, CGFloat(blue)))
        
        self.init(red: redf / 255.0, green: greenf / 255.0, blue: bluef / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}
