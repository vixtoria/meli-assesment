//
//  Picture.swift
//  MeLi
//
//  Created by Victoria Rodriguez on 21/2/23.
//

import Foundation

class Picture: Codable {
    
    var id: String?
    var url: String?
    
    enum CodingKeys : String, CodingKey {
        case id
        case url
    }
}
