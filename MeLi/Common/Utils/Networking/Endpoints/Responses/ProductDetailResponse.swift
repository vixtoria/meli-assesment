//
//  ProductResponse.swift
//  MeLi
//
//  Created by Victoria Rodriguez on 22/2/23.
//

import Foundation

class ProductDetailResponse: Codable {
    var elements: [ProductDetailBody]?
    
    required init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()

        var elements = [ProductDetailBody]()
        if let count = container.count {
            elements.reserveCapacity(count)
        }
    
        while !container.isAtEnd {
            if let element = try? container.decode(ProductDetailBody.self) {
                elements.append(element)
            }
        }

        self.elements = elements
    }
}

class ProductDetailBody: Codable {
    var body: Product?

    enum CodingKeys : String, CodingKey {
        case body
    }

}
