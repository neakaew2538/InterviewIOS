//
//  Response.swift
//  InterviewTestIOS
//
//  Created by SOP on 5/8/2563 BE.
//  Copyright © 2563 SOP. All rights reserved.
//


struct LoginResponseTest: Codable {
    
    let status: Int
    let token: String?
    let customers: [CustomersResponse?]

    private enum CodingKeys: String, CodingKey {
        case status = "status"
        case token = "token"
        case customers = "customers"
    }
}


struct CustomersResponse: Codable {
    
    let token: String?

    private enum CodingKeys: String, CodingKey {
        case token = "token"
    }
}
