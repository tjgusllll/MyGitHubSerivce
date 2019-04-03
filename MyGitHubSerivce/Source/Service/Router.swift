//
//  Router.swift
//  MyGitHubSerivce
//
//  Created by 조서현 on 2019. 4. 1..
//  Copyright © 2019년 조서현. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    case userAll(since: Int)
     
    static let baseURL = "https://api.github.com"
    
    var method: HTTPMethod {
        switch self {
        case .userAll:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .userAll(_):
            return "/users"
        }
    }

    
    // MARK: URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try Router.baseURL.asURL()

        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .userAll(let since):
            let params: Parameters = ["since":since]
            urlRequest = try URLEncoding.default.encode(urlRequest, with: params)
        default:
            break
        }
        
        return urlRequest
    }
}
