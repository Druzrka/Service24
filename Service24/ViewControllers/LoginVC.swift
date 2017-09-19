//
//  ViewController.swift
//  Service24
//
//  Created by Захар on 29.08.17.
//  Copyright © 2017 Захар. All rights reserved.
//

import UIKit
import Alamofire

class LoginVC: ViewController {
    
    let basisURL = "http://95.213.195.115"
    
    var keyboardHeight: CGFloat = 0

    @IBOutlet weak var emailTextField: TextField!
    @IBOutlet weak var passwordTextFIeld: TextField!
    @IBOutlet weak var buttonBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.text = "vasya@gmail.com"
        passwordTextFIeld.text = "vasya111"
        
        navigationController?.navigationBar.isHidden = true
        
        emailTextField.textFieldDelegate = self
        passwordTextFIeld.textFieldDelegate = self
        
        closeKeyboardWhenTapped()
        
        emailTextField.returnKeyType = UIReturnKeyType.next
        passwordTextFIeld.returnKeyType = UIReturnKeyType.done
    }
    
    @IBAction func forgotPasswordButtonTapped(_ sender: UIButton) {
        
        dissmisKeyboard()
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordID")
        
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func createAccountButtonTapped(_ sender: UIButton) {
        
        dissmisKeyboard()
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "CreateAccountVC")
        
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        
        let email = emailTextField.text!
        let password = passwordTextFIeld.text!
        
        if textFieldsValuesAreValid(email: email, password: password) {
            
            let OK = 200
            let invalidCredentials = 401
            let url = "/api/authenticate"
            let parameters: Parameters = ["email": email, "password": password]
        
            Alamofire.request(basisURL + url, method: .post, parameters: parameters).responseJSON(completionHandler: { response in
                print("Request: \(String(describing: response.request))")
                print("Response: \(String(describing: response.response))")
                print("Result: \(response.result)")
                
                let statusCode = response.response?.statusCode
                
                if statusCode == OK {
                    if let json = response.result.value {
                        let response = json as! NSDictionary
                        print(response.object(forKey: "token")!)
                        self.showAlert(withTitle: "Успешно")
                    }
                    
                } else if statusCode == invalidCredentials {
                    self.showAlert(withTitle: "Неправельный пароль или эл. адрес")
                    
                } else {
                    self.showAlert(withTitle: "Ошыбка")
                }
            })
        }
        dissmisKeyboard()
    }
}

extension LoginVC: CustomTextFieldDelegate {
    
    func pushButton(height: CGFloat) {
        buttonBottomConstraint.constant = height
    }
    
    func goToNextField() {
        passwordTextFIeld.becomeFirstResponder()
    }
}





