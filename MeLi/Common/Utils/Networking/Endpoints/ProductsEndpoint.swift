//
//  ProductsEndpoint.swift
//  MeLi
//
//  Created by Victoria Rodriguez on 23/12/22.
//

import Foundation
//import CoreServices

enum ProductsEndpoint {
    case search(String, String, Int, Int)
    case detail(String)
}

extension ProductsEndpoint: Endpoint {
    
    var body: Data? {
        return nil
    }
    
    var path: String {
        switch self {
        case .search(let site,_,_,_):
            return String(format: "sites/%@/search", arguments: [site])
        case .detail(_):
            return "items"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .search(_,_,_,_):
            return .get
        case .detail(_):
            return .get
        }
    }
    
    var name: String? {
        return "ProductsEndpoint"
    }
    
    var requiresAuth: AuthorizationType {
        return .bearer
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .search(_,let query, let limit, let offset):
            return ["q": query, "limit": limit, "offset": offset]
        case .detail(let id):
            return ["ids": id]
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var parametersEncoding: ParametersEncoding {
        switch self {
        case .search(_,_,_,_):
            return .url
        case .detail(_):
            return .url
        }
    }
}
