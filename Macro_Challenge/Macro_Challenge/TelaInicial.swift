//
//  TelaInicial.swift
//  Macro_Challenge
//
//  Created by Guilherme Borges on 06/06/23.
//

import SwiftUI

struct TelaInicial: View {
    @State private var tags: [Tag] = []
    @State var imagePicker = ImagePicker()
    @State var imagepicker1 = Image(systemName: "")
    public var productList = [Product]()
    @ObservedObject var prodVm: ProductViewModel
    
    
    
    @State private var showingSheet = false
  //  @Environment(\.dismiss) var dismiss
    var body: some View {
            NavigationStack {
                
                VStack(alignment: .leading) { 
                    Text("Meu Brechó")
                        .bold()
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .padding(25)
                    Text("Total de Peças: \(prodVm.productsCount())")
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                  
                    List{
                       
                            ForEach(prodVm.productList, id: \.self){ index in
                                
                                HStack{
                                    index.image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width:120,height: 90)
                                    VStack(alignment: .leading){
                                        ForEach(index.tags) { tag in
                                            Text(tag.name)}
                                        
                                        Text("\(index.purchasedPrice,specifier: "%.2f") R$").frame(width: 90)
                                    }
                                    Button {
                                        showingSheet.toggle()
                                        
                                    } label: {
                                        Circle()
                                        switch index.status{
                                        case ProductStatus.acquarid: ButtonCircleYellow().position(x:60,y:20)
                                        case ProductStatus.sold: ButtonCircleGreen().position(x:60,y:20)
                                        case ProductStatus.maintenance: ButtonCircleOrange().position(x:60,y:20)
                                        case ProductStatus.selling: ButtonCirclePurple().position(x:60,y:20)
                                        case ProductStatus.washing: ButtonCircleBlue().position(x:60,y:20)
                                            
                                        default: Circle()
                                                .frame(width: 20)
                                                .foregroundColor(.blue)
                                            
                                        }
                                        
                                    
                                    
                                    
                                    }.sheet(isPresented: $showingSheet) {
                                        Button("Press to dismiss") {
                                         //   dismiss()
                                            showingSheet.toggle()
                                            prodVm.trocarEnum(objeto: index, novoEnum: .acquarid)
                                            prodVm.printalista1()
                                            
                                        }
                                        .font(.title)
                                        .padding()
                                        .background(.black)                                    }
                            }
                        }
                        
                        
                    }
                    
                    
                    
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink(destination: ContentView(prod: prodVm, tags: $tags)) {
                                Image(systemName: "plus")
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                    .padding()
                    
                    
                }
                .navigationViewStyle(.stack)
                .frame(maxWidth: .infinity) // Define a largura máxima do VStack
                
            }
            .navigationBarHidden(true)
        
    }
    
    
    
    
    }



//



