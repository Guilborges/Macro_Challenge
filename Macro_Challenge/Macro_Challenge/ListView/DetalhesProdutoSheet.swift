//
//  DetalhesProdutoSheet.swift
//  Macro_Challenge
//
//  Created by Guilherme Borges on 30/08/23.
//

import SwiftUI

struct DetalhesProdutoSheet: View {
    let product: Product
    @State private var isEditing = false
    
    var body: some View {
        VStack {
            
            HStack {
                Spacer()
                Button(action: {
                    isEditing.toggle()
                    
                }) {
                    Text(isEditing ? "Salvar" : "Editar")
                        .foregroundColor(.blue)
                }
                .padding()
            }
            
                Divider()
            
            VStack {
                if let image = product.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 325, height: 325)
                        .aspectRatio(contentMode: .fill)
                        .mask(
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 375, height: 325)
                                
                        )
                }
                
                Rectangle()
                    .fill(Color.white) // Define a cor de fundo como branco
                    .frame(width: 325, height: 60)
                    .overlay(
                        Text("R$\(String(format: "%.2f", product.purchasedPrice))")
                            .font(.system(size: 30, design: .rounded))
                        
                            
                    )
                    .padding(.top, -8)
                
                
                

                    
                    
            
        }
            
                        .cornerRadius(10)
                        .position(x: 178, y: 210)
                        
            //Borda da foto
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 1.0)
                                .position(x: 161.5, y: 243)
                                .frame(width: 325, height: 384.5)
                            

                        )
          
            //linha do meio entre foto e espaco branco
                        .overlay(
            Rectangle()
                .frame(height: 1.0)
                           .foregroundColor(.gray)
                           .position(x: 161.5, y: 343)
                           .frame(width: 325)
            )
                        
                        Text("\(product.status.rawValue)")
                            .position(x: 180, y: 300)
                            .foregroundColor(.primary)
                        
                        Spacer()
                    }
        
                    .padding()
                    .background(Color("background"))
                }
            }

extension Array {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

