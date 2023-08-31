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
            VStack {
                Section {
                    if let image = product.image {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 350, height: 350)
                            .clipped()
                    }

                    Text("R$\(String(format: "%.2f", product.purchasedPrice))")
//                        .font(.footnote)
                        .font(.system(size: 30, design: .rounded))
                        .frame(height: 55)
                        .background(Color.white)
                        .foregroundColor(.primary)
                        .background(Color.white)
                }
            }
            .border(Color.black, width: 0.5)
            .cornerRadius(15)

//            Text("Nome: \(product.tags)")
            Text("Preço: \(product.status.rawValue)")
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

