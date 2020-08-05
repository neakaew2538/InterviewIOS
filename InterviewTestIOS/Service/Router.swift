//
//  Router.swift
//  InterviewTestIOS
//
//  Created by SOP on 5/8/2563 BE.
//  Copyright © 2563 SOP. All rights reserved.
//

import Foundation
import Alamofire

public enum Router: RouterProtocol {
    
    case login(username: String, password: String)
    case customerDetail(token: String, customerId: String)
    
    public var baseURLString: String {
        return ApiClient.baseUrl
    }
    
}
