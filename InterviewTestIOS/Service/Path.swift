//
//  Path.swift
//  InterviewTestIOS
//
//  Created by SOP on 5/8/2563 BE.
//  Copyright © 2563 SOP. All rights reserved.
//

import Foundation

extension Router {
    public var path: String {
        switch self {
        case .login:
            return "/login"
        }
    }
}
