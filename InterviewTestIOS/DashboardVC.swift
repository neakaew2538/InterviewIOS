//
//  DashboardVC.swift
//  InterviewTestIOS
//
//  Created by SOP on 5/8/2563 BE.
//  Copyright © 2563 SOP. All rights reserved.
//

import Foundation
import UIKit

class DashboardVC: UIViewController {
    
    var tokenValue = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logoutButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
