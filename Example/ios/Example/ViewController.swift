//
//  ViewController.swift
//  Example
//
//  Created by Soumen Bhuin on 28/07/19.
//  Copyright © 2019 smbhuin. All rights reserved.
//

import UIKit
import SBValidator

class ViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var lblNameError: UILabel!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var lblEmailError: UILabel!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblPasswordError: UILabel!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var lblConfirmPasswordError: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnValidateAction(_ sender: Any) {
        let validator = Validator()
        validator.add(name: "Name", value: txtName.text, rules: [.required, .fullName])
        validator.add(name: "Email", value: txtEmail.text, rules: [.required, .email])
        validator.add(name: "Password", value: txtPassword.text, rules: [.required, .password()])
        validator.add(name: "Confirm Password", value: txtConfirmPassword.text, rules: [.required, .confirm(txtPassword.text)])
        
        let errors = validator.validateAll()
        if errors.count == 0 {
            let alert = UIAlertController(title: "YeH", message: "All is ok!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else {
            lblNameError.text = validator.validate(named: "Name").error?.description
            lblEmailError.text = validator.validate(named: "Email").error?.description
            lblPasswordError.text = validator.validate(named: "Password").error?.description
            lblConfirmPasswordError.text = validator.validate(named: "Confirm Password").error?.description
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txtName {
            txtEmail.becomeFirstResponder()
        }
        else if textField == txtEmail {
            txtPassword.becomeFirstResponder()
        }
        else if textField == txtPassword {
            txtConfirmPassword.becomeFirstResponder()
        }
        else {
            textField.resignFirstResponder()
        }
        return true;
    }
    
}

