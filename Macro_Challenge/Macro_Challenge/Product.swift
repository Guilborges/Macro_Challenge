//
//  Product.swift
//  Macro_Challenge
//
//  Created by Victor Levenetz Mariano on 27/05/23.
//

import Foundation
import SwiftUI

class Product: Identifiable, Hashable,ObservableObject{
    static func == (lhs: Product, rhs: Product) -> Bool {
        
        return false
    }
    
    let id = UUID()
    var tags: [Tag] = []
    public var purchasedPrice: Double
    var status: ProductStatus
    var acessory: Bool
    var image: Image
    
    enum CodingKeys: String, CodingKey {
            case id, tags, purchasedPrice, status, accessory, image
        }
    
    
    
    init(tags: [Tag], purchasedPrice: Double, status: ProductStatus, acessory: Bool,image:Image) {
        
        self.tags = tags
        self.purchasedPrice = purchasedPrice
        self.status = status
        self.acessory = acessory
        self.image = image
        
    }
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
   
    
    
    

}
