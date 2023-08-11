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
    @Published public var productListDb: [ProductDb] = []
    var userDefault = UserDefaultModel()

    init() {
        self.productList = userDefault.product
    }
    
    
    public func addProduct(tags: [Tag], purchasedPrice: Double, status: ProductStatus, acessory: Bool,image:UIImage) {
    productList.append(Product(tags: tags, purchasedPrice: purchasedPrice, status: status.self, acessory: true,image: image))
        saveUserDefault()
       
  

        
    }

    


    
    func productsCount() -> Int {
        var contador = 0
        for _ in productList{
            contador = contador+1
        }
       return contador
        
    }
    
    
    
    func saveUserDefault() {
        let backgroundThread = Thread {
            // Coloque o código da função que você deseja executar em uma thread secundária aqui
            self.userDefault.updateProducts(products: self.productList)
            print("Função executando em uma thread secundária.")
            
            
        }
        
        backgroundThread.start()
    }
    
    func productsCountWashing() -> Int {
        var contador = 0
        for _ in productList.filter({ product in
            if product.status == .washing{
                contador = contador+1
                return true
            }
            return false
        }){}
            
            
        
       return contador
        
    }
    func productsCountSelling() -> Int {
        var contador = 0
        for _ in productList.filter({ product in
            if product.status == .selling{
                contador = contador+1
                return true
            }
            return false
        }){}
            
            
        
       return contador
        
    }
    func productsCountSold() -> Int {
        var contador = 0
        for _ in productList.filter({ product in
            if product.status == .sold{
                contador = contador+1
                return true
            }
            return false
        }){}
            
            
        
       return contador
        
    }
    func productsCountMaintenance() -> Int {
        var contador = 0
        for _ in productList.filter({ product in
            if product.status == .maintenance{
                contador = contador+1
                return true
            }
            return false
        }){}
            
            
        
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
             objectWillChange.send()
             saveUserDefault()
    }
        

    
    func totalPriceForCurrentStatus() -> Double {
        var totalPrice: Double = 0.0
        
        for _ in productList.filter({ product in
            if product.status == .sold{
                totalPrice = totalPrice+product.purchasedPrice
                return true
            }
            return false
        }){}
        
        return totalPrice
    }
    
    
    func deleteProduct(indexSet: IndexSet){
        productList.remove(atOffsets: indexSet)
        saveUserDefault()
    }
    
    func deleteProductIndex(indexList: Int){
        productList.remove(at: indexList)
        saveUserDefault()
    }
    
}
