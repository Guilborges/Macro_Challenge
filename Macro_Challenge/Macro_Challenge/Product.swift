//
//  Product.swift
//  Macro_Challenge
//
//  Created by Victor Levenetz Mariano on 27/05/23.
//

import Foundation
import SwiftUI

class Product {
    
    var tags: [Tag] = []
    var price: Double
    var status: ProductStatus
    var acessory: Bool
//    var id = UUID().uuidString
    
    init(tags: [Tag], price: Double, status: ProductStatus, acessory: Bool) {
        self.tags = tags
        self.price = price
        self.status = status
        self.acessory = acessory
    }
    
    var prodList = [Product]()

    func addproduct (tags: [Tag],price: Double, status: ProductStatus, acessory: Bool){
        
        prodList.append(Product(tags: tags, price: price, status: status.self, acessory: true))
                        
        for i in 0..<prodList.count {
            print(prodList[i].price)
            for j in 0..<prodList[i].tags.count {
                print(prodList[i].tags[j].name)
            }
        }
        
    }
}


