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
    @Binding var tags: [Tag] 
    @State var text: String = ""
    
    
    
    var body: some View {
        
        ZStack {
            GeometryReader { sizeOfView in
                VStack {
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
                            .strokeBorder(Color(.white).opacity(0.15),lineWidth: 1)
                    )
                    .environment(\.colorScheme, .dark)
                    .padding(.vertical,20)
                    
                    TextField("Adicione uma tag", text: $text, onCommit: addTag )
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
                                               
                    HStack {
                        Text("Ola bem vindo ao Brecho")
                    }
                    VStack {
                        //MARK: Forumario para inserir a peça
                        Form {
                            if let image = imagePicker.image {
                                image
                                    .resizable()
                                    .scaledToFit()
                            } else  {
                               // let cameraPhoto = cameraPicker.sourceType
                                    
                                Text("clicke")
                            }
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
    func addTag() {
            // Verificar se o texto não está vazio e não é uma tag duplicada
            guard !text.isEmpty, !tags.contains(where: { $0.name == text }) else {
                return
            }

            // Adicionar tag
            tags.append(Tag(name: text))

            // Limpar o TextField
            text = ""
        }
    }
    

