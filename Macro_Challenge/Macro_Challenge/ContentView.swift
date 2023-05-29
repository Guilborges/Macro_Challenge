//
//  ContentView.swift
//  Macro_Challenge
//
//  Created by Guilherme Borges on 22/05/23.
//

import SwiftUI

struct ContentView: View {

    @State private var price: Double = Double()
    let formatter = NumberFormatter()
    @State var name = String()
    @State var prod: Product
    @State var status: ProductStatus = ProductStatus.washing

    
    var body: some View {
        VStack {
            
            Text("Ola bem vindo ao Brecho")
            
            Form {
                
                TextField("", text: $name)
                TextField("Preço pago na peça", value: $price, formatter: formatter, onEditingChanged: { isFirstResponder in
                }).keyboardType(.numbersAndPunctuation)
            }
        }.padding()
        HStack {
            Button {
                prod.addProduct( tags: [Tag(name: name)], price: price, status: status, acessory: true)
            } label: {
                VStack {
                    Text("adicionar")
                }
            }
        }
        NavigationView {
            List(prod.productList) { product in
                HStack{
                    Image(systemName: "square.and.arrow.up").fixedSize()
                    VStack(alignment: .leading) {
                       
                        Text("Tags:")
                        ForEach(product.tags) { tag in
                            Text(tag.name)
                        }
                        Text("Price: \(product.price.formatted(.number))")
                        Text("Status: \(product.status.rawValue)")
                        Text("Accessory: \(product.acessory ? "Yes" : "No")")
                    }
                  
                    
                }
            }
            .navigationBarTitle("Product List")
        }
        
        HStack {
            Button {
                status = ProductStatus.washing
            } label: {
                Text("Lavando")
            }.padding(10)
            Button {
                status = ProductStatus.sewing
            } label: {
                Text("Manutenção")
            }.padding(10)
            Button {
                status = ProductStatus.store
            } label: {
                Text("Vendendo")
            }.padding(10)
            
        }.position(x:190,y:100)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {

        
        ContentView(prod: Product.init(tags: [Tag(name: "")], price: 200, status: ProductStatus.washing , acessory: true))

    }
}
