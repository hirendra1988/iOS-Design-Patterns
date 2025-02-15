//
//  FactoryDesignPattern2.swift
//  Design Pattern
//
//  Created by Hirendra Sharma on 12/02/25.
//

import Foundation

extension ViewController {
    
    func factoryPatternExample2() {
        let loginRequest = APIRequestFactory.createRequest(requestType: .loginRequest("username", "password"))
        let fetchUser = APIRequestFactory.createRequest(requestType: .fetchUserDetails)
        print(loginRequest)
        print(fetchUser)
    }
    
}

protocol APIRequest {
    var url : URL { get }
    var method: String { get }
    var body: Data? { get }
    func createRequest() -> URLRequest
}

extension APIRequest {
    
    func createRequest() -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.httpBody = body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
}

class LoginRequest: APIRequest {
    var url: URL {
        return URL(string: "www.apple.com/login")!
    }
    var method: String {
        return "POST"
    }
    var body: Data?
    
    init(_ username: String, _ password: String) {
        let params = ["username": username, "password": password]
        self.body = try? JSONSerialization.data(withJSONObject: params)
    }
}

class FetchUserDetailsRequest: APIRequest {
    var url: URL {
        return URL(string: "www.apple.com/fetchUser")!
    }
    var method: String {
        return "GET"
    }
    var body: Data? = nil
}

enum APIRequestType {
    case loginRequest(_ username: String, _ password: String)
    case fetchUserDetails
}

class APIRequestFactory {
    static func createRequest(requestType: APIRequestType) -> APIRequest {
        switch requestType {
        case .loginRequest(let username, let password):
            LoginRequest(username, password)
        case .fetchUserDetails:
            FetchUserDetailsRequest()
        }
    }
}
