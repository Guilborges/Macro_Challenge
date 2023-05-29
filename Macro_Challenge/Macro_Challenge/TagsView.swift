//
//  TagsView.swift
//  Macro_Challenge
//
//  Created by Guilherme Borges on 29/05/23.
//

import SwiftUI

struct TagView : View {
//    var tagsVM: TagViewModel

    @State var text = ""

    @State var prod: Product

    var body: some View {

        VStack(spacing:35){

            ScrollView{
                // Tag View...
                LazyVStack(alignment: .leading, spacing: 10){

                    //Como estávamos usando índices, precisamos especificar o ID...
                    ForEach(prod.tags){index in

                        HStack{

                            // Algumas vezes ele nos pede para especificar hashable no modelo de dados
                            ForEach(prod.tags){tagIndex in
                                Text(tagIndex.name)
                                    .fontWeight(.semibold)
                                    .padding(.vertical,10)
                                    .padding(.horizontal)
                                    .background(Capsule().stroke(Color.black, lineWidth: 1))
                                    .lineLimit(1)
                                // Lógica principal...
                                    

//                                        GeometryReader{reader -> Color in
//
//                                            //Ao usar o parâmetro MaxX, podemos usar a lógica e determinar se ele excede ou não...
//
//                                            let maxX = reader.frame(in: .global).maxX
//
//                                            // Ambos os preenchimentos = 30+30 = 60
//                                            // Mais 10 para Extra...
//                                            // Fazendo Ação Somente se o item Exceder...
//                                            if maxX > UIScreen.main.bounds.width - 70 && !prod.tags[index][tagIndex].isExceeded{
//
//                                                // Ele está se atualizando a cada interação do usuário...
//                                                print(tagIndex)
//                                                DispatchQueue.main.async{
//
//                                                    // Toggling That...
//                                                    prod.tags[tagIndex].isExceeded = true
//
//                                                    // Alternando isso...
//                                                    let lastItem =
//                                                    prod.tags[index][tagIndex]
//                                                    // removendo item da linha atual...
//                                                    // inserindo-o como novo item...
//                                                    prod.tags.append([lastItem])
//                                                    prod.tags[index].remove(at:tagIndex)
//                                                }
//                                            }
//
//                                            return Color.clear
//                                        },
//                                        alignment: .trailing
//                                    )
//                                    .clipShape(Capsule())
//                                    .onTapGesture {
//                                        // removendo dados
//                                        prod.tags[index].remove(at: tagIndex)
//                                        // se a matriz interna estiver vazia, removendo-a também ...
//                                        if prod.tags[index].isEmpty{
//                                            prod.tags.remove(at: index)
//                                        }
//                                    }
                            }
//
                        }
                    }
                }
            .padding()
            }
            .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height / 3)
            //Fronteira...
            .background(RoundedRectangle(cornerRadius: 15).stroke(Color.gray.opacity(0.4), lineWidth: 1.5))

            //TextEditor...

            TextEditor(text: $text)
                .padding()
            //Borda com tamanho fixo
                .frame(height: 150)
                .background(RoundedRectangle(cornerRadius: 15).stroke(Color.gray.opacity(0.4), lineWidth: 1.5))
   

            //Adicionar botão...

            Button(action: {

                // Adicionando array vazio se não houver nada...
                if !prod.tags.isEmpty{
                    prod.tags.append(Tag.init(name: text, frequency:0))
                    print(prod.tags[0])
                }

                withAnimation(.default){

                    // Adicionando tag ao último array...
//                    tags[tags.count - 1].append(TagViewModel(tagText: text))
                    // Limpando Texto Antigo no Editor
                    text = ""

                }
            }, label: {
                Text("Add Tag")
                    .font(.title2).fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background(Color.purple)
                    .cornerRadius(4)
            })
            // Desativando o botão quando o texto está vazio...
            .disabled(text == "")
            .opacity(text == "" ? 0.45 : 1)
        }
        .padding()
    }
}
