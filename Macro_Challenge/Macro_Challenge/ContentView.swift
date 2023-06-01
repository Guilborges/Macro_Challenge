//
//  ContentView.swift
//  Macro_Challenge
//
//  Created by Guilherme Borges on 22/05/23.
//

import SwiftUI
import PhotosUI


struct ContentView: View {
    
   
    let formatter = NumberFormatter()
    @State var name = String()
    @State var prod: Product
    @State var purchasedPrice = String()
    @State var status: ProductStatus = ProductStatus.acquarid
    @State var double: Double = 0.0
    @StateObject var imagePicker = ImagePicker()
       
     
    
    var body: some View {
        
        VStack {
          //  padding()
        
                if let image = imagePicker.image {
                    image
                        .resizable()
                        .scaledToFit()
                } else  {
                   // let cameraPhoto = cameraPicker.sourceType
                        
                    Text("clicke")
                }
           
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
                }.frame(width:  sizeOfView.size.width * 0.25, height: sizeOfView.size.height * 0.1)
                    .background(Color(.red)).cornerRadius(10)
                    
                    .position(CGPoint(x: sizeOfView.size.width * 0.1, y: sizeOfView.size.height * 0.9))
                VStack {
                    Button {
                        status = ProductStatus.washing
                    } label: {
                        
                        Text("Lavando")
                    }.padding(10)
                }.frame(width: sizeOfView.size.width * 0.25, height: sizeOfView.size.height * 0.1)
                    .background(Color(.blue))
                    .cornerRadius(10)
                    .position(CGPoint(x: sizeOfView.size.width * 0.35, y: sizeOfView.size.height * 0.9))
                VStack{
                    Button {
                        status = ProductStatus.washing
                    } label: {
                        Text("Manutenção")
                    }.padding(10)
                }.frame(width:  sizeOfView.size.width * 0.25, height: sizeOfView.size.height * 0.1)
                    .background(Color(.yellow))
                    .cornerRadius(10)
                    .position(CGPoint(x: sizeOfView.size.width * 0.60, y: sizeOfView.size.height * 0.9))
                
                VStack {
                    Button {
                        status = ProductStatus.selling
                    } label: {
                        Text("Vendendo")
                    }.padding(10)
                }.frame(width:  sizeOfView.size.width * 0.25, height: sizeOfView.size.height * 0.1)
                    .background(Color(.red))
                    .cornerRadius(10)
                    .position(CGPoint(x: sizeOfView.size.width * 0.85, y: sizeOfView.size.height * 0.9))
                
                
            }.position(x:190,y:100)
            
            HStack {
                Button {

                    prod.addProduct(tags: [Tag(name: name)], purchasedPrice: Double(purchasedPrice)!, status: status, acessory: true, image: imagePicker.image!)

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
                    HStack {
                        HStack {
                            product.image.resizable().scaledToFit()
                        }.frame(width: 40,height: 40)
                        HStack{
                            
                            
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
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing){
                        PhotosPicker(selection: $imagePicker.imageSelection){
                            Image(systemName: "photo")
                                .imageScale(.large)
                        }
                    }
                }
                .navigationBarTitle("Product List")
            }
            
        }
        
    }
}

//struct ContentView_Previews: PreviewProvider {
//
//    static var previews: some View {
//
//
//        ContentView(prod: Product.init(tags: [Tag(name: "")], purchasedPrice: 200, status: ProductStatus.acquarid , acessory: true))
//
//    }
//}
