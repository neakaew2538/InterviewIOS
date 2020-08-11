//
//  ViewController.swift
//  InterviewTestIOS
//
//  Created by SOP on 5/8/2563 BE.
//  Copyright © 2563 SOP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var bgLogin: UIView!
    @IBOutlet weak var bgUserName: UIView!
    @IBOutlet weak var bgPassword: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    
    lazy var viewModel: ViewModel = {
        return ViewModel()
    }()
    
    var getToken = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        self.navigationController?.navigationBar.isHidden = true
        setUpViewAndValue()
        
        viewModel.loginResponse = {
            if let response = $0 {
                if response.status == 200 {
                    print("--------Success-----!!!!!!!")
                    self.getToken = response.token ?? ""
                    
                    let vc = DashboardVC()
                    vc.tokenValue = response.token ?? ""
                    vc.getLoginResponseTest = response
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
        
        userNameTF.delegate = self
        passwordTF.delegate = self
        
    }
    
    func setUpViewAndValue() {
        userNameTF.placeholder = "username"
        passwordTF.placeholder = "password"
        
        bgLogin.layer.cornerRadius = 8
        bgLogin.layer.backgroundColor = UIColor.white.withAlphaComponent(0.5).cgColor
        
        bgUserName.layer.cornerRadius = 3
        bgUserName.layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor
        bgUserName.layer.borderWidth = 1
        
        bgPassword.layer.cornerRadius = 3
        bgPassword.layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor
        bgPassword.layer.borderWidth = 1
        
        profileImage.layer.cornerRadius = profileImage.frame.size.width/2
        profileImage.clipsToBounds = true
        profileImage.layer.borderWidth = 1
        profileImage.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @IBAction func loginButtonAction(_ sender: UIButton) {
        if userNameTF.text != "" && passwordTF.text != "" {
            viewModel.login(username: userNameTF.text!, password: passwordTF.text!)
        } else if userNameTF.text == "" && passwordTF.text != "" {
            alertMessage(message: "กรุณากรอก UserName")
        } else if userNameTF.text != "" && passwordTF.text == "" {
            alertMessage(message: "กรุณากรอก Password")
        } else if userNameTF.text == "" && passwordTF.text == "" {
            alertMessage(message: "กรุณากรอกข้อมูลให้ครบถ้วน")
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   
        textField.resignFirstResponder()
        return true
    }
}

extension UIViewController {
    func alertMessage(message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ตกลง", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
