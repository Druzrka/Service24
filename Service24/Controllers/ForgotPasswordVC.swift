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
    @IBOutlet weak var successView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.textFieldDelegate = self
    }

    @IBAction func reestablishPasswordButtonTapped(sender: UIButton) {
        dissmisKeyboard()
        UIView.animate(withDuration: 5){
            self.successView.isHidden = false
        }
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        goBack()
    }
    
    @IBAction func enterButtonPressed(_ sender: ButtonWithBorder) {
        goBack()
    }
    
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}

extension ForgotPasswordVC: CustomTextFieldDelegate {
    
    func pushButton(height: CGFloat) {
        reestablishPasswordButtonBottomConstraint.constant = height
        self.view.layoutIfNeeded()
    }
    
    func goToNextField() {}
}
