//
//  Product.swift
//  Macro_Challenge
//
// 
//

import Foundation
import SwiftUI

class Product: Identifiable, Hashable,ObservableObject,Codable{
    
    
    static func == (lhs: Product, rhs: Product) -> Bool {
        return false
    }
    
    let id: UUID
        var tags: [Tag] = []
        public var purchasedPrice: Double
        var status: ProductStatus
        var acessory: Bool
        @CodableImage var image: UIImage?
    
    
    

    
    
    
    init(tags: [Tag], purchasedPrice: Double, status: ProductStatus, acessory: Bool,image:UIImage) {
        id = UUID()
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
