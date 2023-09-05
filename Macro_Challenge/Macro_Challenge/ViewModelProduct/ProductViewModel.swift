//
//  ProductViewModel.swift
//  Macro_Challenge
//
//  
//

import Foundation

import CoreData
import SwiftUI

class ProductViewModel: ObservableObject {
    @Environment(\.managedObjectContext) private var viewContext
    @Published public var productList: [Product] = []
    @Published public var productListDb: [ProductDb] = []
    
    var filteredProducts: [Product] = []
    
    private let manager = CoreDataManeger.instanceSingle
    
    
//    var coreDatamanager = CoreDataManeger()
    var userDefault = UserDefaultModel()

    init() {
        
        self.productList = userDefault.product
        fetchResults()
    }
    
    
    func fetchResults() {
            let request = NSFetchRequest<ProductDb>(entityName: "ProductDb")
            do {
                productListDb = try manager.context.fetch(request)

            } catch {
                
            }
        }
    
    public func addProduct(tags: [Tag], purchasedPrice: Double, status: ProductStatus, acessory: Bool,image:UIImage) {
    productList.append(Product(tags: tags, purchasedPrice: purchasedPrice, status: status.self, acessory: true,image: image))
        saveUserDefault()
    }

//    public func addProduct1( purchasedPrice: Double, status: String, acessory: Bool,image:String) {
//
//
//        let newProduct = ProductDb(context: manager.context)
//
//        newProduct.status = status
//
//        newProduct.acessory = acessory
//
//        manager.saveCoreData()
//    }
    
   
    
    func removeProduct(withUUID uuidToRemove: UUID, from products: inout [Product]) {
        if let index = products.firstIndex(where: { $0.id == uuidToRemove }) {
            products.remove(at: index)
            print("Product with UUID \(uuidToRemove) removed.")
        } else {
            print("Product with UUID \(uuidToRemove) not found.")
        }
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
    func productsCountAcquarid() -> Int {
        var contador = 0
        for _ in productList.filter({ product in
            if product.status == .acquarid{
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
        
    func filterProducts(with searchText: String) {
        if searchText.isEmpty {
            filteredProducts = productList
        } else {
            filteredProducts = productList.filter { product in
                product.tags.contains { tag in
                    tag.name.localizedCaseInsensitiveContains(searchText)
                }
            }
        }
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
    
    func handleDelete(_ productToDelete: Product) {
        if let index = productList.firstIndex(where: { $0.id == productToDelete.id }) {
            
            productList.remove(at: index)
            
               print("Product with ID \(productToDelete.id) removed.")
           }
        saveUserDefault()
       }
  
    func changeStatus(_ product: Product, newStatus: ProductStatus) {
        if let index = productList.firstIndex(where: { $0.id == product.id }) {
            objectWillChange.send()
            productList[index].status = newStatus
            
           }
        saveUserDefault()
       }
    
}
