
//
//  TelaInicial.swift
//  Macro_Challenge
//
//  Created by Victor Levenetz 15/07/23.
//
import Foundation
import SwiftUI

struct MaintenanceList: View {
    @State private var tags: [Tag] = []
    @State var imagePicker = ImagePicker()
    @State var imagepicker1 = Image(systemName: "")
    @State var setIndexProduct: Int = 0
    @State private var showingSheet = false
    @ObservedObject var prod: ProductViewModel
    
    var body: some View {
        
        
        VStack(alignment: .leading) {
            Text("Manutenção")
                .bold()
                .font(.system(size: 34, weight: .bold, design: .rounded))
                .padding(25)
                .foregroundColor(Color("title"))
            Text("Total de Peças: \(prod.productsCountMaintenance())")
                .frame(maxWidth: .infinity, alignment: .center)
            
            
            List{
                ForEach(Array(prod.productList.enumerated()), id: \.offset) { index, element in
                    if element.status == .maintenance{
                        
                        HStack{
                            if let image = element.image{
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:90,height: 90)
                            }
                            VStack(alignment: .leading){
                                Text("\(element.tags[0].name)")
                                
                                Text("\(element.purchasedPrice,specifier: "%.2f") R$").frame(width: 90)
                            }
                            Button {
                                setIndexProduct = index
                                showingSheet.toggle()
                                
                                
                            } label: {
                                ButtonCircleOrange().position(x:100,y:20)
                                
                                
                            }
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
                                    .cancel() 
                                ]
                                )
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
    
}

