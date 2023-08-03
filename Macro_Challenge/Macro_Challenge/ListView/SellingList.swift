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
                VStack(alignment: .leading) {
                    Text("Produtos em Loja")
                        .bold()
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .padding(25)
                        .foregroundColor(Color("title"))
                    Text("Total de Peças: \(prod.productsCountSelling())")
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    
                    ScrollView {
                                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 3), spacing: 16) {
                                    ForEach(Array(prod.productList.enumerated()), id: \.offset) { index, product in
                                        if product.status == .selling{
                                            Button(action: {
                                                setIndexProduct = index
                                                showingSheet.toggle()
                                            }) {
                                                VStack(spacing: 8) {
                                                    if let image = product.image{
                                                        Image(uiImage: image)
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: 70, height: 70)
                                                            .cornerRadius(10)
                                                    }
                                                    Divider()
                                                    
                                                    Text("R$:\(String(format: "%.2f", product.purchasedPrice))")
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
                                            .sheet(isPresented: $showingSheet) {
                                                VStack{
                                                    Button("Adquirido") {
                                                       
                                                            prod.trocarEnum(objeto: prod.productList[setIndexProduct], novoEnum: .acquarid)
                                                            
                                                            showingSheet.toggle()
                                                        
                                                        
                                                    }
                                                    .font(.title)
                                                    .padding()
                                                    Button("Lavando") {
                                                        //   dismiss()
                                                        showingSheet.toggle()
                                                        prod.trocarEnum(objeto: prod.productList[setIndexProduct], novoEnum: .washing)
                                                        
                                                        
                                                    }
                                                    .font(.title)
                                                    .padding()
                                                    Button("Manutenção") {
                                                        //   dismiss()
                                                        showingSheet.toggle()
                                                        prod.trocarEnum(objeto: prod.productList[setIndexProduct], novoEnum: .maintenance)
                                                        
                                                        
                                                    }
                                                    .font(.title)
                                                    .padding()
                                                    Button("Em loja") {
                                                        //   dismiss()
                                                        showingSheet.toggle()
                                                        prod.trocarEnum(objeto: prod.productList[setIndexProduct], novoEnum: .selling)
                                                        
                                                        
                                                    }
                                                    .font(.title)
                                                    .padding()
                                                    Button("Vendido") {
                                                        //   dismiss()
                                                        showingSheet.toggle()
                                                        prod.trocarEnum(objeto: prod.productList[setIndexProduct], novoEnum: .sold)
                                                        
                                                        
                                                    }
                                                    .font(.title)
                                                    .padding()
                                                    
                                                }
                                            }
                                            .buttonStyle(PlainButtonStyle())
                                        }
                                    }
                                }
                                .padding()
                            }
                    
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink(destination: SoldList(prod: prod)) {
                                Text("Vendidos")
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
