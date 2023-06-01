//
//  Product.swift
//  Macro_Challenge
//
//  Created by Victor Levenetz Mariano on 27/05/23.
//

import Foundation

class ProductModel:Identifiable, ObservableObject{
    let id = UUID()
    var tags: [Tag] = []
    public var purchasedPrice: Double
    var status: ProductStatus
    var acessory: Bool
    
    init(tags: [Tag], purchasedPrice: Double, status: ProductStatus, acessory: Bool) {
       
        self.tags = tags
        self.purchasedPrice = purchasedPrice
        self.status = status
        self.acessory = acessory
    }
    
}
