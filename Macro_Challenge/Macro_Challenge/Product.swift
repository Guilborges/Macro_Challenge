//
//  Product.swift
//  Macro_Challenge
//
// 
//

import Foundation
import SwiftUI

    class Product: Identifiable, Hashable,ObservableObject{
    static func == (lhs: Product, rhs: Product) -> Bool {
        
        return false
    }
    
                   let id = UUID()
        @Published var tags: [Tag] = []
        @Published public var purchasedPrice: Double
        @Published var status: ProductStatus
        @Published var acessory: Bool
        @Published var image: Image
    
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
   
    //
//        ForEach(Array(array.enumerated()), id: .offset) { index, element in
//          // ...
//        }/
        
    
    

}
