//
//  Product.swift
//  Macro_Challenge
//
//  Created by Victor Levenetz Mariano on 27/05/23.
//

import Foundation
import SwiftUI

class Product:Identifiable {
    let id = UUID()
    var tags: [Tag] = []
    public var purchasedPrice: Double
    var status: ProductStatus
    var acessory: Bool
    var image: Image
    
    init(tags: [Tag], purchasedPrice: Double, status: ProductStatus, acessory: Bool,image:Image) {
       
        self.tags = tags
        self.purchasedPrice = purchasedPrice
        self.status = status
        self.acessory = acessory
        self.image = image
    }
    

    
   
    var productList = [Product]()
    
   
    public func addProduct(tags: [Tag], purchasedPrice: Double, status: ProductStatus, acessory: Bool,image:Image) {
    
        productList.append(Product(tags: tags, purchasedPrice: purchasedPrice, status: status.self, acessory: true,image: image))
        
        printalista()

    }
    
    func printalista(){
        for i in productList{
            print("\(i ) \(productList)")
        }
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
