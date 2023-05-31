//
//  TagView.swift
//  Macro_Challenge
//
//  Created by Guilherme Borges on 30/05/23.
//

import SwiftUI

struct Home: View {
    
    @State var text: String = ""
    
    //tags..
    @State var tags: [Tag] = []
    
    var body: some View {
        
        VStack{
            
            Text("Meu brecho")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(Color(.black))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            // Visualização de marca personalizada
            TagView(maxLimit: 150, tags: $tags)
            //default Height
                .frame(height: 280)
                .padding(.top, 20)
            
            //TextFIELD...
            TextField("apple", text: $text )
                .font(.title3)
                .padding(.vertical,10)
                .padding(.horizontal)
                .background(
                
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(Color(.white).opacity(0.2),lineWidth: 1)
                )
            // Definindo apenas TextField como escuro..
                .environment(\.colorScheme, .dark)
                .padding(.vertical,20)
        
            //Botao
            Button {
                //Add tag
                tags.append(Tag(name: text))
                text = ""
                
            } label: {
                Text("Add Tag")
                    .fontWeight(.semibold)
                    .foregroundColor(Color(.white))
                    .padding(.vertical,12)
                    .padding(.horizontal,45)
                    .background(Color(.white))
                    .cornerRadius(10)
                
            }
            
            // Desativa o botão
            .disabled(text == "")
            .opacity(text == "" ? 0.6 : 1)
        }
        .padding(15)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(
            Color(.gray).ignoresSafeArea()
        )
    }
}


