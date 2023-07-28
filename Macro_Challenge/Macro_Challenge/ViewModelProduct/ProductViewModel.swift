//
//  ProductViewModel.swift
//  Macro_Challenge
//
//  
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
        objectWillChange.send()

        
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
        
        print(objeto.tags[0])
        print(objeto.status)
         
       
         objectWillChange.send()
    }
        
    func printalista1(){
        
        for i in productList{
          
            print("\(i.status ) ")
        }
    }
    
    
    
    func deleteProduct(indexSet: IndexSet){
        productList.remove(atOffsets: indexSet)
    }
    
    func createdelete(){
        addProduct(tags: [Tag(name: "branco")], purchasedPrice: 250.3, status: ProductStatus.acquarid, acessory: true, image: Image(systemName: "photo"))
        
    }
}
