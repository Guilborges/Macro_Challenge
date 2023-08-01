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

struct PrincipalList: View {
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
                                               
                                                product.image
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 85, height: 85)
                                                    .border(Color.black, width: 1.2)
                                                    .clipped()
                                                
                                               TriangleColor(product: product)
                                                
                                            }
                                        })
                                        
                                        
                                        
                                        
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
            ZStack {
               
                product.image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 85, height: 85)
                    .border(Color.black, width: 1.2)
                    .clipped()
                
               TriangleColor(product: product)
                
            }
        })
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
                let width = rect.width
                let height = rect.height
                
                path.move(to: CGPoint(x: 0, y: 0))           // Canto superior esquerdo
                path.addLine(to: CGPoint(x: width, y: 0))    // Canto superior direito
                path.addLine(to: CGPoint(x: width, y: height)) // Canto inferior direito
                
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
                .position(x: 75, y: 16)
                .rotationEffect(Angle(degrees: 90))
        case ProductStatus.sold: Triangle()
                .fill(Color("sold"))
                .frame(width: 30, height: 30)
                .position(x: 75, y: 16)
                .rotationEffect(Angle(degrees: 90))
        case ProductStatus.maintenance: Triangle()
                .fill(Color("maintenance"))
                .frame(width: 30, height: 30)
                .position(x: 75, y: 16)
                .rotationEffect(Angle(degrees: 90))
        case ProductStatus.selling: Triangle()
                .fill(Color("selling"))
                .frame(width: 30, height: 30)
                .position(x: 75, y: 16)
                .rotationEffect(Angle(degrees: 90))
        case ProductStatus.washing: Triangle()
                .fill(Color("washing"))
                .frame(width: 30, height: 30)
                .position(x: 75, y: 16)
                .rotationEffect(Angle(degrees: 90))
            
        default: Circle()
                .frame(width: 20)
                .foregroundColor(.blue)
            
        }
    }
}
