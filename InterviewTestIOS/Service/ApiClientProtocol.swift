//
//  ApiClientProtocol.swift
//  InterviewTestIOS
//
//  Created by SOP on 5/8/2563 BE.
//  Copyright © 2563 SOP. All rights reserved.
//

import Foundation
import RxSwift

protocol ApiClientProtocol {
    
    func login(username: String, password: String) -> Single<LoginResponseTest?>
    func customerDetail(token: String, customerId: String) -> Single<CustomerDetailResponse?>
}
