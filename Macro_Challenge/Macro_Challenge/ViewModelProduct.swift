//
//  ViewModelProduct.swift
//  Macro_Challenge
//
//  Created by Vinicius on 01/06/23.
//

import SwiftUI

struct ViewModelProduct {
    public var productList = [ProductModel]()
     
    
    public mutating func addProduct(tags: [Tag], purchasedPrice: Double, status: ProductStatus, acessory: Bool) {
     
        productList.append(ProductModel.init(tags: tags, purchasedPrice: purchasedPrice, status: status, acessory: acessory))
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

