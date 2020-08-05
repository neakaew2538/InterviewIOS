//
//  Parameters.swift
//  InterviewTestIOS
//
//  Created by SOP on 5/8/2563 BE.
//  Copyright © 2563 SOP. All rights reserved.
//

import Foundation

extension Router {
    public var parameters: [String : Any?]? {
        switch self {
        case .login(let username, let password):
            return [
                "username": username,
                "password": password
            ]
        }
    }
}
