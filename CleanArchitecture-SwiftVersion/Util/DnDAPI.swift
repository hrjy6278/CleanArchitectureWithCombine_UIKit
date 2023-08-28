//
//  DnDAPI.swift
//  CleanArchitecture-SwiftVersion
//
//  Created by 김재윤 on 2023/08/28.
//

import Foundation

public enum HTTPMethod {
    case get
    case post
    case delete
    
    var description: String {
        switch self {
        case .get:
            return "GET"
        case .delete:
            return "DELETE"
        case .post:
            return "POST"
        }
    }
}

public enum DnDAPI {
    case classList
    
    private var baseURL: URL {
        switch self {
        case .classList:
            return URL(string: "https://www.dnd5eapi.co")!
        }
    }
    
    private var path: String {
        switch self {
        case .classList:
            return "/api/classes/"
        }
    }
    
    private var method: HTTPMethod {
        switch self {
        case .classList:
            return .get
        }
    }
    
    public var urlRequest: URLRequest {
        switch self {
        case .classList:
            let url = baseURL.appendingPathComponent(path)
            var request = Foundation.URLRequest(url: url)
            
            request.httpMethod = method.description
           
            return request
        }
    }
}
