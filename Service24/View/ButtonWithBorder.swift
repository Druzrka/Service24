//
//  ButtonWithBorder.swift
//  Service24
//
//  Created by Захар on 26.09.17.
//  Copyright © 2017 Захар. All rights reserved.
//

import UIKit

class ButtonWithBorder: UIButton {

    override func awakeFromNib() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = 8
    }
}
