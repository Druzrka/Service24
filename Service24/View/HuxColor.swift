//
//  HuxColor.swift
//  Service24
//
//  Created by Захар on 31.08.17.
//  Copyright © 2017 Захар. All rights reserved.
//

import UIKit

func color(from hexString : String) -> UIColor {
    if let rgbValue = UInt(hexString, radix: 16) {
        let red   =  CGFloat((rgbValue >> 16) & 0xff) / 255
        let green =  CGFloat((rgbValue >>  8) & 0xff) / 255
        let blue  =  CGFloat((rgbValue      ) & 0xff) / 255
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    } else {
        return UIColor.black
    }
}
