//
//  SoldButton.swift
//  Macro_Challenge
//
//  Created by Victor Levenetz Mariano on 31/08/23.
//

import Foundation
import SwiftUI


struct SoldButton: View {
    let product: Product
    
    var body: some View {
        Button(action: {
            
        }) {
            VStack(spacing: 8) {
                if let image = product.image{
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                        .cornerRadius(10)
                }
                
                Divider() 
                
                
                Text("R$:\(String(format: "%.2f", product.purchasedPrice))") // Preço com símbolo de moeda
                    .font(.footnote)
                
                
            }
            .padding()
            .foregroundColor(.primary)
            .background(Color.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}
