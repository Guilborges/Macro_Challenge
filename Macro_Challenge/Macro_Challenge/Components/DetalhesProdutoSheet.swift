//
//  DetalhesProdutoSheet.swift
//  Macro_Challenge
//
//  Created by Guilherme Borges on 30/08/23.
//

import SwiftUI

struct DetalhesProdutoSheet: View {
    let product: Product
    
    
    var body: some View {
        VStack {
                     
            Divider()
                .padding(.top)
                .padding(.top)
                .padding(.vertical)
            Section{
                VStack{
                    if let image = product.image{
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 300, height: 300)
                        
                        
                        
                        
                    }
                    ZStack{
                        Rectangle()
                        
                            .stroke(Color.black, lineWidth: 1)
                        
                            .frame(width: 299, height: 40)
                        Rectangle()
                        
                            .foregroundColor(.white)
                        
                            .frame(width: 299, height: 40)
                    Text("R$:\(String(format: "%.2f", product.purchasedPrice))")
                       
                            
                        .font(.title3)
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
                       // .position(x: 300, y: 200)
                        
                        
                    

                )
                
                
            }
            .padding(.top)
               
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 3), spacing: 16) {
                ForEach(product.tags){tags in
                    Text(tags.name)
                        .font(.system(size: 16))
                    // add capsula...
                        .padding(.horizontal,14)
                        .padding(.vertical,8)
                        .background(
                            
                            Capsule()
                                .fill(Color(.gray))
                        )
                        .foregroundColor(Color(.black))
                        .lineLimit(1)
                    //Deletar...
                        .contentShape(Capsule())
                        .background(Color("background"))
                }
                
                .foregroundColor(.primary)
                .background(Color.white)
                
               
            }
            Spacer()
            Text("\(product.status.rawValue)")
                
                .foregroundColor(.primary)
            
          
        }
        
        
        .background(Color("background"))
    }
}


extension Array {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

