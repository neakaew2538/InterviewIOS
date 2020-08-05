//
//  DetailVC.swift
//  InterviewTestIOS
//
//  Created by SOP on 5/8/2563 BE.
//  Copyright © 2563 SOP. All rights reserved.
//

import Foundation
import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var labelSuccess: UILabel!
    
    var tokenValue = ""
    var getID = ""
    
    
    lazy var viewModel: ViewModel = {
        return ViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.customerDetailponse = {
            if let response = $0 {
                if response.status == 200 {
                    self.labelSuccess.text = "Call API Success !!!!!!"
                }
            }
        }
        viewModel.customerDetail(token: self.tokenValue, customerId: self.getID)
    }
}
