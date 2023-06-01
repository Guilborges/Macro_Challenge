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
    
    @State var text: String = ""
    @Binding var tags: [Tag]
    
    
    
    
    
    
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
                //                VStack {
                //
                //
                //                    Text("Ola bem vindo ao Brecho")
                //
                //                    Form {
                //                        Section(header: Text("Informe a(s) Tag(s) da peça")){
                //                            TextField("Tags da peça", text: $name)
                //                        }
                //                        Section(header: Text("Informe o preço pago")){
                //                            TextField("0.00", text: $purchasedPrice).keyboardType(.decimalPad)
                //                                      }
                ////                        TextField("Preço pago na peça", value: $purchasedPrice, formatter: formatter ).keyboardType(.numbersAndPunctuation)
                //
                //                    }
                //                }.padding()
                VStack(alignment: .leading, spacing:  15){
                    
                    Text("adicione uma tag")
                        .font(.callout)
                        .foregroundColor(Color(.black))
                    
                    //ScrollView Primeiro quadrado
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
                    .frame(width:  sizeOfView.size.width * 0.80, height: sizeOfView.size.height * 0.4)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(Color(.black).opacity(0.15),lineWidth: 1)
                    )
                    .environment(\.colorScheme, .dark)
                    .padding(.vertical,20)
                    
                    TextField("Adicione uma tag", text: $text )
                        .font(.title3)
                        .foregroundColor(.black)
                        .padding(.vertical,10)
                        .padding(.horizontal)
                        .background(
                            
                            RoundedRectangle(cornerRadius: 8)
                                .strokeBorder(Color(.black).opacity(0.2),lineWidth: 1)
                        )
                    // Definindo apenas TextField como escuro..
                        .environment(\.colorScheme, .dark)
                        .padding(.vertical,20)
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
                            .background(Color(.black))
                            .cornerRadius(10)
                        
                    }
                    // Desativa o botão
                    .disabled(text == "")
                    .opacity(text == "" ? 0.6 : 1)
                    
                }
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
                
                
            }
            
            HStack {
                Button {
                    
                    
                    prod.addProduct(tags: tags,  purchasedPrice: prod.convertStringToDouble(text: purchasedPrice), status: status, acessory: true, image: imagePicker.image!)
                    
                    
                    
                    
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
                    .fill(Color(.gray))
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

//struct ContentView_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        
//        
//        ContentView(prod: Product.init(tags: [Tag(name: "")], purchasedPrice: 200, status: ProductStatus.acquarid , acessory: true))
//        

//    }
//}
