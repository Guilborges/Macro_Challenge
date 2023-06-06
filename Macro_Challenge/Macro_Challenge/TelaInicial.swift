//
//  TelaInicial.swift
//  Macro_Challenge
//
//  Created by Guilherme Borges on 06/06/23.
//

import SwiftUI

struct TelaInicial: View {
    
    @State var tags: [Tag] = []
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Meu Brecho")
                    .bold()
                    .font(.largeTitle)
                
                Spacer()
                
                NavigationLink(destination: ContentView(prod: Product.init(tags: [Tag(name: "")], purchasedPrice: 200, status: ProductStatus.acquarid, acessory: true), tags: $tags )) {
                    Image(systemName: "plus")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                }
                .padding()
            }
            .navigationBarHidden(true)
        }
    }
}


