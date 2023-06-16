//
//  TelaInicial.swift
//  Macro_Challenge
//
//  Created by Guilherme Borges on 06/06/23.
//

import SwiftUI

struct TelaInicial: View {
    @State private var tags: [Tag] = []
//    @State var imagePicker = ImagePicker()
    @State var imagepicker1 = Image(systemName: "")
    public var productList = [Product]()
    @State  var prod: ProductViewModel

    
   // var productList = [Product]()
    
    //@Binding var productList: [Product]
    
    
    var body: some View {
            NavigationView {
                
                VStack(alignment: .leading) { 
                    Text("Meu Brechó")
                        .bold()
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .padding(25)
                    Text("Total de Peças: 500")
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Spacer()
                    ScrollView(.vertical){
                        HStack {
                            ForEach(0..<3) { index in
                                Rectangle()
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(.gray)
                                    .padding(10)
                            }
                        }
                    }
                    Spacer()
                    
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink(destination: ContentView(prod: prod, tags: $tags)) {
                                Image(systemName: "plus")
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                    .padding()
                }
                .frame(maxWidth: .infinity) // Define a largura máxima do VStack
//                List(productList) { product in
//                    VStack(alignment: .leading) {
//                        Text("ID: \(product.id)")
//                        Text("Price: $\(product.purchasedPrice)")
//                        Text("Status: \(product.status.rawValue)")
//                        //Text("Accessory: \(product.accessory ? "Yes" : "No")")
//                        product.image
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(height: 100)
//                    }
//                }
            }
            .navigationBarHidden(true)
        
    }
    
}


