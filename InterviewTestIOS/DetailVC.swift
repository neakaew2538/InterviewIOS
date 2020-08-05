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
        
        
    }
}
