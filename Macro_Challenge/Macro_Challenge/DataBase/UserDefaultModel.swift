//
//  UserDefaultModel.swift
//  Macro_Challenge
//
//  Created by Victor Levenetz Mariano on 02/08/23.
//

import Foundation

class UserDefaultModel{
    var userDefault = UserDefaults.standard
    var product: [Product] = []
    
    
    init(){
        getProducts()
    }
    
    public func updateProducts(products: [Product]){
        do {
            let encodedData = try JSONEncoder().encode(products)
            userDefault.set(encodedData, forKey: "products")
        }
        catch{
            print(error)
        }
    }
    
    
    func getProducts(){
        guard let load = userDefault.object(forKey: "products") as? Data else {return}
        do{
            let productsDecodable = try JSONDecoder().decode([Product].self, from: load)
            self.product = productsDecodable
            
        }
        catch{
            print(error)
        }
    }
    
}

