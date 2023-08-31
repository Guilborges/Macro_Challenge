
//
//  TelaInicial.swift
//  Macro_Challenge
//
//  Created by Victor Levenetz 15/07/23.
//
import Foundation
import SwiftUI

struct SoldList: View {
    
    @EnvironmentObject var prodVm: ProductViewModel
    
//    @FetchRequest(entity: ProductDb.entity(), sortDescriptors: [])  var products: FetchedResults<ProductDb>
    
    

    
    
    var body: some View {
        
        NavigationStack{
            List{
                ForEach(prodVm.productListDb){ productList in
                    Text("\(productList.objectID)")
                    
                }
            }
        }
        
        
        
        
    }
    
}

