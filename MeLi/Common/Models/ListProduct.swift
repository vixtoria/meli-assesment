//
//  Product.swift
//  MeLi
//
//  Created by Victoria Rodriguez on 20/2/23.
//

import Foundation

class Product: Codable {
    var id: String?
    var title: String?
    var condition: String?
    var permalink: String?
    var thumbnail: String?
    var thumbnailId: String?
    var priceCurrency: String?
    var price: Double?
    var pictures: [Picture]?
    var attributes: [Attribute]?
    var warranty: String?
    
    var priceTag: String {
        guard let price = price, let priceCurrency = priceCurrency, let currency = Currency(rawValue: priceCurrency) else {
            return "\(String(describing: price))"
        }

        return "\(currency.description) \(String(format: "%.0f", price))"
    }
    
    var conditionTag: String {
        guard let condition = condition, let conditionType = Condition(rawValue: condition) else {
            return Condition.used.description
        }
        
        return conditionType.description
    }
    
    var prettyTitle: String {
        guard let title = self.title else {
            return ""
        }
        return title.trimmingCharacters(in: .whitespaces)
    }
    
    enum CodingKeys : String, CodingKey {
        case id
        case title
        case permalink
        case condition
        case thumbnail
        case thumbnailId = "thumbnail_id"
        case priceCurrency = "currency_id"
        case price
        case pictures
        case warranty
        case attributes
    }
}
