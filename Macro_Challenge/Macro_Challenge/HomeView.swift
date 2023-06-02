//
//  HomeView.swift
//  Macro_Challenge
//
//  Created by Victor Levenetz Mariano on 02/06/23.
//

import Foundation
import SwiftUI

struct HomeView: View {
    var viewProduct: ViewModelProduct
    
    var body: some View {
        VStack {
            NavigationStack {
                NavigationLink {
                    ContentView()
                } label: {
                    Text("adicionar")
                }
            }
            List(viewProduct.productList) { product in
                
                Text("\(product.purchasedPrice)")
            }
        }.onAppear {
            
        }
    }
    
}
