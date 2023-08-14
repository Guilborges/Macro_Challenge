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
    @State private var showingSheetProduct = false
    
    @State private var isMenuOpen = false
    
    @State private var showAlert = false
    
    @State private var selectedFilter = ProductStatus.todos
    
    var filteredProducts: [Product] {
        if selectedFilter == ProductStatus.todos {
            return prod.productList
        } else  {
            return prod.productList.filter { $0.status == selectedFilter }
        }
    }
    
    var body: some View {
        
        NavigationStack{
            
            ScrollView{
                VStack {
                    
                    
                    HStack{
                        Text("Processos")
                            .bold()
                            .font(.system(size: 34, weight: .bold, design: .rounded))
                            .padding(25)
                            .foregroundColor(Color("title"))
                        
                      
                        
                        Spacer()
                        
                        Menu {
                            ForEach(ProductStatus.allCases, id: \.self) { status in
                                Button(status.rawValue) {
                                    self.selectedFilter = status
                                    print(selectedFilter)
                                }
                            }
                        } label: {
                            
                            Text("Filtro").foregroundColor(Color("elements"))
                            
                            Image(systemName: "line.3.horizontal.decrease.circle").foregroundColor((Color("elements")))
                        }.padding(20)
                        
                    }.background(Color("background"))
                    
                    VStack {
                        HStack{
                            Text("\(selectedFilter.rawValue)")
                            
                                .foregroundColor(Color("elements"))
                                .background(Color("background"))
                                .padding(10)
                            Spacer()
                        }
                    }
                    
                    
                    
                    
                    ScrollView {
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 3), spacing: 16) {
                            ForEach(Array(filteredProducts.enumerated()), id: \.offset) { index, product in
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
                                            
                                            //  .border(Color.black, width: 1.2)
                                                .clipped()
                                                .cornerRadius(5)
                                            
                                            
                                            TriangleColor(product: product)
                                        }
                                    }
                                })
                                
                                .sheet(isPresented: $showingSheetProduct, content: {
                                    Text(prod.productList[setIndexProduct].tags[0].name)
                                })
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
                                        .destructive(Text("Apagar Peça"), action: {
                                            
                                            showAlert =  true
                                            
                                            
                                        }),
                                        .cancel() // 6
                                    ]
                                    )
                                }.alert(isPresented: $showAlert) {
                                    Alert(
                                        title: Text("Deseja apagar a peça selecionada?"),
                                        message: Text("Essa ação não poderá ser desfeita"),
                                        primaryButton: .default(Text("Cancelar"), action: {
                                         
                                        }),
                                        secondaryButton: .destructive(Text("Apagar"), action: {
                                            prod.deleteProductIndex(indexList: setIndexProduct)
                                        })
                                    )
                                }
                                
                            }
                            
                            
                            .background(Color("background"))
                            
                        }
                        
                        .background(Color("background"))
                        
                        
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: ContentView(prod: prod, tags: $tags)) {
                        Text("Adicionar Peça").foregroundColor(Color("elements"))
                    }
                }
            }
                .background(Color("background"))
            .navigationViewStyle(.stack)
            .frame(maxWidth: .infinity)
        }
        
        
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            .padding()
        
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
                .fill(Color("triangleAcquarid"))
                .frame(width: 60, height: 60)
                .position(x: 75, y: 16)
                .cornerRadius(10)
                .rotationEffect(Angle(degrees: -90))
        case ProductStatus.sold: Triangle()
                .fill(Color("triangleSold"))
                .frame(width: 60, height: 60)
                .position(x: 75, y: 16)
                .cornerRadius(10)
                .rotationEffect(Angle(degrees: -90))
        case ProductStatus.maintenance: Triangle()
                .fill(Color("triangleMaintenance"))
                .frame(width: 60, height: 60)
                .position(x: 75, y: 16)
                .cornerRadius(10)
                .rotationEffect(Angle(degrees: -90))
                .opacity(200)
        case ProductStatus.selling: Triangle()
                .fill(Color("triangleSelling"))
                .frame(width: 60, height: 60)
                .position(x: 75, y: 16)
                .cornerRadius(10)
                .rotationEffect(Angle(degrees: -90))
        case ProductStatus.washing: Triangle()
                .fill(Color("triangleWashing"))
                .frame(width: 60, height: 60)
                .position(x: 75, y: 16)
                .cornerRadius(10)
                .rotationEffect(Angle(degrees: -90))
            
            
        default: Circle()
                .frame(width: 20)
                .foregroundColor(.blue)
            
        }
    }
}

