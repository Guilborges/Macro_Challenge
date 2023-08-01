
//
//  TelaInicial.swift
//  Macro_Challenge
//
//  Created by Victor Levenetz 15/07/23.
//
import Foundation
import SwiftUI

struct SoldList: View {
    @State private var tags: [Tag] = []
    @State var imagePicker = ImagePicker()
    @State var imagepicker1 = Image(systemName: "")
    @State var setIndexProduct: Int = 0
    @State private var showingSheet = false
    @ObservedObject var prod: ProductViewModel

    var body: some View {
        NavigationStack {
            
            VStack(alignment: .leading) {
                Text("Manutenção")
                    .bold()
                    .font(.system(size: 34, weight: .bold, design: .rounded))
                    .padding(25)
                Text("Total de Peças: \(prod.productsCountSold())")
                    .frame(maxWidth: .infinity, alignment: .center)
                Text("Quantia total das vendas R$:\(String(format: "%.2f", prod.totalPriceForCurrentStatus()))")
                    .frame(maxWidth: .infinity, alignment: .center)
                
                
                List{
                    ForEach(Array(prod.productList.enumerated()), id: \.offset) { index, element in
                        if element.status == .sold{
                            
                            HStack{
                                element.image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:90,height: 90)
                                VStack(alignment: .leading){
                                    ForEach(element.tags) { tag in
                                        Text(tag.name)}
                                    
                                    Text("\(element.purchasedPrice,specifier: "%.2f") R$").frame(width: 90)
                                }
                                Button {
                                    setIndexProduct = index
                                    showingSheet.toggle()
                                    
                                    
                                } label: {
                                    ButtonCircleOrange().position(x:100,y:20)
                                        
                                    
                                }
                                .sheet(isPresented: $showingSheet) {
                                    VStack{
                                        Button("Adquirido") {
                                            //   dismiss()
                                            DispatchQueue.main.async{
                                                prod.trocarEnum(objeto: prod.productList[setIndexProduct], novoEnum: .acquarid)
                                              
                                                showingSheet.toggle()
                                            }
                                            
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
                                
                            }
                        }
                    }
                    
                    .onDelete(perform: prod.deleteProduct)
                }
                
                
            }
            .navigationViewStyle(.stack)
            .frame(maxWidth: .infinity)
            
        }
        
        .navigationBarBackButtonHidden(false)
        
        
    }
    
    }

