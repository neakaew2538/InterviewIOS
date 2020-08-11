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
    @IBOutlet weak var gradeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    var tokenValue = ""
    var getID = ""
    var getDataValueResponse: dataValueResponse?
    
    
    lazy var viewModel: ViewModel = {
        return ViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        
        viewModel.customerDetailponse = {
            if let response = $0 {
                if response.status == 200 {
                    self.getDataValueResponse = response.data
                    self.labelSuccess.text = "Call API Success !!!!!!"
                    self.setUpValue()
                }
            }
        }
        viewModel.customerDetail(token: self.tokenValue, customerId: self.getID)
    }
    
    func setUpView() {
        bgView.layer.cornerRadius = 6
        bgView.layer.borderWidth = 1
        bgView.layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor
    }
    
    func setUpValue() {
        gradeLabel.text = "Grade : \(self.getDataValueResponse?.customerGrade ?? "-")"
        nameLabel.text = "Name : \(self.getDataValueResponse?.name ?? "-")"
        sexLabel.text = "Sex : \(self.getDataValueResponse?.sex ?? "-")"
    }
    
    @IBAction func backButtonAction(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
}
