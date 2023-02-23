//
//  EndpointConfig.swift
//  MeLi
//
//  Created by Victoria Rodriguez on 23/12/22.
//

import Foundation

public class Constants {
    static var baseUrl = "https://api.mercadolibre.com/"
//    static var apiKey = ""
    static var pageLimit = 10
}

public class Sites {
    static var UY = "MLU"
    static var ARG = "MLA"
}


extension Endpoint {
    
    var baseURL: URL {
        guard let url = URL(string: Constants.baseUrl) else {
            fatalError("Project Base URL needed")
        }
        
        return url
    }
    
    var body: Data? {
        return nil
    }
    
}
