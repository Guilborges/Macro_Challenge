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
    @State private var showAlert = false
    
    @State private var searchText = ""
    @State private var selectedItem: Product? = nil
    
    
    @State private var selectedFilter = ProductStatus.todos
    
    var filteredProducts: [Product] {
        let statusFiltered = selectedFilter == .todos
        ? prod.productList
        : prod.productList.filter { $0.status == selectedFilter }
        
        if searchText.isEmpty {
            return statusFiltered
        } else {
            return statusFiltered.filter { product in
                product.tags.contains { tag in
                    tag.name.localizedCaseInsensitiveContains(searchText)
                }
            }
        }
    }
    
    var body: some View {
        
        NavigationStack{
            
            
                VStack {
                    Divider()
                    HStack{
                        SearchBar(text: $searchText, placeholder: "aaaaaaaaaaaaaaaaaaaa")
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
                        if filteredProducts.isEmpty {
                            Spacer()
                                .frame(height: 150)
                               Text("Nenhuma peça adicionada")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                                   .font(.headline)
                                   .foregroundColor(.gray)
                                   .background(Color.clear)
                                   .multilineTextAlignment(.center)
                           } else {
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 3), spacing: 16) {
                            ForEach(Array(filteredProducts.enumerated()), id: \.offset) { index, product in
                                
                                Button(action: {
                                    setIndexProduct = index
                                    showingSheet.toggle()
                                    
                                    selectedItem = product
                                    
                                    
                                }, label: {
                                    ZStack {
                                        if let image = product.image{
                                            
                                            
                                            Image(uiImage: image)
                                            
                                                .resizable()
                                                .scaledToFill()
                                            
                                                .frame(width: 100, height: 100)
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
                                            if let selectedItem = selectedItem {
                                                prod.changeStatus(selectedItem, newStatus: .acquarid)
                                                                }

                                        }),
                                        .default(Text("Lavando"), action: {
                                            if let selectedItem = selectedItem {
                                                prod.changeStatus(selectedItem, newStatus: .washing)
                                                                }
                                        }),
                                        .default(Text("Manutenção"), action: {
                                            if let selectedItem = selectedItem {
                                                prod.changeStatus(selectedItem, newStatus: .maintenance)
                                                                }

                                            
                                        }),
                                        .default(Text("Em Loja"), action: {
                                            if let selectedItem = selectedItem {
                                                prod.changeStatus(selectedItem, newStatus: .selling)
                                                                }

                                        }),
                                        .default(Text("Vendido"), action: {
                                            if let selectedItem = selectedItem {
                                                prod.changeStatus(selectedItem, newStatus: .sold)
                                                                }

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
                                            if let selectedItem = selectedItem {
                                                prod.handleDelete(selectedItem)
                                            }
                                        })
                                    )
                                }
                                
                            }
                            .background(Color("background"))
                        }
                        .onChange(of: searchText) { newValue in
                            prod.filterProducts(with: newValue)}
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
            
                
            .navigationBarTitle("Status")
            .foregroundColor(Color("title"))
            .navigationViewStyle(.stack)
            .frame(maxWidth: .infinity)
            .background(Color("background"))
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

