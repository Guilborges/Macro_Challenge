//
//  ProductViewModel.swift
//  Macro_Challenge
//
//  Created by Victor Levenetz Mariano on 13/06/23.
//

import Foundation


import SwiftUI

class ProductViewModel: ObservableObject {
    @Published public var productList: [Product] = []

    
    init(productList: [Product] = [Product]()) {
        self.productList = productList
    }
    
    
    public func addProduct(tags: [Tag], purchasedPrice: Double, status: ProductStatus, acessory: Bool,image:Image) {
    productList.append(Product(tags: tags, purchasedPrice: purchasedPrice, status: status.self, acessory: true,image: image))
        printalista()
    }

    func printalista(){
        
        for i in productList{
          
            print("\(i ) ")
        }
    }
    
    func productsCount() -> Int {
        var contador = 0
        for i in productList{
            contador = contador+1
            print("\(i)")
        }
       return contador
        
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

   
    
    func trocarEnum(objeto: Product, novoEnum: ProductStatus) {
        objeto.status = novoEnum
    }
    func printalista1(){
        
        for i in productList{
          
            print("\(i.status ) ")
        }
    }
    
    
    func deleteProduct(indexSet: IndexSet){
        productList.remove(atOffsets: indexSet)
    }
}
