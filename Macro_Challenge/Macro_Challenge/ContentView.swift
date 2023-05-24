//
//  ContentView.swift
//  Macro_Challenge
//
//  Created by Guilherme Borges on 22/05/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            TagView()
                .navigationTitle("Meu Brechó")
            
        }
    }
}

struct TagView : View {
    
    @State var text = ""
    
    @State var tags : [[TagData]] = []
    
    var body: some View {
        
        VStack(spacing:35){
            
            ScrollView{
                // Tag View...
                LazyVStack(alignment: .leading, spacing: 10){
                    
                    //Since were Using indices so we need to specify Id...
                    ForEach(tags.indices, id: \.self){index in
                        
                        HStack{
                            
                            // some times it asks us to specify hashable in Data Model
                            ForEach(tags[index].indices, id: \.self){tagIndex in
                                
                                Text(tags[index][tagIndex].tagText)
                                    .fontWeight(.semibold)
                                    .padding(.vertical,10)
                                    .padding(.horizontal)
                                    .background(Capsule().stroke(Color.black, lineWidth: 1))
                                    .lineLimit(1)
                                // Main logic...
                                    .overlay(
                                        
                                        GeometryReader{reader -> Color in
                                            
                                            //By using MaxX parameter we can use logic and determine if its exceeds or not...
                                            
                                            let maxX = reader.frame(in: .global).maxX
                                            
                                            // Both Paddings = 30+30 = 60
                                            // Plus 10 for Extra...
                                            
                                            // Doing Action Only if the item Exceeds...
                                            if maxX > UIScreen.main.bounds.width - 70 && !tags[index][tagIndex].isExceeded{
                                                
                                                // It is updating to each user interaction...
                                                print(tagIndex)
                                                DispatchQueue.main.async{
                                                    
                                                    // Toggling That...
                                                    tags[index][tagIndex].isExceeded = true
                                                    
                                                    // Getting Last Item...
                                                    let lastItem =
                                                    tags[index][tagIndex]
                                                    // removing Item From Current Row...
                                                    // inserting it as new item...
                                                    tags.append([lastItem])
                                                    tags[index].remove(at:tagIndex)
                                                }
                                            }
                                            
                                            return Color.clear
                                        },
                                        alignment: .trailing
                                    )
                                    .clipShape(Capsule())
                                    .onTapGesture {
                                        // removing Data
                                        tags[index].remove(at: tagIndex)
                                        // if the inside array is empty removing that also...
                                        if tags[index].isEmpty{
                                            tags.remove(at: index)
                                        }
                                    }
                            }
                            
                        }
                    }
                }
            .padding()
            }
            .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height / 3)
            //Border...
            .background(RoundedRectangle(cornerRadius: 15).stroke(Color.gray.opacity(0.4), lineWidth: 1.5))
            
            //TextEditor...
            
            TextEditor(text: $text)
                .padding()
            //Border with fixed size
                .frame(height: 150)
                .background(RoundedRectangle(cornerRadius: 15).stroke(Color.gray.opacity(0.4), lineWidth: 1.5))
            
            //Add Button...
            
            Button(action: {
                
                // Adding empty array if there is nothing...
                if tags.isEmpty{
                    tags.append([])
                }
                
                withAnimation(.default){
                    
                    // Adding tag to last array...
                    tags[tags.count - 1].append(TagData(tagText: text))
                    // Clearing Old Text In Editor
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
            // Disabling Button When Text is Empty...
            .disabled(text == "")
            .opacity(text == "" ? 0.45 : 1)
        }
        .padding()
    }
}

// Tag Data Model...

struct TagData: Identifiable {
    var id = UUID().uuidString
    var tagText : String
    //To Stop Auto update...
    var isExceeded = false
}
