//
//  Currency.swift
//  MeLi
//
//  Created by Victoria Rodriguez on 20/2/23.
//

import Foundation

enum Currency: String {
    case UYU
    case USD
    
    var description: String {
        switch self {
        case .UYU:
            return "$"
        case .USD:
            return "U$S"
        }
    }
}
