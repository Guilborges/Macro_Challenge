//
//  SoldList.swift
//  Macro_Challenge
//
//  Created by Victor Levenetz Mariano on 01/08/23.
//

import Foundation
import SwiftUI

struct SellingList: View {
    @State private var tags: [Tag] = []
    @State var imagePicker = ImagePicker()
    @State var imagepicker1 = Image(systemName: "")
    @ObservedObject var prod: ProductViewModel
    @State var setIndexProduct: Int = 0
    @State private var showingSheet = false
    var body: some View {
        
        NavigationStack {
       
            VStack {
                Divider()
                HStack{
                   
                    Spacer()
                }
                
                ScrollView {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 3), spacing: 16) {
                        ForEach(Array(prod.productList.enumerated()), id: \.offset) { index, product in
                            if product.status == .selling{
                                Button(action: {
                                    setIndexProduct = index
                                    showingSheet.toggle()
                                }) {
                                    
                                    VStack {
                                        Section{
                                            if let image = product.image{
                                                Image(uiImage: image)
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 90, height: 90)
                                                    .clipped()
                                                
                                            }
                                            Text("R$:\(String(format: "%.2f", product.purchasedPrice))")
                                                .font(.footnote)
                                        }
                                        
                                    }
                                    .foregroundColor(.primary)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    
                                }
                                .actionSheet(isPresented: $showingSheet) {
                                    ActionSheet(title: Text("Mude o Status da sua peça"), message: nil, buttons: [ // 4
                                        .default(Text("Adquirido"), action: { // 5
                                            prod.trocarEnum(objeto: prod.productList[setIndexProduct], novoEnum: .acquarid)
                                            
                                            
                                        }),
                                        .default(Text("Lavando"), action: {
                                            prod.trocarEnum(objeto: prod.productList[setIndexProduct], novoEnum: .washing)
                                            
                                            
                                        }),
                                        .default(Text("Manutenção"), action: {
                                            prod.trocarEnum(objeto: prod.productList[setIndexProduct], novoEnum: .maintenance)
                                            
                                            
                                        }),
                                        .default(Text("Em Loja"), action: {
                                            prod.trocarEnum(objeto: prod.productList[setIndexProduct], novoEnum: .selling)
                                            
                                        }),
                                        .default(Text("Vendido"), action: {
                                            prod.trocarEnum(objeto: prod.productList[setIndexProduct], novoEnum: .sold)
                                            
                                        }),
                                        .cancel()
                                    ]
                                    )
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        if prod.productList.isEmpty {
                            Spacer()
                                .frame(height: 500)
                            Text("Nenhuma peça adicionada")
                                    .foregroundColor(.gray)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .background(Color.clear)
                                    .multilineTextAlignment(.center)
                        }
                    }
                          .padding()
                          .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: ContentView(prod: prod, tags: $tags)) {
                            Text("Adicionar Peça").foregroundColor(Color("elements"))
                        }
                    }
                }
                .foregroundColor(Color("title"))
                
            }
            .navigationBarTitle("Sua Loja")
            
            
            .background(Color("background"))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        .padding()
        
        
        
    }
    
}

struct SoldButton: View {
    let product: Product
    
    var body: some View {
        Button(action: {
            
        }) {
            VStack(spacing: 8) {
                if let image = product.image{
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                        .cornerRadius(10)
                }
                
                Divider() // Linha que separa a foto do preço
                
                
                Text("R$:\(String(format: "%.2f", product.purchasedPrice))") // Preço com símbolo de moeda
                    .font(.footnote)
                
                
            }
            .padding()
            .foregroundColor(.primary)
            .background(Color.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}
