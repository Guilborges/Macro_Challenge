//
//  TagView.swift
//  Macro_Challenge
//
//  Created by Guilherme Borges on 30/05/23.
//

import SwiftUI

struct TagView: View {
    var maxLimit: Int
    @Binding var tags: [Tag]
    
    
    
    var body: some View {
        
        VStack(alignment: .leading, spacing:  15){
            
            Text("adicione uma tag")
                .font(.callout)
                .foregroundColor(Color(.white))
            
            //ScrollView
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(alignment: .leading, spacing: 10){
                    
                    //Exibindo tags
                    ForEach(getRows(),id: \.self) { rows in
                        
                        HStack(spacing:6){
                            
                            ForEach(rows) { row in
                                // Row view...
                                RowView(tag: row)
                            }
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width - 80, alignment: .leading)
                .padding(.vertical)
            }
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(Color(.white).opacity(0.15),lineWidth: 1)
            )
              
            
            
        }
        ///  Já que onChange funcionará um pouco tarde...
        .onChange(of: tags) { newValue in
            //Obtendo novo valor inserido...
            guard let last = tags.last else{
                return
            }
            //Obtendo o tamanho do texto...
            let font = UIFont.systemFont(ofSize: 16)
            
            let atributes = [NSAttributedString.Key.font: font]
            
            let size = (last.name as NSString).size(withAttributes: atributes)
            
            
            //atualizando tamanho...
            tags[getIndex(tag: last)].size = size.width
        }
        // Animacao...
        .animation(.easeInOut, value: tags)
    }
    
    @ViewBuilder
    func RowView(tag: Tag) ->some View{
        Text(tag.name)
        //aplicando o mesmo tamanho de fonte..
        //senão o tamanho irá variar...
            .font(.system(size: 16))
        // add capsula...
            .padding(.horizontal,14)
            .padding(.vertical,8)
            .background(
            
                Capsule()
                    .fill(Color(.black))
            )
            .foregroundColor(Color(.black))
            .lineLimit(1)
        //Deletar...
            .contentShape(Capsule())
            .contextMenu{
                Button("Deletar"){
                    //Deletando
                    tags.remove(at: getIndex(tag: tag))
                }
            }
    }
    
    func getIndex(tag: Tag) -> Int{
        
        let index = tags.firstIndex { currentTag in
            return tag.id == currentTag.id
        } ?? 0
        
        return index
    }
    
    func getRows() -> [[Tag]]{
        
        var rows: [[Tag]] = []
        var currentRow: [Tag] = []
        
        //calculando a largura do texto...
        var totalWidth: CGFloat = 0
        // Para segurança extra 10
        let screenWidth: CGFloat = UIScreen.main.bounds.width - 90
        
        tags.forEach{ tag in
            
            //atualizando a largura total...
            
            //adicionando o tamanho da cápsula na largura total com espaçamento...
            //14 + 14 + 6 + 6
            // extra 6 para segurança...
            totalWidth += (tag.size + 40)
            
            //verificando se a largura total é maior que o tamanho
            if totalWidth > screenWidth{
                //adicionando linha em linhas...
                //limpando os dados...
                // verificando string longa...
                totalWidth = (!currentRow.isEmpty || rows.isEmpty ? (tag.size + 40) : 0)
                
                rows.append(currentRow)
                currentRow.removeAll()
                currentRow.append(tag)
            }else{
                currentRow.append(tag)
            }
        }
        
        //Verificação segura...
        // se tiver algum valor, sostringir em linhas...
        if !currentRow.isEmpty{
            rows.append(currentRow)
            currentRow.removeAll()
        }
        return rows
    }
    
}
