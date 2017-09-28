//
//  ProfileVC.swift
//  Service24
//
//  Created by Захар on 27.09.17.
//  Copyright © 2017 Захар. All rights reserved.
//

import UIKit
import Alamofire

class ProfileVC: ViewController {
    
    var person = Person()

    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var nameField: TextFieldForProfile!
    @IBOutlet weak var surnameField: TextFieldForProfile!
    @IBOutlet weak var phoneNumberField: TextFieldForProfile!
    @IBOutlet weak var saveButton: ButtonWithBorder!
    
    @IBAction func saveButtonPressed(_ sender: ButtonWithBorder) {
        updateUserData()
        saveButton.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameField.fieldDelegate = self
        surnameField.fieldDelegate = self
        phoneNumberField.fieldDelegate = self
        
        DispatchQueue.global().async {
            self.getUserData()
        }
    }
    
    func getUserData() {
        let url = "/api/users/auth"
        let token = "Bearer " + person.token
        let headers: HTTPHeaders = ["Authorization": token]
        
        sendRequest(method: .get, url: url, parameters: nil, headers: headers) { (response) in
            
            print("============= GET USER DATA =============")
            print("Request: \(String(describing: response.request))")
            print("Response: \(String(describing: response.response))")
            print("Result: \(response.result)")
            
            if let json = response.result.value {
                let data = json as! NSDictionary
                
                let name = data.object(forKey: "name") as! String
                let email = data.object(forKey: "email") as! String
                
                self.setDataToFields(name: name, email: email)
            }
        }
    }
    
    func updateUserData() {
        let name = nameField.text!
        let surname = surnameField.text!
        let phone = phoneNumberField.text!
        let url = "/api/users/auth/update"
        let parameters: Parameters? = ["name": name, "surname": surname, "phone": phone]
        let headers: HTTPHeaders? = ["Authorization": "Bearer " + person.token]
        
        sendRequest(method: .put, url: url, parameters: parameters, headers: headers) { (response) in
            
            print("============= UPDATE USER DATA =============")
            print("Request: \(String(describing: response.request))")
            print("Response: \(String(describing: response.response))")
            print("Result: \(response.result)")
        }
    }
    
    func setDataToFields(name: String, email: String) {
        nameField.text = name
        self.email.text = email
    }
}

extension ProfileVC: CustomTextFieldForProfileDelegate {
    
    func showButton() {
        saveButton.isHidden = false
    }
}





