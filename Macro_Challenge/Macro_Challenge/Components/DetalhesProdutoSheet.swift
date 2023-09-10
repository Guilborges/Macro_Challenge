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
                Section{
                    if let image = product.image{
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 300, height: 300)
                            .clipped()
                            .cornerRadius(300)
                        
                    }
                    Text("R$:\(String(format: "%.2f", product.purchasedPrice))")
                        .font(.footnote)
                        .bold()
                        .cornerRadius(20)
                }.cornerRadius(20)
                
            }
            .foregroundColor(.primary)
            .background(Color.white)
            
            .position(x: 178, y: 210)
            
            
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

