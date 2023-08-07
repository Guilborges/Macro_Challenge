//  TabScreen1.swift
//  Macro_Challenge
//
//  Created by Victor Levenetz Mariano on 25/07/23.
//

import Foundation


import SwiftUI

struct PrincipalList: View {
    @State private var tags: [Tag] = []
    @State var imagePicker = ImagePicker()
    @State var imagepicker1 = Image(systemName: "")
    @ObservedObject var prod: ProductViewModel
    @State private var setIndexProduct: Int = 0
    @State private var showingSheet = false
    
    
    
    
    var body: some View {
        
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Meu Brechó")
                    .bold()
                    .font(.system(size: 34, weight: .bold, design: .rounded))
                    .padding(25)
                    .foregroundColor(Color("title"))
                Text("Total de Peças: \(prod.productsCount())")
                    .frame(maxWidth: .infinity, alignment: .center)
                
                
                ScrollView {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 3), spacing: 16) {
                        ForEach(Array(prod.productList.enumerated()), id: \.offset) { index, product in
                            Button(action: {
                                
                                setIndexProduct = index
                                showingSheet.toggle()
                            }, label: {
                                ZStack {
                                    if let image = product.image{
                                        
                                        
                                        Image(uiImage: image)
                                        
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 100, height: 100)
                                            .border(Color.black, width: 1.2)
                                            .clipped()
                                            .cornerRadius(5)
                                        
                                        TriangleColor(product: product)
                                        
                                    }
                                }
                            })
                            
                            
                            
                            
                            .actionSheet(isPresented: $showingSheet) {
                                ActionSheet(title: Text("Mude o Status da sua peça"), message: nil, buttons: [ // 4
                                    .default(Text("Adiquirido"), action: { // 5
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
                                    .destructive(Text("Apagar Peça"), action: {
                                        prod.deleteProductIndex(indexList: setIndexProduct)
                                    }),
                                    .cancel() // 6
                                ]
                                )
                            }
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



struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.width
        let height = rect.height
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: width, y: 0))
        path.addLine(to: CGPoint(x: width, y: height))
        
        return path
    }
}

struct TriangleColor: View {
    let product: Product
    
    var body: some View {
        
        switch product.status{
        case ProductStatus.acquarid: Triangle()
                .fill(Color("aquired"))
                .frame(width: 30, height: 30)
                .position(x: 84, y: 16)
                .cornerRadius(4)
                .rotationEffect(Angle(degrees: 90))
        case ProductStatus.sold: Triangle()
                .fill(Color("sold"))
                .frame(width: 30, height: 30)
                .position(x: 84, y: 16)
                .cornerRadius(4)
                .rotationEffect(Angle(degrees: 90))
        case ProductStatus.maintenance: Triangle()
                .fill(Color("maintenance"))
                .frame(width: 30, height: 30)
                .position(x: 84, y: 16)
                .cornerRadius(4)
                .rotationEffect(Angle(degrees: 90))
        case ProductStatus.selling: Triangle()
                .fill(Color("selling"))
                .frame(width: 30, height: 30)
                .position(x: 84, y: 16)
                .cornerRadius(4)
                .rotationEffect(Angle(degrees: 90))
        case ProductStatus.washing: Triangle()
                .fill(Color("washing"))
                .frame(width: 30, height: 30)
                .position(x: 84, y: 16)
                .cornerRadius(4)
                .rotationEffect(Angle(degrees: 90))
                
            
        default: Circle()
                .frame(width: 20)
                .foregroundColor(.blue)
            
        }
    }
}
