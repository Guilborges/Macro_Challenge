//
//  Product.swift
//  Macro_Challenge
//
//  Created by Victor Levenetz Mariano on 27/05/23.
//

import Foundation

class Product:Identifiable {
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
    

    
   
    var productList = [Product]()
    
   
    public func addProduct(tags: [Tag], purchasedPrice: Double, status: ProductStatus, acessory: Bool) {
    
        productList.append(Product(tags: tags, purchasedPrice: purchasedPrice, status: status.self, acessory: true))
    }
    
    
    public func convertStringToDouble(text: String) -> Double {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        
        if let cost = Double(text) {
            let formattedCost = String(format: "%.2f", cost)
            return Double(formattedCost) ?? 0.0
        } else {
            print("Not a valid number: \(text)")
        }
        
        return 0.0
    }


}
