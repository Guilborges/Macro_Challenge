//
//  ViewModelProduct.swift
//  Macro_Challenge
//
//  
//

import SwiftUI

struct ViewModelProduct {
    public var productList = [ProductModel]()
    //@StateObject var imagePicker = ImagePicker()
    
    public mutating func addProduct(tags: [Tag], purchasedPrice: Double, status: ProductStatus, acessory: Bool,image: Image) {
     
        productList.append(ProductModel.init(tags: tags, purchasedPrice: purchasedPrice, status: status, acessory: acessory, image: image))
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

