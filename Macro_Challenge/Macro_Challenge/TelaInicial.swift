//
//  TelaInicial.swift
//  Macro_Challenge
//
//  Created by Guilherme Borges on 06/06/23.
//

import SwiftUI

struct TelaInicial: View {
    @State private var tags: [Tag] = []
    
    var body: some View {
        TabView {
            NavigationView {
                VStack {
                    Text("Meu Brechó")
                        .bold()
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .padding(.vertical)
                    Text("Total de Peças: 500")
                    
                    Spacer()
                    
                    HStack {
                        ForEach(0..<3) { index in
                            Rectangle()
                                .frame(width: 100, height: 100)
                                .foregroundColor(.gray)
                                .padding(10)
                        }
                    }
                    
                    Spacer()
                    
                    .toolbar{
                        ToolbarItem(placement: .navigationBarTrailing){
                            NavigationLink(destination: ContentView(prod: Product.init(tags: [Tag(name: "")], purchasedPrice: 200, status: ProductStatus.acquarid, acessory: true), tags: $tags )) {
                                Image(systemName: "plus")
                            }
                        }
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                    .padding()
                }
            }
            .navigationBarHidden(true)
            .tabItem {
                Label("Brechó", systemImage: "square.grid.2x2.fill")
            }
            
            Text("Second Tab")
                .tabItem {
                    Label("Segunda", systemImage: "circle.fill")
                }
        }
    }
    
}


