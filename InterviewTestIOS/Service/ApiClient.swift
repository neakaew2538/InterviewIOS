//
//  ApiClient.swift
//  InterviewTestIOS
//
//  Created by SOP on 5/8/2563 BE.
//  Copyright © 2563 SOP. All rights reserved.
//

import Foundation
import RxSwift
import RxAlamofire
import Alamofire

class ApiClient: ApiClientProtocol {
    
    static let baseUrl = "http://boomkorn.pythonanywhere.com"
    
    func login(username: String, password: String) -> Single<LoginResponseTest?> {
        let router = Router.login(username: username, password: password)
        return request(router: router, type: LoginResponseTest.self)
    }
    
    func customerDetail(token: String, customerId: String) -> Single<dataValueResponse?> {
        let router = Router.customerDetail(token: token, customerId: customerId)
        return request(router: router, type: dataValueResponse.self)
    }
    
    private func request<T: Codable>(router: URLRequestConvertible, type: T.Type) -> Single<T?> {
        return requestData(router).asSingle().map { (response, data) in
            guard let result = try? JSONDecoder().decode(type, from: data) else {
                return nil
            }
            return result
        }
    }
}
