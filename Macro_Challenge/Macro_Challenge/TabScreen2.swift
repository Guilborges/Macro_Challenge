
//
//  TelaInicial.swift
//  Macro_Challenge
//
//  Created by Victor Levenetz 15/07/23.
//
import Foundation
import SwiftUI

struct TabScreen2: View {
    @State private var tags: [Tag] = []
    @State var imagePicker = ImagePicker()
    @State var imagepicker1 = Image(systemName: "")
    @State var setIndexProduct: Int = 0
    @State private var showingSheet = false
    @ObservedObject var prod: ProductViewModel

    var body: some View {
        NavigationStack {
            
            VStack(alignment: .leading) {
                Text("Meu Brechó")
                    .bold()
                    .font(.system(size: 34, weight: .bold, design: .rounded))
                    .padding(25)
                Text("Total de Peças: \(prod.productsCount())")
                    .frame(maxWidth: .infinity, alignment: .center)
                
                
                List{
                    ForEach(Array(prod.productList.enumerated()), id: \.offset) { index, element in
                        ForEach(element.tags) { tag in
                            Text(tag.name)}
                        HStack{
                            element.image
                                .resizable()
                                .scaledToFit()
                                .frame(width:120,height: 90)
                            VStack(alignment: .leading){
                                ForEach(element.tags) { tag in
                                    Text(tag.name)}
                                
                                Text("\(element.purchasedPrice,specifier: "%.2f") R$").frame(width: 90)
                            }
                            Button {
                                setIndexProduct = index
                                print(setIndexProduct)
                                showingSheet.toggle()
                                
                                
                            } label: {
                                switch element.status{
                                case ProductStatus.acquarid: ButtonCircleYellow().position(x:60,y:20)
                                case ProductStatus.sold: ButtonCircleGreen().position(x:60,y:20)
                                case ProductStatus.maintenance: ButtonCircleOrange().position(x:60,y:20)
                                case ProductStatus.selling: ButtonCirclePurple().position(x:60,y:20)
                                case ProductStatus.washing: ButtonCircleBlue().position(x:60,y:20)
                                    
                                default: Circle()
                                        .frame(width: 20)
                                        .foregroundColor(.blue)
                                    
                                }
                            }
                            .sheet(isPresented: $showingSheet) {
                                VStack{
                                    Button("Adquirido") {
                                        //   dismiss()
                                        DispatchQueue.main.async{
                                            prod.trocarEnum(objeto: prod.productList[setIndexProduct], novoEnum: .acquarid)
                                            prod.printalista1()
                                            showingSheet.toggle()
                                        }
                                    
                                    }
                                    .font(.title)
                                    .padding()
                                    Button("Lavando") {
                                        //   dismiss()
                                        showingSheet.toggle()
                                        prod.trocarEnum(objeto: prod.productList[setIndexProduct], novoEnum: .washing)
                                        prod.printalista1()
                                        
                                    }
                                    .font(.title)
                                    .padding()
                                    Button("Manutenção") {
                                        //   dismiss()
                                        showingSheet.toggle()
                                        prod.trocarEnum(objeto: prod.productList[setIndexProduct], novoEnum: .maintenance)
                                        prod.printalista1()
                                        
                                    }
                                    .font(.title)
                                    .padding()
                                    Button("Em loja") {
                                        //   dismiss()
                                        showingSheet.toggle()
                                        prod.trocarEnum(objeto: prod.productList[setIndexProduct], novoEnum: .selling)
                                        prod.printalista1()
                                        
                                    }
                                    .font(.title)
                                    .padding()
                                    Button("Vendido") {
                                        //   dismiss()
                                        showingSheet.toggle()
                                        prod.trocarEnum(objeto: prod.productList[setIndexProduct], novoEnum: .sold)
                                        prod.printalista1()
                                        
                                    }
                                    .font(.title)
                                    .padding()
                                    
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
        
        .navigationBarHidden(true)
        
        
    }
    
    }

