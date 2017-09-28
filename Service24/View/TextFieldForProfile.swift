//
//  TextFieldForProfile.swift
//  Service24
//
//  Created by Захар on 28.09.17.
//  Copyright © 2017 Захар. All rights reserved.
//

import UIKit

protocol CustomTextFieldForProfileDelegate {
    func showButton()
}

class TextFieldForProfile: TextField {
    
    var fieldDelegate: CustomTextFieldForProfileDelegate!

    override func awakeFromNib() {
        addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        fieldDelegate.showButton()
    }
}
