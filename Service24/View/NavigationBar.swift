//
//  NavigationBar.swift
//  Service24
//
//  Created by Захар on 13.09.17.
//  Copyright © 2017 Захар. All rights reserved.
//

import UIKit

class NavigationBar: UINavigationBar {
    

    
    override func awakeFromNib() {
        let height: CGFloat = 200
        let bounds = self.bounds
        frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height + height)
    }
}
