//
//  SoldList.swift
//  Macro_Challenge
//
//  Created by Victor Levenetz Mariano on 01/08/23.
//

import Foundation
import SwiftUI
import CoreData

struct SellingList: View {
    //@Environment(\.managedObjectContext) private var viewContext
    
    
    //@FetchRequest(entity: ProductDb.entity(), sortDescriptors: [])  var products: FetchedResults<ProductDb>
    
    
    
    @State private var tags: [Tag] = []
    @State var imagePicker = ImagePicker()
    @State var imagepicker1 = Image(systemName: "")
    @ObservedObject var prod: ProductViewModel
    @State var setIndexProduct: Int = 0
    @State private var showingSheet = false

    @State private var searchText = ""
    @State private var selectedFilter = ProductStatus.selling
    
    
    
    var filteredProducts: [Product] {
            if searchText.isEmpty {
                return prod.productList
            } else {
                return prod.productList.filter { product in
                    product.tags.contains { tag in
                        tag.name.localizedCaseInsensitiveContains(searchText)
                    }
                }
            }
        }
    
    
    

    @State private var exibindoDetalhes = false

    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                Divider()
                HStack{
                    SearchBar(text: $searchText, placeholder: "Encontre uma peça")
                        .padding(3)
                    Spacer()
                }
                
                ScrollView {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 3), spacing: 16) {

                        ForEach(Array(filteredProducts.enumerated()), id: \.offset) { index, product in
                            if product.status == .selling{
                                Button(action: {
                                    
                                    setIndexProduct = index
                                    exibindoDetalhes.toggle()

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
                                                .bold()
                                        }
                                        
                                    }
                                    .foregroundColor(.primary)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    //Borda quadrado foto na lista scrollview
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.black, lineWidth: 1)
                                            .position(x: 45, y: 56)
//                                            .frame(width: 120, height: 100)
                                        

                                    )
                                    
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
                    .onChange(of: searchText) { newValue in
                        prod.filterProducts(with: newValue)}
                    .background(Color("background"))
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
        
        .sheet(isPresented: $exibindoDetalhes) {
                    if let produtoSelecionado = prod.productList[safe: setIndexProduct] {
                        DetalhesProdutoSheet(product: produtoSelecionado)
                    }
                }
        
    }
     
}
