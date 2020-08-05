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
    
    lazy var viewModel: ViewModel = {
        return ViewModel()
    }()
    
    var getToken = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.loginResponse = {
            if let response = $0 {
                if response.status == 200 {
                    print("--------Success-----!!!!!!!")
                    print("--------Success-----\(response.customers)")
                    print("--------Success-----\(response.token ?? "")")
                    self.getToken = response.token ?? ""
                    
                    let vc = DashboardVC()
                    vc.tokenValue = response.token ?? ""
                    vc.getLoginResponseTest = response
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
        
    }
    
    @IBAction func loginButtonAction(_ sender: UIButton) {
        if userNameTF.text != "" && passwordTF.text != "" {
            viewModel.login(username: userNameTF.text!, password: passwordTF.text!)
        }
    }
    
}

