//
//  CreateAccountVC.swift
//  Service24
//
//  Created by Захар on 13.09.17.
//  Copyright © 2017 Захар. All rights reserved.
//

import UIKit
import Alamofire

class CreateAccountVC: ViewController {
    
    @IBOutlet weak var emailTextField: TextField!
    @IBOutlet weak var passwordTextField: TextField!
    @IBOutlet weak var registrationButtonBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.textFieldDelegate = self
        passwordTextField.textFieldDelegate = self
    }
    
    
    @IBAction func registrationButtonTapped(_ sender: UIButton) {
        
        let OK = 200
        let validationFailed = 401
        let url = "/api/register_user"
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        if textFieldsValuesAreValid(email: email, password: password) {
            
            let parameters: Parameters = ["email": email, "password": password]
            
            sendRequest(method: .post, url: url, parameters: parameters, headers: nil, com: { (response) in
                
                print("============= REGISTER USER =============")
                print("Request: \(String(describing: response.request))")
                print("Response: \(String(describing: response.response))")
                print("Result: \(response.result)")
                
                let statusCode = response.response?.statusCode
                
                if statusCode == OK {
                    self.showAlert(withTitle: "Успешно")
                    
                } else if statusCode == validationFailed {
                    self.showAlert(withTitle: "Не Успешно")
                }
            })
        }
        dissmisKeyboard()
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
    }
}

extension CreateAccountVC: CustomTextFieldDelegate {
    
    func pushButton(height: CGFloat) {
        registrationButtonBottomConstraint.constant = height
        self.view.layoutIfNeeded()
    }
    
    func goToNextField() {
        passwordTextField.becomeFirstResponder()
    }
}
