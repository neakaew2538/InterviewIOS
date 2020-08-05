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
    var getLoginResponseTest: LoginResponseTest?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "DataCell", bundle: nil), forCellReuseIdentifier: "DataCell")
    }
    
    @IBAction func logoutButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension DashboardVC :UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.getLoginResponseTest?.customers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataCell") as! DataCell
        cell.idLabel.text = self.getLoginResponseTest?.customers[indexPath.row]?.id
        cell.nameLabel.text = self.getLoginResponseTest?.customers[indexPath.row]?.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailVC()
        vc.tokenValue = self.tokenValue
        vc.getID = self.getLoginResponseTest?.customers[indexPath.row]?.id ?? ""
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
