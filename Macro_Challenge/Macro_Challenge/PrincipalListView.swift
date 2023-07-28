

import Foundation


import SwiftUI

struct PrincipalListView: View {
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
                                            
                                                prod.trocarEnum(objeto: prod.productList[setIndexProduct], novoEnum: .acquarid)
                                                prod.printalista1()
                                                showingSheet.toggle()
                                            
                                        
                                        }
                                        .font(.title)
                                        .padding()
                                        Button("Lavando") {
                                            prod.trocarEnum(objeto: prod.productList[setIndexProduct], novoEnum: .washing)
                                            prod.printalista1()
                                            showingSheet.toggle()
                                            
                                        }
                                        .font(.title)
                                        .padding()
                                        Button("Manutenção") {
                                            prod.trocarEnum(objeto: prod.productList[setIndexProduct], novoEnum: .maintenance)
                                            prod.printalista1()
                                            showingSheet.toggle()
                                            
                                        }
                                        .font(.title)
                                        .padding()
                                        Button("Em loja") {
                                            prod.trocarEnum(objeto: prod.productList[setIndexProduct], novoEnum: .selling)
                                            prod.printalista1()
                                            showingSheet.toggle()
                                            
                                        }
                                        .font(.title)
                                        .padding()
                                        Button("Vendido") {
                                            prod.trocarEnum(objeto: prod.productList[setIndexProduct], novoEnum: .sold)
                                            prod.printalista1()
                                            showingSheet.toggle()
                                            
                                        }
                                        .font(.title)
                                        .padding()
                                        
                                    }
                                }
                            }
                        }
                        .onDelete(perform: prod.deleteProduct)
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
