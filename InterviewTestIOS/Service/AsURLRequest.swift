//
//  AsURLRequest.swift
//  InterviewTestIOS
//
//  Created by SOP on 5/8/2563 BE.
//  Copyright © 2563 SOP. All rights reserved.
//

import Foundation
import Alamofire

extension Router {
    public func asURLRequest() throws -> URLRequest {
        let url = URL(string: baseURLString + path)!
        var mutableURLRequest = URLRequest(url: url)
        mutableURLRequest.httpMethod = method.rawValue
        mutableURLRequest.httpBody = rawBody as Data
        setHttpHeaders(&mutableURLRequest, headers: headers)
        
        return try Alamofire.JSONEncoding.default.encode(mutableURLRequest, with: parameters)
    }

    public func setHttpHeaders(_ mutableURLRequest: inout URLRequest, headers: [String: String]?) {
        addDefaultHttpHeader(&mutableURLRequest)
        if let headers = headers {
            for each in headers.keys {
                mutableURLRequest.setValue(headers[each], forHTTPHeaderField: each)
            }
        }
    }

    private func addDefaultHttpHeader(_ mutableURLRequest: inout URLRequest) {
        mutableURLRequest.setValue("application/json;charset=utf-8", forHTTPHeaderField: "Content-Type")
    }
}
