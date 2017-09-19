//
//  ViewController.swift
//  Service24
//
//  Created by Захар on 18.09.17.
//  Copyright © 2017 Захар. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        closeKeyboardWhenTapped()
    }

    
    func closeKeyboardWhenTapped() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dissmisKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    func dissmisKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldsValuesAreValid(email: String, password: String) -> Bool {
        if email.isEmpty || password.isEmpty {
            showAlert(withTitle: "Вы не заполнили поля")
            return false
            
        } else if !isValidEmailAddress(emailAddressString: email) {
            showAlert(withTitle: "Не коректный адрес эл. почты")
            return false
            
        } else if password.characters.count < 6 {
            showAlert(withTitle: "Пароль должен содержать минимум 6 символов")
            return false
        }
        
        return true
    }
    
    func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        return  returnValue
    }
    
    func showAlert(withTitle title: String) {
        
        let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
}
