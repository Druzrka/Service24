//
//  ForgotPasswordVCViewController.swift
//  Service24
//
//  Created by Захар on 11.09.17.
//  Copyright © 2017 Захар. All rights reserved.
//

import UIKit

class ForgotPasswordVC: ViewController {

    @IBOutlet weak var emailTextField: TextField!
    @IBOutlet weak var reestablishPasswordButtonBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.textFieldDelegate = self
        
        emailTextField.returnKeyType = UIReturnKeyType.done
        
        closeKeyboardWhenTapped()
    }

    @IBAction func reestablishPasswordButtonTapped(sender: UIButton) {
        
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
    }
}

extension ForgotPasswordVC: CustomTextFieldDelegate {
    
    func pushButton(height: CGFloat) {
        reestablishPasswordButtonBottomConstraint.constant = height
    }
    
    func goToNextField() {}
}
