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
    
    let id: String?
    let name: String?

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
}


struct CustomerDetailResponse: Codable {
    
    let status: Int
    let data: dataValueResponse?
    

    private enum CodingKeys: String, CodingKey {
        case status = "status"
        case data = "data"
    }
}

struct dataValueResponse: Codable {
    let customerGrade: String?
    let id: String?
    let isCustomerPremium: Bool
    let name: String?
    let sex: String?
    

    private enum CodingKeys: String, CodingKey {
        case customerGrade = "customerGrade"
        case id = "id"
        case isCustomerPremium = "isCustomerPremium"
        case name = "name"
        case sex = "sex"
    }
}
