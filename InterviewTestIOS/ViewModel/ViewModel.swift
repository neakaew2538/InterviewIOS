//
//  ViewModel.swift
//  InterviewTestIOS
//
//  Created by SOP on 5/8/2563 BE.
//  Copyright © 2563 SOP. All rights reserved.
//

import Foundation
import RxSwift

class ViewModel {
    
    var loginResponse: ((_ response: LoginResponseTest?)->())?
    var errorResponse: ((_ error: Error?)->())?
    
    private let apiClient: ApiClientProtocol
    private let disposeBag =  DisposeBag()
    
    init(apiClient: ApiClientProtocol = ApiClient()) {
        self.apiClient = apiClient
    }
    
    func login(username: String, password: String) {
        apiClient.login(username: username, password: password)
            .subscribe(onSuccess: { self.loginResponse?($0) },
                       onError: { self.errorResponse?($0) })
            .disposed(by: disposeBag)
    }
}
