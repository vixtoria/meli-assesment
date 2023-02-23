//
//  ProductSearchResponse.swift
//  MeLi
//
//  Created by Victoria Rodriguez on 20/2/23.
//

import Foundation

class ProductSearchResponse: Codable {
    var results: [Product]?
    
    enum CodingKeys : String, CodingKey {
        case results
    }
    
}
