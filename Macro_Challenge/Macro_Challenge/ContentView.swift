//
//  ContentView.swift
//  Macro_Challenge
//
//  Created by Guilherme Borges on 22/05/23.
//

import SwiftUI

struct ContentView: View {
    
   
    let formatter = NumberFormatter()
    @State var name = String()
    @State var prod: Product
    @State var purchasedPrice = String()
    @State var status: ProductStatus = ProductStatus.acquarid
    @State var double: Double = 0.0
   
       
     
    
    var body: some View {
        
        VStack {
            GeometryReader { sizeOfView in
                VStack {
                    
                    
                    Text("Ola bem vindo ao Brecho")
                    
                    Form {
                        Section(header: Text("Informe a(s) Tag(s) da peça")){
                            TextField("Tags da peça", text: $name)
                        }
                        Section(header: Text("Informe o preço pago")){
                            TextField("0.00", text: $purchasedPrice).keyboardType(.decimalPad)
                                      }
//                        TextField("Preço pago na peça", value: $purchasedPrice, formatter: formatter ).keyboardType(.numbersAndPunctuation)
                      
                    }
                }.padding()
                VStack {
                    Button {
                        status = ProductStatus.acquarid
                    } label: {
                        HStack {
                            Text("Adquirido")
                        }
                    }.padding(10)
                }.frame(width:  sizeOfView.size.width * 0.25, height: sizeOfView.size.height * 0.3)
                    .background(Color(.red)).cornerRadius(10)
                    .position(CGPoint(x: sizeOfView.size.width * 0.1, y: sizeOfView.size.height * 0.9))
                VStack {
                    Button {
                        status = ProductStatus.washing
                    } label: {
                        
                        Text("Lavando")
                    }.padding(10)
                }.frame(width: sizeOfView.size.width * 0.25, height: sizeOfView.size.height * 0.3)
                    .background(Color(.blue))
                    .cornerRadius(10)
                    .position(CGPoint(x: sizeOfView.size.width * 0.50, y: sizeOfView.size.height * 0.9))
                VStack{
                    Button {
                        status = ProductStatus.washing
                    } label: {
                        Text("Manutenção")
                    }.padding(10)
                }.frame(width:  sizeOfView.size.width * 0.35, height: sizeOfView.size.height * 0.3)
                    .background(Color(.yellow))
                    .cornerRadius(10)
                    .position(CGPoint(x: sizeOfView.size.width * 0.75, y: sizeOfView.size.height * 0.9))
                
                VStack {
                    Button {
                        status = ProductStatus.selling
                    } label: {
                        Text("Vendendo")
                    }.padding(10)
                }.frame(width:  sizeOfView.size.width * 0.25, height: sizeOfView.size.height * 0.3)
                    .background(Color(.red))
                    .cornerRadius(10)
                    .position(CGPoint(x: sizeOfView.size.width * 0.9, y: sizeOfView.size.height * 0.9))
                
                
            }.position(x:190,y:100)
            
            HStack {
                Button {
                    prod.addProduct(tags: [Tag(name: name)], purchasedPrice: prod.convertStringToDouble(text: purchasedPrice), status: status, acessory: true)
                    name = ""
                    purchasedPrice = ""
                    
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
                            Text("Price: \(product.purchasedPrice.formatted(.number))")
                            Text("Status: \(product.status.rawValue)")
                            Text("Accessory: \(product.acessory ? "Yes" : "No")")
                        }
                        
                        
                    }
                }
                .navigationBarTitle("Product List")
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        
        ContentView(prod: Product.init(tags: [Tag(name: "")], purchasedPrice: 200, status: ProductStatus.acquarid , acessory: true))
        
    }
}
