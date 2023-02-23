//
//  Attribute.swift
//  MeLi
//
//  Created by Victoria Rodriguez on 21/2/23.
//

import Foundation

class Attribute: Codable {
    
    var id: String?
    var name: String?
    var value: String?
    
    var description: String {
        guard let name = name, let value = value else {
            return "Datos no especificados"
        }
        
        return "\(name): \(value)"
    }
    
    enum CodingKeys : String, CodingKey {
        case id
        case name
        case value = "value_name"
    }
}
