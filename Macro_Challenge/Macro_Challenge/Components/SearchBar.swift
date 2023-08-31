//
//  SearchBar.swift
//  Macro_Challenge
//
//  Created by Victor Levenetz Mariano on 31/08/23.
//

import Foundation
import SwiftUI


struct SearchBar: View {
    @Binding var text: String
    var placeholder: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)

            TextField(placeholder, text: $text)
                .frame(width: .infinity ,height: 40)
                .foregroundColor(.primary)

            if !text.isEmpty {
                Button(action: {
                    text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(.horizontal)
        .textFieldStyle(PlainTextFieldStyle())
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10)
    }
}

