//
//  TextField.swift
//  Service24
//
//  Created by Захар on 31.08.17.
//  Copyright © 2017 Захар. All rights reserved.
//

import UIKit

protocol CustomTextFieldDelegate {
    
    func pushButton(height: CGFloat)
    func goToNextField()
}

@IBDesignable
class TextField: UITextField, UITextFieldDelegate {
    
    @IBInspectable var leftPadding: CGFloat = 0 {
        didSet {
            updatePadding()
        }
    }
    
    var textFieldDelegate: CustomTextFieldDelegate?
    
    override func didMoveToWindow() {
        
        textFieldDelegate?.pushButton(height: 0)
        
        self.delegate = self
        
        let borderColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.2)
        setBorder(cornerRadius: 5, borderWidth: 1, borderColor: borderColor.cgColor)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        NotificationCenter.default.addObserver(self, selector: #selector(TextField.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        let borderColor = color(from: "19B5FE").cgColor
        let placeHolderColor = color(from: "19B5FE")
        
        setPlaceHolderTextColor(color: placeHolderColor)
        setColorOfBorder(borderColor: borderColor)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let borderColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.2)
        let placeHolderColor = UIColor.lightGray
        
        setPlaceHolderTextColor(color: placeHolderColor)
        setColorOfBorder(borderColor: borderColor.cgColor)
        
        textFieldDelegate?.pushButton(height: 0)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let emailField = 0
        
        if textField.tag == emailField {
            textFieldDelegate?.goToNextField()
            
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    func setBorder(cornerRadius: CGFloat, borderWidth: CGFloat, borderColor: CGColor) {
        
        setColorOfBorder(borderColor: borderColor)
        layer.borderWidth = borderWidth
        layer.cornerRadius = cornerRadius
    }
    
    func setColorOfBorder(borderColor: CGColor) {
        layer.borderColor = borderColor
    }
    
    func setPlaceHolderTextColor(color: UIColor) {
        attributedPlaceholder = NSAttributedString(string: placeholder!, attributes: [NSForegroundColorAttributeName : color])
    }
    
    func updatePadding() {
        
        leftViewMode = .always
        let view = UIView(frame: CGRect(x: leftPadding, y: 0, width: 5, height: 20))
            
        leftView = view
    }
    
    func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            textFieldDelegate?.pushButton(height: keyboardHeight)
        }
    }
}
