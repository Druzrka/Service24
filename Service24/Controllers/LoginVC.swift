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
    
    var keyboardHeight: CGFloat = 0

    @IBOutlet weak var emailTextField: TextField!
    @IBOutlet weak var passwordTextFIeld: TextField!
    @IBOutlet weak var buttonBottomConstraint: NSLayoutConstraint!
    
    let person = Person()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.text = "vasya@gmail.com"
        passwordTextFIeld.text = "vasya111"
        
        navigationController?.navigationBar.isHidden = true
        
        emailTextField.textFieldDelegate = self
        passwordTextFIeld.textFieldDelegate = self
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
            
            sendRequest(method: .post, url: url, parameters: parameters, headers: nil, com: { (response) in
                
                print("============= LOGIN =============")
                print("Request: \(String(describing: response.request))")
                print("Response: \(String(describing: response.response))")
                print("Result: \(response.result)")
                
                let statusCode = response.response?.statusCode
                
                if statusCode == OK {
                    if let json = response.result.value {
                        let response = json as! NSDictionary
                        
                        if let token = response.object(forKey: "token")! as? String {
                            self.person.token = token
                            self.person.email = email
                            print("token: ", self.person.token)
                        }
                        //                        self.showAlert(withTitle: "Успешно")
                        self.goToNextVC()
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
    
    func goToNextVC() {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "CarListVC") as! CarListVC
        
        newViewController.person = person
        
        self.present(newViewController, animated: true, completion: nil)
    }
}

extension LoginVC: CustomTextFieldDelegate {
    
    func pushButton(height: CGFloat) {
        
        self.buttonBottomConstraint.constant = height
        self.view.layoutIfNeeded()
    }
    
    func goToNextField() {
        passwordTextFIeld.becomeFirstResponder()
    }
}





