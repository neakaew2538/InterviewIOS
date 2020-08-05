//
//  RouterProtocol.swift
//  InterviewTestIOS
//
//  Created by SOP on 5/8/2563 BE.
//  Copyright © 2563 SOP. All rights reserved.
//
import Alamofire

public protocol RouterProtocol: URLRequestConvertible {
    
    var baseURLString: String { get }
    var path: String { get }
    var method: Alamofire.HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any?]? { get }
    var rawBody: NSData { get }
}
