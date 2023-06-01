//
//  HomeView.swift
//  Macro_Challenge
//
//  Created by Vinicius on 31/05/23.
//

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

//struct HomeView_Previews: PreviewProvider {
//    var product = ProductModel(tags: [Tag.init(name: "")], purchasedPrice: 2, status: ProductStatus.maintenance, acessory: true)
//    static var previews: some View {
//        HomeView()
//    }
//}
