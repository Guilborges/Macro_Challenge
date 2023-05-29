//
//  Product.swift
//  Macro_Challenge
//
//  Created by Victor Levenetz Mariano on 27/05/23.
//

import Foundation

class Product {
    var tags: [Tag] = []
    var price: Double
    var status: ProductStatus
    var acessory: Bool
    
    init(tags: [Tag], price: Double, status: ProductStatus, acessory: Bool) {
        self.tags = tags
        self.price = price
        self.status = status
        self.acessory = acessory
    }
}
