//
//  ContentView.swift
//  Macro_Challenge
//
//  Created by Guilherme Borges on 22/05/23.
//

import SwiftUI
import PhotosUI


struct ContentView: View {
    
    
    
    
    @StateObject var imagePicker = ImagePicker()
    
    
    let formatter = NumberFormatter()
    @State var name = String()
    @State var prod = ViewModelProduct.init()
    @State var purchasedPrice = String()
    @State var status: ProductStatus = ProductStatus.acquarid
    @State var double: Double = 0.0
    
    
    
    
    var body: some View {
        
        ZStack {
            GeometryReader { sizeOfView in
                VStack {
                    HStack {
                        Text("Ola bem vindo ao Brecho")
                    }
                    VStack {
                        //MARK: Forumario para inserir a peça
                        Form {
                            //Sessao para inputar tags
                            Section(header: Text("Informe a(s) Tag(s) da peça")){
                                TextField("Tags da peça", text: $name)
                            }
                            //MARK: Sessao para inputar valor pago na peça
                            Section(header: Text("Informe o preço pago")){
                                TextField("0.00", text: $purchasedPrice).keyboardType(.decimalPad)
                            }
                            //MARK: Sessão para adiconar o status
                            
                            
                            
                            
                        }
                    }
                    HStack {
                        
                        VStack {
                            
                            Button {
                                status = ProductStatus.acquarid
                            } label: {
                                
                                Text("Adquirido")
                                
                            }
                        }.frame(width: 60,height: 60).background(.red).cornerRadius(10)
                        
                        
                        VStack {
                            Button {
                                status = ProductStatus.washing
                            } label: {
                                
                                Text("Lavando")
                            }
                        }.frame(width: 60,height: 60).background(.blue).cornerRadius(10)
                        
                        
                        VStack{
                            Button {
                                status = ProductStatus.maintenance
                            } label: {
                                Text("Manutenção")
                            }
                        }.frame(width: 60,height: 60).background(.yellow).cornerRadius(10)
                        
                        VStack {
                            Button {
                                status = ProductStatus.selling
                            } label: {
                                Text("Vendendo")
                            }
                        }.frame(width: 60,height: 60).background(.purple).cornerRadius(10)
                        VStack {
                            Button {
                                status = ProductStatus.sold
                            } label: {
                                Text("Vendido")
                            }
                        }.frame(width: 60,height: 60).background(.brown).cornerRadius(10)
                        
                        
                    }
                    //MARK: Sessão com botão responsavel por adicionar a peça
                    HStack {
                        Button {
                            prod.addProduct(tags: [Tag(name: name)], purchasedPrice: prod.convertStringToDouble(text: purchasedPrice), status: status, acessory: true,image: imagePicker.image!)
                            name = ""
                            purchasedPrice = ""
                            print($prod.productList[0].purchasedPrice)
                            
                        } label: {
                            VStack {
                                Image(systemName: "checkmark.circle").frame(width: 60,height: 60).scaledToFill()
                            }
                            
                        }
                    }
                    
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing){
                PhotosPicker(selection: $imagePicker.imageSelection){
                    Image(systemName: "photo")
                        .imageScale(.large)
                }
            }
        }
    }
}
