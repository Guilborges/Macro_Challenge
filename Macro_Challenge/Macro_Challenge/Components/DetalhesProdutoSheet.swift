//
//  DetalhesProdutoSheet.swift
//  Macro_Challenge
//
//  Created by Guilherme Borges on 30/08/23.
//

import SwiftUI

struct DetalhesProdutoSheet: View {
    @State private var exibindoDetalhes = false
    let product: Product
    
    var body: some View {
        VStack {
            VStack {
                Section{
                    if let image = product.image{
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 350, height: 350)
                            .clipped()
                        
                    }
                    Text("R$\(String(format: "%.2f", product.purchasedPrice))")
                    //                        .font(.footnote)
                        .frame(height: 55)
                        .font(.system(size: 30, design: .rounded))
                }
                .background(Color("background"))
                
            }
            .border(Color.black, width: 0.5)
            .foregroundColor(.primary)
            .background(Color.white)
            .cornerRadius(20)
            .background(Color("background"))
            
            //            Text("Nome: \(product.tags)")
            Text("Preço: \(product.status.rawValue)")
            
        }
        //            .padding(300)
        .background(Color("background"))
        
    }
    
}
extension Array {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

