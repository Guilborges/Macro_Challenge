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
                    
                    //Displaying tags
                    
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
//            .overlay(
//                //limit
//                Text("0/\(maxLimit)")
//                    .font(.system(size: 13, weight: .semibold))
//                    .foregroundColor(Color(.white))
//                    .padding(12),
//                    alignment: .bottomTrailing)
            
            
        }
        // Since onChange will perfrom little late...
        .onChange(of: tags) { newValue in
            //Getting newly inserted value...
            guard let last = tags.last else{
                return
            }
            //Getting text size...
            let font = UIFont.systemFont(ofSize: 16)
            
            let atributes = [NSAttributedString.Key.font: font]
            
            let size = (last.name as NSString).size(withAttributes: atributes)
            
            //updating Size...
            tags[getIndex(tag: last)].size = size.width
        }
        // Animation...
        .animation(.easeInOut, value: tags)
    }
    
    @ViewBuilder
    func RowView(tag: Tag) ->some View{
        Text(tag.name)
        //applying same font size..
        //else size will vary...
            .font(.system(size: 16))
        // add capsule...
            .padding(.horizontal,14)
            .padding(.vertical,8)
            .background(
            
                Capsule()
                    .fill(Color(.white))
            )
            .foregroundColor(Color(.black))
            .lineLimit(1)
        //Delete...
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
        
        //calculating text width...
        var totalWidth: CGFloat = 0
        // For safety extra 10
        let screenWidth: CGFloat = UIScreen.main.bounds.width - 90
        
        tags.forEach{ tag in
            
            //updating total width...
            
            //adding the capsule size into total width with spacing...
            //14 + 14 + 6 + 6
            // extra 6 for safety...
            totalWidth += (tag.size + 40)
            
            //checking if totalwidth is greater than size
            if totalWidth > screenWidth{
                //adding row in rows...
                //clearing the data...
                // checking for long string...
                totalWidth = (!currentRow.isEmpty || rows.isEmpty ? (tag.size + 40) : 0)
                
                rows.append(currentRow)
                currentRow.removeAll()
                currentRow.append(tag)
            }else{
                currentRow.append(tag)
            }
        }
        
        //Safe check...
        // if having any value sotring it in rows...
        if !currentRow.isEmpty{
            rows.append(currentRow)
            currentRow.removeAll()
        }
        return rows
    }
    
}
