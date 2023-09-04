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
            
            // Botão de edição no canto superior direito
            HStack {
                Spacer()
                Button(action: {
                    isEditing.toggle()
                    
                }) {
                    Text(isEditing ? "Salvar" : "Editar")
//                        .font(.headline)
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
//                    .cornerRadius(20)
                    .frame(width: 325, height: 60)
                    .overlay(
                        Text("R$\(String(format: "%.2f", product.purchasedPrice))")
                            .font(.system(size: 30, design: .rounded))
                            
                    )
                    .padding(.top, -8)
                    
                    
//            }
            
            //                .border(Color.black, width: 0.5)
        }
        .border(Color.black, width: 0.5)
        .cornerRadius(10)
        .position(x: 178, y:210)
//
//                    Text("Nome: \(product.tags)")
        Text("\(product.status.rawValue)")
            .position(x: 180, y:300)
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

