//  TabScreen1.swift
//  Macro_Challenge
//
//  Created by Victor Levenetz Mariano on 25/07/23.
//

import Foundation
//
//  TelaInicial.swift
//  Macro_Challenge
//
//  Created by Guilherme Borges on 06/06/23.
//

import SwiftUI

struct TabScreen1: View {
    @State private var tags: [Tag] = []
    @State var imagePicker = ImagePicker()
    @State var imagepicker1 = Image(systemName: "")
    @ObservedObject var prod: ProductViewModel
    @State var setIndexProduct: Int = 0
    @State private var showingSheet = false
    var body: some View {
        
            NavigationStack {
                VStack(alignment: .leading) {
                    Text("Meu Brechó")
                        .bold()
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .padding(25)
                    Text("Total de Peças: \(prod.productsCount())")
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    
                    ScrollView {
                                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 3), spacing: 16) {
                                    ForEach(prod.productList) { product in
                                        ProductButton(product: product)
                                    }
                                }
                                .padding()
                            }
                    
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink(destination: ContentView(prod: prod, tags: $tags)) {
                                Image(systemName: "plus")
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                    .padding()
                }
                .navigationViewStyle(.stack)
                .frame(maxWidth: .infinity)
            }
            .navigationBarHidden(true)
        }
    }

struct ProductButton: View {
    let product: Product

    var body: some View {
        Button(action: {
            // Ação ao clicar no botão
        }, label: {
            VStack {
                product.image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .border(Color.black, width: 2)
            }
        })
    }
}
