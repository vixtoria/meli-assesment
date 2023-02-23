//
//  Condition.swift
//  MeLi
//
//  Created by Victoria Rodriguez on 23/2/23.
//

import Foundation

enum Condition: String {
    case new
    case used
    case noSpecified
    
    var description: String {
        switch self {
        case .new:
            return "Nuevo"
        case .used:
            return "Usado"
        case .noSpecified:
            return "No especifica"
        }
    }
}
